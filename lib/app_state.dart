import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _EventRad = prefs.getDouble('ff_EventRad') ?? _EventRad;
    });
    _safeInit(() {
      _myCalendarEvents = prefs
              .getStringList('ff_myCalendarEvents')
              ?.map((x) {
                try {
                  return SavedEventStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _myCalendarEvents;
    });
    _safeInit(() {
      _calDate = prefs.getString('ff_calDate') ?? _calDate;
    });
    _safeInit(() {
      _myEvents = prefs
              .getStringList('ff_myEvents')
              ?.map((x) {
                try {
                  return SavedEventStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _myEvents;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _EventRad = 0.0;
  double get EventRad => _EventRad;
  set EventRad(double value) {
    _EventRad = value;
    prefs.setDouble('ff_EventRad', value);
  }

  List<String> _selectedInterests = [];
  List<String> get selectedInterests => _selectedInterests;
  set selectedInterests(List<String> value) {
    _selectedInterests = value;
  }

  void addToSelectedInterests(String value) {
    selectedInterests.add(value);
  }

  void removeFromSelectedInterests(String value) {
    selectedInterests.remove(value);
  }

  void removeAtIndexFromSelectedInterests(int index) {
    selectedInterests.removeAt(index);
  }

  void updateSelectedInterestsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedInterests[index] = updateFn(_selectedInterests[index]);
  }

  void insertAtIndexInSelectedInterests(int index, String value) {
    selectedInterests.insert(index, value);
  }

  List<String> _activityOptions = [
    'Concerts',
    'Comedy Shows',
    'Theater & Plays',
    'Art Shows',
    'Museums',
    'Karaoke',
    'Networking',
    'Sports',
    'Food & Dining',
    'Clubs & Nightlife',
    'Game Nights',
    'Movies & Cinema'
  ];
  List<String> get activityOptions => _activityOptions;
  set activityOptions(List<String> value) {
    _activityOptions = value;
  }

  void addToActivityOptions(String value) {
    activityOptions.add(value);
  }

  void removeFromActivityOptions(String value) {
    activityOptions.remove(value);
  }

  void removeAtIndexFromActivityOptions(int index) {
    activityOptions.removeAt(index);
  }

  void updateActivityOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    activityOptions[index] = updateFn(_activityOptions[index]);
  }

  void insertAtIndexInActivityOptions(int index, String value) {
    activityOptions.insert(index, value);
  }

  List<String> _eventName = [];
  List<String> get eventName => _eventName;
  set eventName(List<String> value) {
    _eventName = value;
  }

  void addToEventName(String value) {
    eventName.add(value);
  }

  void removeFromEventName(String value) {
    eventName.remove(value);
  }

  void removeAtIndexFromEventName(int index) {
    eventName.removeAt(index);
  }

  void updateEventNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventName[index] = updateFn(_eventName[index]);
  }

  void insertAtIndexInEventName(int index, String value) {
    eventName.insert(index, value);
  }

  List<String> _eventStartTime = [];
  List<String> get eventStartTime => _eventStartTime;
  set eventStartTime(List<String> value) {
    _eventStartTime = value;
  }

  void addToEventStartTime(String value) {
    eventStartTime.add(value);
  }

  void removeFromEventStartTime(String value) {
    eventStartTime.remove(value);
  }

  void removeAtIndexFromEventStartTime(int index) {
    eventStartTime.removeAt(index);
  }

  void updateEventStartTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventStartTime[index] = updateFn(_eventStartTime[index]);
  }

  void insertAtIndexInEventStartTime(int index, String value) {
    eventStartTime.insert(index, value);
  }

  List<String> _eventEndTime = [];
  List<String> get eventEndTime => _eventEndTime;
  set eventEndTime(List<String> value) {
    _eventEndTime = value;
  }

  void addToEventEndTime(String value) {
    eventEndTime.add(value);
  }

  void removeFromEventEndTime(String value) {
    eventEndTime.remove(value);
  }

  void removeAtIndexFromEventEndTime(int index) {
    eventEndTime.removeAt(index);
  }

  void updateEventEndTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventEndTime[index] = updateFn(_eventEndTime[index]);
  }

  void insertAtIndexInEventEndTime(int index, String value) {
    eventEndTime.insert(index, value);
  }

  List<String> _eventTicketing = [];
  List<String> get eventTicketing => _eventTicketing;
  set eventTicketing(List<String> value) {
    _eventTicketing = value;
  }

  void addToEventTicketing(String value) {
    eventTicketing.add(value);
  }

  void removeFromEventTicketing(String value) {
    eventTicketing.remove(value);
  }

  void removeAtIndexFromEventTicketing(int index) {
    eventTicketing.removeAt(index);
  }

  void updateEventTicketingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventTicketing[index] = updateFn(_eventTicketing[index]);
  }

  void insertAtIndexInEventTicketing(int index, String value) {
    eventTicketing.insert(index, value);
  }

  List<String> _eventPricing = [];
  List<String> get eventPricing => _eventPricing;
  set eventPricing(List<String> value) {
    _eventPricing = value;
  }

  void addToEventPricing(String value) {
    eventPricing.add(value);
  }

  void removeFromEventPricing(String value) {
    eventPricing.remove(value);
  }

  void removeAtIndexFromEventPricing(int index) {
    eventPricing.removeAt(index);
  }

  void updateEventPricingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    eventPricing[index] = updateFn(_eventPricing[index]);
  }

  void insertAtIndexInEventPricing(int index, String value) {
    eventPricing.insert(index, value);
  }

  String _userCity = '';
  String get userCity => _userCity;
  set userCity(String value) {
    _userCity = value;
  }

  String _userStateCode = '';
  String get userStateCode => _userStateCode;
  set userStateCode(String value) {
    _userStateCode = value;
  }

  int _page = 0;
  int get page => _page;
  set page(int value) {
    _page = value;
  }

  String _joinedInterests = '';
  String get joinedInterests => _joinedInterests;
  set joinedInterests(String value) {
    _joinedInterests = value;
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  List<dynamic> _apiResult = [];
  List<dynamic> get apiResult => _apiResult;
  set apiResult(List<dynamic> value) {
    _apiResult = value;
  }

  void addToApiResult(dynamic value) {
    apiResult.add(value);
  }

  void removeFromApiResult(dynamic value) {
    apiResult.remove(value);
  }

  void removeAtIndexFromApiResult(int index) {
    apiResult.removeAt(index);
  }

  void updateApiResultAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    apiResult[index] = updateFn(_apiResult[index]);
  }

  void insertAtIndexInApiResult(int index, dynamic value) {
    apiResult.insert(index, value);
  }

  List<dynamic> _searchResult = [];
  List<dynamic> get searchResult => _searchResult;
  set searchResult(List<dynamic> value) {
    _searchResult = value;
  }

  void addToSearchResult(dynamic value) {
    searchResult.add(value);
  }

  void removeFromSearchResult(dynamic value) {
    searchResult.remove(value);
  }

  void removeAtIndexFromSearchResult(int index) {
    searchResult.removeAt(index);
  }

  void updateSearchResultAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    searchResult[index] = updateFn(_searchResult[index]);
  }

  void insertAtIndexInSearchResult(int index, dynamic value) {
    searchResult.insert(index, value);
  }

  String _googleToken = '';
  String get googleToken => _googleToken;
  set googleToken(String value) {
    _googleToken = value;
  }

  String _tempUserQuestion = '';
  String get tempUserQuestion => _tempUserQuestion;
  set tempUserQuestion(String value) {
    _tempUserQuestion = value;
  }

  String _tempEventName = '';
  String get tempEventName => _tempEventName;
  set tempEventName(String value) {
    _tempEventName = value;
  }

  /// Switches the displayed info from ticketmaster to custom events
  bool _eventswtich = false;
  bool get eventswtich => _eventswtich;
  set eventswtich(bool value) {
    _eventswtich = value;
  }

  List<SavedEventStruct> _myCalendarEvents = [];
  List<SavedEventStruct> get myCalendarEvents => _myCalendarEvents;
  set myCalendarEvents(List<SavedEventStruct> value) {
    _myCalendarEvents = value;
    prefs.setStringList(
        'ff_myCalendarEvents', value.map((x) => x.serialize()).toList());
  }

  void addToMyCalendarEvents(SavedEventStruct value) {
    myCalendarEvents.add(value);
    prefs.setStringList('ff_myCalendarEvents',
        _myCalendarEvents.map((x) => x.serialize()).toList());
  }

  void removeFromMyCalendarEvents(SavedEventStruct value) {
    myCalendarEvents.remove(value);
    prefs.setStringList('ff_myCalendarEvents',
        _myCalendarEvents.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMyCalendarEvents(int index) {
    myCalendarEvents.removeAt(index);
    prefs.setStringList('ff_myCalendarEvents',
        _myCalendarEvents.map((x) => x.serialize()).toList());
  }

  void updateMyCalendarEventsAtIndex(
    int index,
    SavedEventStruct Function(SavedEventStruct) updateFn,
  ) {
    myCalendarEvents[index] = updateFn(_myCalendarEvents[index]);
    prefs.setStringList('ff_myCalendarEvents',
        _myCalendarEvents.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMyCalendarEvents(int index, SavedEventStruct value) {
    myCalendarEvents.insert(index, value);
    prefs.setStringList('ff_myCalendarEvents',
        _myCalendarEvents.map((x) => x.serialize()).toList());
  }

  String _calDate = '';
  String get calDate => _calDate;
  set calDate(String value) {
    _calDate = value;
    prefs.setString('ff_calDate', value);
  }

  List<SavedEventStruct> _myEvents = [];
  List<SavedEventStruct> get myEvents => _myEvents;
  set myEvents(List<SavedEventStruct> value) {
    _myEvents = value;
    prefs.setStringList(
        'ff_myEvents', value.map((x) => x.serialize()).toList());
  }

  void addToMyEvents(SavedEventStruct value) {
    myEvents.add(value);
    prefs.setStringList(
        'ff_myEvents', _myEvents.map((x) => x.serialize()).toList());
  }

  void removeFromMyEvents(SavedEventStruct value) {
    myEvents.remove(value);
    prefs.setStringList(
        'ff_myEvents', _myEvents.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMyEvents(int index) {
    myEvents.removeAt(index);
    prefs.setStringList(
        'ff_myEvents', _myEvents.map((x) => x.serialize()).toList());
  }

  void updateMyEventsAtIndex(
    int index,
    SavedEventStruct Function(SavedEventStruct) updateFn,
  ) {
    myEvents[index] = updateFn(_myEvents[index]);
    prefs.setStringList(
        'ff_myEvents', _myEvents.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMyEvents(int index, SavedEventStruct value) {
    myEvents.insert(index, value);
    prefs.setStringList(
        'ff_myEvents', _myEvents.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
