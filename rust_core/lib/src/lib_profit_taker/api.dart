// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

/// Initializes the database by checking if the database file exists.
/// If it exists, just sets the database path; if not, creates a new database.
///
/// This function wraps the `initialize_database` function and handles errors by returning them
/// in a format suitable for Flutter. The initialization will either set the database path or
/// create the database if it does not exist.
///
/// # Arguments
/// - `path`: The path to the SQLite database file.
///
/// # Returns
/// - `Ok(())` if the database was successfully initialized (path set or created).
/// - `Err(error_message)` if there was an error initializing the database, with an error message describing the issue.
void initializeDb({required String path}) =>
    RustLib.instance.api.crateApiInitializeDb(path: path);

/// Fetches a run from the database based on the provided `run_id`.
///
/// This function wraps the `fetch_run_from_db` function and converts the data into a structured model
/// that can be returned to Flutter. The conversion process includes transforming nested structures such as
/// `TotalTimes`, `Phases`, `ShieldChanges`, `LegBreaks`, and `SquadMembers` into their corresponding models.
///
/// # Arguments
/// - `run_id`: The ID of the run to fetch from the database.
///
/// # Returns
/// - `Ok(RunModel)` if the run was successfully retrieved and converted into a structured model.
/// - `Err(error_message)` if there was an error fetching or converting the run, with an error message describing the issue.
RunModel getRunFromDb({required int runId}) =>
    RustLib.instance.api.crateApiGetRunFromDb(runId: runId);

/// Fetches the latest run ID.
///
/// This function wraps the `fetch_latest_run_id` function to make it accessible to Flutter.
/// It retrieves the most recent run ID from the database.
///
/// # Returns
/// - `Ok(Some(run_id))` if the latest run ID is successfully retrieved.
/// - `Ok(None)` if there are no runs in the database.
/// - `Err(error_message)` if there is an error fetching the latest run ID, with an error message describing the issue.
int? getLatestRunId() => RustLib.instance.api.crateApiGetLatestRunId();

/// Fetches the earliest run ID.
///
/// This function wraps the `fetch_earliest_run_id` function to make it accessible to Flutter.
/// It retrieves the first run ID from the database.
///
/// # Returns
/// - `Ok(Some(run_id))` if the earliest run ID is successfully retrieved.
/// - `Ok(None)` if there are no runs in the database.
/// - `Err(error_message)` if there is an error fetching the earliest run ID, with an error message describing the issue.
int? getEarliestRunId() => RustLib.instance.api.crateApiGetEarliestRunId();

/// Fetches the previous run ID relative to a given run ID.
///
/// This function wraps the `fetch_previous_run_id` function to make it accessible to Flutter.
/// It retrieves the previous run ID based on the provided `current_run_id`.
///
/// # Arguments
/// - `current_run_id`: The ID of the current run to find the previous one.
///
/// # Returns
/// - `Ok(Some(run_id))` if the previous run ID is successfully retrieved.
/// - `Ok(None)` if there is no previous run for the given `current_run_id`.
/// - `Err(error_message)` if there is an error fetching the previous run ID, with an error message describing the issue.
int? getPreviousRunId({required int currentRunId}) =>
    RustLib.instance.api.crateApiGetPreviousRunId(currentRunId: currentRunId);

/// Fetches the next run ID relative to a given run ID.
///
/// This function wraps the `fetch_next_run_id` function to make it accessible to Flutter.
/// It retrieves the next run ID based on the provided `current_run_id`.
///
/// # Arguments
/// - `current_run_id`: The ID of the current run to find the next one.
///
/// # Returns
/// - `Ok(Some(run_id))` if the next run ID is successfully retrieved.
/// - `Ok(None)` if there is no next run for the given `current_run_id`.
/// - `Err(error_message)` if there is an error fetching the next run ID, with an error message describing the issue.
int? getNextRunId({required int currentRunId}) =>
    RustLib.instance.api.crateApiGetNextRunId(currentRunId: currentRunId);

/// Checks whether a run exists with the given run ID.
///
/// This function wraps the `run_exists` function to make it accessible to Flutter.
/// It checks if a run exists in the database with the specified `run_id`.
///
/// # Arguments
/// - `run_id`: The ID of the run to check for existence.
///
/// # Returns
/// - `true` if the run exists in the database.
/// - `false` if the run does not exist or there was an error during the check.
bool checkRunExists({required int runId}) =>
    RustLib.instance.api.crateApiCheckRunExists(runId: runId);

/// Deletes a run by its ID from the database.
///
/// This function attempts to delete a run identified by its `run_id` from the database.
/// It returns a result that indicates whether the deletion was successful,
/// and if not, provides a descriptive error message.
///
/// # Arguments
/// - `run_id`: The ID of the run to delete. This ID should correspond to an existing record in the database.
///
/// # Returns
/// - `DeleteRunResult { success: true, error: None }` if the run was successfully deleted.
/// - `DeleteRunResult { success: false, error: Some(error_message) }` if there was an error, including:
///     - `Run not found`: if no run with the given `run_id` exists in the database.
///     - A detailed error message describing the failure if an exception occurred during the deletion process.
///
/// # Errors
/// This function will return `DeleteRunResult` with an error message if:
/// - The database query fails (e.g., a connection issue).
/// - The specified `run_id` does not exist in the database, meaning no rows were deleted.
DeleteRunResult deleteRunFromDb({required int runId}) =>
    RustLib.instance.api.crateApiDeleteRunFromDb(runId: runId);

/// Checks whether the given run is the latest in the database.
///
/// This function wraps the `is_latest_run` function to make it accessible to Flutter.
/// It checks if the run with the given `run_id` is the latest run in the database.
///
/// # Arguments
/// - `run_id`: The ID of the run to check.
///
/// # Returns
/// - `true` if the run is the latest in the database.
/// - `false` if the run is not the latest or an error occurs during the check.
bool checkIfLatestRun({required int runId}) =>
    RustLib.instance.api.crateApiCheckIfLatestRun(runId: runId);

/// Marks the given run as a favorite in the database.
///
/// This function wraps the `mark_as_favorite` function to make it accessible to Flutter.
/// It attempts to mark the run with the given `run_id` as a favorite.
///
/// # Arguments
/// - `run_id`: The ID of the run to be marked as favorite.
///
/// # Returns
/// - `true` if the run was successfully marked as a favorite.
/// - `false` if an error occurs during the insertion.
bool markRunAsFavorite({required int runId}) =>
    RustLib.instance.api.crateApiMarkRunAsFavorite(runId: runId);

/// Removes the given run from the favorites list in the database.
///
/// This function wraps the `unmark_as_favorite` function to make it accessible to Flutter.
/// It attempts to remove the run with the given `run_id` from the favorites list.
///
/// # Arguments
/// - `run_id`: The ID of the run to be removed from favorites.
///
/// # Returns
/// - `true` if the run was successfully removed from favorites.
/// - `false` if an error occurs during the removal.
bool removeRunFromFavorites({required int runId}) =>
    RustLib.instance.api.crateApiRemoveRunFromFavorites(runId: runId);

/// Updates the name of the given run in the database.
///
/// This function wraps the `edit_run_name` function to make it accessible to Flutter.
/// It attempts to update the `run_name` for the run with the given `run_id`.
///
/// # Arguments
/// - `run_id`: The ID of the run to update.
/// - `new_name`: The new name to set for the run.
///
/// # Returns
/// - `true` if the run name was successfully updated.
/// - `false` if an error occurs during the update.
bool updateRunName({required int runId, required String newName}) =>
    RustLib.instance.api.crateApiUpdateRunName(runId: runId, newName: newName);

/// Wrapper function for calling `initialize_parser` and returning a result to Dart.
/// This function handles errors from `initialize_parser` and maps them to a specific error type.
/// It returns `InitializeParserOutcome`, which includes both success and error outcomes.
///
/// # Returns:
/// - `Success`: Indicates that the parser was initialized successfully.
/// - `Error`: Represents different types of errors during initialization, without error messages.
InitializeParserOutcome initializeParserWrapper() =>
    RustLib.instance.api.crateApiInitializeParserWrapper();

/// Represents the result of a delete operation.
class DeleteRunResult {
  final bool success;
  final String? error;

  const DeleteRunResult({
    required this.success,
    this.error,
  });

  @override
  int get hashCode => success.hashCode ^ error.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteRunResult &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          error == other.error;
}

/// Enum representing the possible outcomes of parser initialization.
/// This enum includes a success case and specific error cases, without error messages.
enum InitializeParserOutcome {
  /// Success variant, indicating successful parser initialization.
  success,

  /// Error variant for issues with the environment variable.
  environmentVariableError,

  /// Error variant for issues with opening the log file.
  fileOpenError,

  /// Error variant for issues with seeking the file.
  fileSeekError,

  /// Error variant for issues with spawning the thread.
  threadSpawnError,

  /// Generic error variant for unknown issues.
  unknownError,
  ;
}

class LegBreakModel {
  final double legBreakTime;
  final LegPositionEnum legPosition;
  final int legOrder;

  const LegBreakModel({
    required this.legBreakTime,
    required this.legPosition,
    required this.legOrder,
  });

  @override
  int get hashCode =>
      legBreakTime.hashCode ^ legPosition.hashCode ^ legOrder.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LegBreakModel &&
          runtimeType == other.runtimeType &&
          legBreakTime == other.legBreakTime &&
          legPosition == other.legPosition &&
          legOrder == other.legOrder;
}

enum LegPositionEnum {
  frontLeft,
  frontRight,
  backLeft,
  backRight,
  ;
}

class PhaseModel {
  final int phaseNumber;
  final double totalTime;
  final double totalShieldTime;
  final double totalLegTime;
  final double totalBodyKillTime;
  final double totalPylonTime;
  final List<ShieldChangeModel> shieldChanges;
  final List<LegBreakModel> legBreaks;

  const PhaseModel({
    required this.phaseNumber,
    required this.totalTime,
    required this.totalShieldTime,
    required this.totalLegTime,
    required this.totalBodyKillTime,
    required this.totalPylonTime,
    required this.shieldChanges,
    required this.legBreaks,
  });

  @override
  int get hashCode =>
      phaseNumber.hashCode ^
      totalTime.hashCode ^
      totalShieldTime.hashCode ^
      totalLegTime.hashCode ^
      totalBodyKillTime.hashCode ^
      totalPylonTime.hashCode ^
      shieldChanges.hashCode ^
      legBreaks.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhaseModel &&
          runtimeType == other.runtimeType &&
          phaseNumber == other.phaseNumber &&
          totalTime == other.totalTime &&
          totalShieldTime == other.totalShieldTime &&
          totalLegTime == other.totalLegTime &&
          totalBodyKillTime == other.totalBodyKillTime &&
          totalPylonTime == other.totalPylonTime &&
          shieldChanges == other.shieldChanges &&
          legBreaks == other.legBreaks;
}

class RunModel {
  final int runId;
  final PlatformInt64 timeStamp;
  final String runName;
  final String playerName;
  final bool isBuggedRun;
  final bool isAbortedRun;
  final bool isSoloRun;
  final TotalTimesModel totalTimes;
  final List<PhaseModel> phases;
  final List<SquadMemberModel> squadMembers;

  const RunModel({
    required this.runId,
    required this.timeStamp,
    required this.runName,
    required this.playerName,
    required this.isBuggedRun,
    required this.isAbortedRun,
    required this.isSoloRun,
    required this.totalTimes,
    required this.phases,
    required this.squadMembers,
  });

  @override
  int get hashCode =>
      runId.hashCode ^
      timeStamp.hashCode ^
      runName.hashCode ^
      playerName.hashCode ^
      isBuggedRun.hashCode ^
      isAbortedRun.hashCode ^
      isSoloRun.hashCode ^
      totalTimes.hashCode ^
      phases.hashCode ^
      squadMembers.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RunModel &&
          runtimeType == other.runtimeType &&
          runId == other.runId &&
          timeStamp == other.timeStamp &&
          runName == other.runName &&
          playerName == other.playerName &&
          isBuggedRun == other.isBuggedRun &&
          isAbortedRun == other.isAbortedRun &&
          isSoloRun == other.isSoloRun &&
          totalTimes == other.totalTimes &&
          phases == other.phases &&
          squadMembers == other.squadMembers;
}

class ShieldChangeModel {
  final double shieldTime;
  final StatusEffectEnum statusEffect;

  const ShieldChangeModel({
    required this.shieldTime,
    required this.statusEffect,
  });

  @override
  int get hashCode => shieldTime.hashCode ^ statusEffect.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShieldChangeModel &&
          runtimeType == other.runtimeType &&
          shieldTime == other.shieldTime &&
          statusEffect == other.statusEffect;
}

class SquadMemberModel {
  final String memberName;

  const SquadMemberModel({
    required this.memberName,
  });

  @override
  int get hashCode => memberName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SquadMemberModel &&
          runtimeType == other.runtimeType &&
          memberName == other.memberName;
}

enum StatusEffectEnum {
  impact,
  puncture,
  slash,
  heat,
  cold,
  electric,
  toxin,
  blast,
  radiation,
  gas,
  magnetic,
  viral,
  corrosive,
  noShield,
  ;
}

class TotalTimesModel {
  final double totalDuration;
  final double totalFlightTime;
  final double totalShieldTime;
  final double totalLegTime;
  final double totalBodyTime;
  final double totalPylonTime;

  const TotalTimesModel({
    required this.totalDuration,
    required this.totalFlightTime,
    required this.totalShieldTime,
    required this.totalLegTime,
    required this.totalBodyTime,
    required this.totalPylonTime,
  });

  @override
  int get hashCode =>
      totalDuration.hashCode ^
      totalFlightTime.hashCode ^
      totalShieldTime.hashCode ^
      totalLegTime.hashCode ^
      totalBodyTime.hashCode ^
      totalPylonTime.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalTimesModel &&
          runtimeType == other.runtimeType &&
          totalDuration == other.totalDuration &&
          totalFlightTime == other.totalFlightTime &&
          totalShieldTime == other.totalShieldTime &&
          totalLegTime == other.totalLegTime &&
          totalBodyTime == other.totalBodyTime &&
          totalPylonTime == other.totalPylonTime;
}
