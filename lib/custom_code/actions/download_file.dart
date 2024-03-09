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

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

import 'dart:typed_data';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

Future<String?> downloadFile(String pathURL) async {
  try {
    // Get the file name from the URL
    String fileName = pathURL.split('/').last;

    // Download the file using http package
    final response = await http.get(Uri.parse(pathURL));

    if (response.statusCode == 200) {
      final Uint8List fileBytes = response.bodyBytes;

      // Save the file using the web-specific file saving method
      final blob = html.Blob([fileBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName + '.pdf')
        ..click();
      html.Url.revokeObjectUrl(url);

      return fileName; // You can return the file name or any other identifier.
    } else {
      throw Exception('Failed to download file');
    }
  } catch (e) {
    // Handle exceptions here, e.g., network errors
    print('Error downloading file: $e');
    return null; // Return null or throw an exception depending on your error-handling strategy
  }
}
