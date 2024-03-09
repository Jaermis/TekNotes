import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAZCC-d-CyrJIKJVqEE7QyVdGKMFpA0bNM",
            authDomain: "teknotes-6dbcd.firebaseapp.com",
            projectId: "teknotes-6dbcd",
            storageBucket: "teknotes-6dbcd.appspot.com",
            messagingSenderId: "654728577595",
            appId: "1:654728577595:web:c9b6813facc19d89e1d21e",
            measurementId: "G-MZJ4CS5JHX"));
  } else {
    await Firebase.initializeApp();
  }
}
