// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:week_of_year/week_of_year.dart';

Future<int> weekly() async {
  // aggregate inputs as week of the year
// This function aggregates inputs as week of the year in Flutter

  // Get the current date and time
  DateTime now = DateTime.now();

  // Return the week of the year as a DateTime object
  return now.weekOfYear;
}
