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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> callTicketmasterAPI(
  String city,
  String state,
  double radius,
  List<String> interests,
  String searchQuery,
) async {
  try {
    // Build interest parameters for URL
    final interestsParam = interests.map((i) => 'interests[]=$i').join('&');

    // Safely encode search text (handle null or empty)
    final encodedSearch = (searchQuery != null && searchQuery.trim().isNotEmpty)
        ? Uri.encodeComponent(searchQuery.trim())
        : '';

    // Construct URL including searchQuery only if it exists
    final url = Uri.parse(
      'https://us-east1-eventure-c3558.cloudfunctions.net/getTicketmasterEvents'
      '?city=$city&state=$state&radius=$radius&$interestsParam'
      '${encodedSearch.isNotEmpty ? '&searchQuery=$encodedSearch' : ''}',
    );

    // Perform GET request
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['events'] ?? [];
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Exception: $e');
    return [];
  }
}
