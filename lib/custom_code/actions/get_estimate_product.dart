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

Future<DocumentReference> getEstimateProduct(
    DocumentReference? productReference) async {
  // write a method for getting the document form document reference
  if (productReference == null) {
    return Future.error("Product reference is null");
  }
  DocumentSnapshot productSnapshot = await productReference.get();
  print(productSnapshot);
  if (!productSnapshot.exists) {
    return Future.error("Product does not exist");
  }
  return productReference;
}
