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

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday before or on the first of the month
  DateTime startCalendar =
      firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after or on the last of the month (spillover into the next month)
  DateTime endCalendar =
      lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar without duplicating dates
  for (DateTime date = startCalendar;
      date.isBefore(
          endCalendar.add(Duration(days: 1))); // Iterate through each day
      date = date.add(Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    // Ensure the last day of the current month is correctly marked (not flagged as next month)
    if (date.day == lastOfMonth.day && date.month == inputDate.month) {
      isPreviousMonth = false;
      isNextMonth =
          false; // Last day of the current month should be handled correctly
    }

    CalendarDayStruct dayStruct = CalendarDayStruct(
        calendarDate: date,
        isPreviousMonth: isPreviousMonth,
        isNextMonth: isNextMonth);

    calendar.add(dayStruct);
  }

  return calendar;
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

DateTime parseEventDate(String dateString) {
  final dateFormat = DateFormat('EEE, MMM d, yyyy');

  try {
    // Parse the string into a DateTime object
    final dateTime = dateFormat.parse(dateString);
    return dateTime;
  } catch (e) {
    // Handle parsing errors (e.g., the string is not in the expected format)
    print('Error parsing date: $e');
    // Return the current date or null if the parsing fails, based on your needs.
    // Returning the current date as a fallback:
    return DateTime.now();
  }
}

List<SavedEventStruct> filterEventsByDateString(
  List<SavedEventStruct> allEvents,
  DateTime selectedDate,
  String dateFormatString,
) {
// 1. Format the Calendar's DateTime object to match the API String format
  String formattedSelectedDate =
      DateFormat(dateFormatString).format(selectedDate);

  // 2. Filter the list: Keep events where the date strings match exactly
  return allEvents
      .where((event) => event.formattedDate == formattedSelectedDate)
      .toList();
}
