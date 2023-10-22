// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future hideFutureDate(DateTime? dateHide) async {
  // hide future dates in calander view
// First, we need to get the current date
  DateTime currentDate = DateTime.now();

  // Then, we compare the dateHide parameter with the current date
  if (dateHide != null && dateHide.isAfter(currentDate)) {
    // If the dateHide is in the future, we return null to hide it in the calendar view
    return null;
  } else {
    // If the dateHide is in the past or is null, we return the date to show it in the calendar view
    return dateHide;
  }
}
