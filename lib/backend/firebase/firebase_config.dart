import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDuEr9kpGY_aniJ297YTMmaSVnD1Uhk2As",
            authDomain: "heypockets1-2e3c8.firebaseapp.com",
            projectId: "heypockets1-2e3c8",
            storageBucket: "heypockets1-2e3c8.appspot.com",
            messagingSenderId: "1010776847321",
            appId: "1:1010776847321:web:6a4b0d01ae6f19d04edfc8",
            measurementId: "G-3PF3T08KLB"));
  } else {
    await Firebase.initializeApp();
  }
}
