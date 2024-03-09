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

Future<List<int>> accType() async {
  int studentCount = 0;
  int instructorCount = 0;

  // Access the users collection with a filtered query
  FirebaseFirestore.instance
      .collection('users')
      .where('acc_type', whereIn: ['student', 'instructor'])
      .get()
      .then((querySnapshot) {
        // Loop through each document
        querySnapshot.docs.forEach((doc) {
          // Check account type and increment count
          switch (doc.data()['acc_type'].toString().toLowerCase()) {
            case 'student':
              studentCount++;
              break;
            case 'instructor':
              instructorCount++;
              break;
          }
        });
      });

  // Return the count list
  return [studentCount, instructorCount];
}
