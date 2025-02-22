//! This module provides functionality to format and pretty-print details
//! of a Profit-Taker run, including total durations, phase-wise details, 
//! and summaries of the times taken for specific parts of a run like shield changes, 
//! leg breaks, and pylons.
//!
//! # Functions
//!
//! - [`format_duration`]: Formats a given duration in seconds into a human-readable string.
//! - [`pretty_print_run`]: Generates a detailed, human-readable string representation of a Profit-Taker run.
//!
//! The output will display the total time, flight duration, and detailed phase information.
use lib_profit_taker_core::Run;


/// Formats a given duration in seconds into a human-readable string.
///
/// This function takes a `total_seconds` value and converts it into a formatted string
/// with the format `Xm Ys ZZZms` if the duration includes minutes, or `Ys ZZZms` if
/// there are no minutes. It handles both positive and negative durations.
///
/// # Arguments
///
/// * `total_seconds` - A floating-point value representing the total duration in seconds.
///
/// # Returns
///
/// A `String` containing the formatted duration.
///
/// # Usage
///
/// ```
/// use your_crate::format_duration;
///
/// let formatted_time = format_duration(45.123);
/// assert_eq!(formatted_time, "45s 123ms");
/// ```
fn format_duration(total_seconds: f64) -> String {
    let total_seconds_abs = total_seconds.abs();
    let minutes = (total_seconds_abs / 60.0).floor() as u64;
    let remaining_seconds = total_seconds_abs % 60.0;
    let seconds = remaining_seconds.floor() as u64;
    let milliseconds = ((remaining_seconds - seconds as f64) * 1000.0).round() as u64;

    if minutes > 0 {
        format!("{minutes}m {seconds}s {milliseconds:03}ms")
    } else {
        format!("{seconds}s {milliseconds:03}ms")
    }
}


/// Pretty-prints the details of a Profit-Taker run in a human-readable format.
///
/// This function generates a detailed summary of the Profit-Taker run, including:
/// - Total duration and flight time.
/// - Phase-wise details such as shield changes, leg breaks, body killed time, and pylon phases.
/// - A summary of total times for shield changes, leg breaks, body killed, and pylons.
///
/// # Arguments
///
/// * `run` - A reference to the `Run` instance, which contains all the data for the Profit-Taker run.
///
/// # Returns
///
/// A formatted string containing the pretty-printed details of the Profit-Taker run.
pub fn pretty_print_run(run: &Run) -> String {
    let total_flight_time = run.total_times.total_flight_time;
    let total_time = run.total_times.total_time;
    let total_fight_duration: f64 = run.total_times.total_time - total_flight_time;

    let formatted_total = format_duration(total_time);
    let formatted_flight = format!("{total_flight_time:.3}s");
    let formatted_fight = format_duration(total_fight_duration);

    let mut output = String::new();

    // Header
    output.push('\n');
    output.push_str("------------------------------------------------------------------------\n");
    output.push_str(&format!(
        "Profit-Taker Run #{} by {} cleared in {}\n\n",
        run.run_id, run.player_name, formatted_total
    ));
    output.push_str(&format!("From elevator to Profit-Taker took {formatted_flight}. Fight duration: {formatted_fight}.\n\n"));

    // Phases
    for phase in &run.phases {
        let phase_time = phase.total_time;
        output.push_str(&format!(
            "> Phase {} [{phase_time:.3}]\n",
            phase.phase_number
        ));

        // Shield changes
        if !phase.shield_changes.is_empty() {
            let shield_sum: f64 = phase.shield_changes.iter().map(|s| s.shield_time).sum();
            let shield_parts: Vec<String> = phase
                .shield_changes
                .iter()
                .map(|s| format!("{:?} {:.3}s", s.status_effect, s.shield_time))
                .collect();

            output.push_str(&format!(
                " Shield change:   {shield_sum:.3}s - {}\n",
                shield_parts.join(" | ")
            ));
        }

        // Leg breaks
        if !phase.leg_breaks.is_empty() {
            let leg_sum: f64 = phase.leg_breaks.iter().map(|l| l.leg_break_time).sum();
            let leg_parts: Vec<String> = phase
                .leg_breaks
                .iter()
                .map(|l| format!("{:.3}s", l.leg_break_time))
                .collect();
            output.push_str(&format!(
                " Leg break:       {leg_sum:.3}s - {}\n",
                leg_parts.join(" | ")
            ));
        }

        // Body killed
        if phase.total_body_kill_time > 0.0 {
            output.push_str(&format!(
                " Body killed:     {:.3}s\n",
                phase.total_body_kill_time
            ));
        }

        // Pylons
        if phase.total_pylon_time > 0.0 || phase.phase_number == 3 {
            output.push_str(&format!(
                " Pylons:          {:.3}s\n",
                phase.total_pylon_time
            ));
        }

        output.push('\n');
    }

    // Sum of parts
    let sum_shield: f64 = run.total_times.total_shield_time;
    let sum_leg: f64 = run.total_times.total_leg_time;
    let sum_body: f64 = run.total_times.total_body_time;
    let sum_pylon: f64 = run.total_times.total_pylon_time;
    let sum_total = sum_shield + sum_leg + sum_body + sum_pylon;
    let formatted_sum_total = sum_total;

    output.push_str(&format!("> Sum of parts [{formatted_sum_total:.3}]\n"));
    output.push_str(&format!(" Shield change:  {sum_shield:.3}s\n"));
    output.push_str(&format!(" Leg Break:      {sum_leg:.3}s\n"));
    output.push_str(&format!(" Body Killed:    {sum_body:.3}s\n"));
    output.push_str(&format!(" Pylons:         {sum_pylon:.3}s\n"));

    output.push_str("------------------------------------------------------------------------\n");

    output
}
