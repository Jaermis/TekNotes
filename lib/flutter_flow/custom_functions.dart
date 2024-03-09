import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime plusThreeMonths() {
  // add three months from current date time
  DateTime currentDate = DateTime.now();
  DateTime threeMonthsLater = currentDate.add(Duration(days: 90));
  return threeMonthsLater;
}

List<int> acctypeCount() {
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

int monthGetter() {
  // code to get the current month of the year
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  return currentMonth;
}
