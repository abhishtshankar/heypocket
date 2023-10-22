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

// ...
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAppManager {
  static FirebaseApp? _secondaryApp;

  static Future<FirebaseApp> getSecondaryApp() async {
    if (_secondaryApp != null) {
      return _secondaryApp!;
    }

    _secondaryApp = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
    return _secondaryApp!;
  }
}

Future<String?> createUserWithoutLogin(
    String email, String password, bool isStaff) async {
  String? returnUid;
  FirebaseApp app = await FirebaseAppManager.getSecondaryApp();

  try {
    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    if (user != null) {
      returnUid = user.uid;

      // Create a Firestore document for the user
      final userDocRef = FirebaseFirestore.instanceFor(app: app)
          .collection('users')
          .doc(user.uid);

      await userDocRef.set({
        'email': email,
        'isStaff': isStaff,
        // Add more user data here if needed
      });

      // Debug message
      print('Firestore document created for user ${user.uid}');
    } else {
      print('Error: User is null');
    }
  } on FirebaseAuthException catch (e) {
    print('Error: ${e.message}');
    // Handle the FirebaseAuth error
  } on FirebaseException catch (e) {
    print('Firestore Error: ${e.message}');
    // Handle the Firestore error
  } catch (e) {
    print('Unexpected Error: $e');
    // Handle other unexpected errors
  }

  return returnUid;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
