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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> callAIWithQuestion(
  String question,
  String eventName,
) async {
  try {
    print('Calling AI with question: $question');
    print('Event name: $eventName');

    final response = await http.post(
      Uri.parse(
          'https://us-east1-eventure-c3558.cloudfunctions.net/askEventAssistant'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userQuestion': question,
        'name': eventName,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['answer'] ?? 'No response from AI';
    } else {
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    print('Error in custom action: $e');
    return 'Error calling AI: $e';
  }
}
