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

Future dataExists(DateTime? date) async {
  // collection created on that date, no collection should be created again
// First, we need to check if the collection already exists in Firestore
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('collections')
      .where('createdOn', isEqualTo: date)
      .get();

  // If the collection already exists, return true
  if (snapshot.docs.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
