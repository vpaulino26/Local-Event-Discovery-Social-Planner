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
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool canAddInterest(
  List<String> selectedInterests,
  int maxLimit,
) {
  return selectedInterests.length < maxLimit;
}

bool hasMinimumInterests(List<String> selectedInterests) {
  return selectedInterests.length >= 3;
}

bool hasLessThanThreeInterests(List<String> selectedInterests) {
  return selectedInterests.length < 3;
}

bool isInterestCountValid(
  List<String> selectedInterests,
  int minLimit,
  int maxLimit,
) {
  final count = selectedInterests.length;

  // valid only when count is between minLimit and maxLimit (inclusive)
  return count >= minLimit && count <= maxLimit;
}
