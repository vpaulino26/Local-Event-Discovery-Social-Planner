// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CalenderDayStruct extends FFFirebaseStruct {
  CalenderDayStruct({
    bool? isPrevMonth,
    bool? isNextMonth,
    DateTime? calenderDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPrevMonth = isPrevMonth,
        _isNextMonth = isNextMonth,
        _calenderDate = calenderDate,
        super(firestoreUtilData);

  // "isPrevMonth" field.
  bool? _isPrevMonth;
  bool get isPrevMonth => _isPrevMonth ?? false;
  set isPrevMonth(bool? val) => _isPrevMonth = val;

  bool hasIsPrevMonth() => _isPrevMonth != null;

  // "IsNextMonth" field.
  bool? _isNextMonth;
  bool get isNextMonth => _isNextMonth ?? false;
  set isNextMonth(bool? val) => _isNextMonth = val;

  bool hasIsNextMonth() => _isNextMonth != null;

  // "CalenderDate" field.
  DateTime? _calenderDate;
  DateTime? get calenderDate => _calenderDate;
  set calenderDate(DateTime? val) => _calenderDate = val;

  bool hasCalenderDate() => _calenderDate != null;

  static CalenderDayStruct fromMap(Map<String, dynamic> data) =>
      CalenderDayStruct(
        isPrevMonth: data['isPrevMonth'] as bool?,
        isNextMonth: data['IsNextMonth'] as bool?,
        calenderDate: data['CalenderDate'] as DateTime?,
      );

  static CalenderDayStruct? maybeFromMap(dynamic data) => data is Map
      ? CalenderDayStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isPrevMonth': _isPrevMonth,
        'IsNextMonth': _isNextMonth,
        'CalenderDate': _calenderDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPrevMonth': serializeParam(
          _isPrevMonth,
          ParamType.bool,
        ),
        'IsNextMonth': serializeParam(
          _isNextMonth,
          ParamType.bool,
        ),
        'CalenderDate': serializeParam(
          _calenderDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static CalenderDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalenderDayStruct(
        isPrevMonth: deserializeParam(
          data['isPrevMonth'],
          ParamType.bool,
          false,
        ),
        isNextMonth: deserializeParam(
          data['IsNextMonth'],
          ParamType.bool,
          false,
        ),
        calenderDate: deserializeParam(
          data['CalenderDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'CalenderDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalenderDayStruct &&
        isPrevMonth == other.isPrevMonth &&
        isNextMonth == other.isNextMonth &&
        calenderDate == other.calenderDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isPrevMonth, isNextMonth, calenderDate]);
}

CalenderDayStruct createCalenderDayStruct({
  bool? isPrevMonth,
  bool? isNextMonth,
  DateTime? calenderDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalenderDayStruct(
      isPrevMonth: isPrevMonth,
      isNextMonth: isNextMonth,
      calenderDate: calenderDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalenderDayStruct? updateCalenderDayStruct(
  CalenderDayStruct? calenderDay, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calenderDay
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalenderDayStructData(
  Map<String, dynamic> firestoreData,
  CalenderDayStruct? calenderDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calenderDay == null) {
    return;
  }
  if (calenderDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calenderDay.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calenderDayData =
      getCalenderDayFirestoreData(calenderDay, forFieldValue);
  final nestedData =
      calenderDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calenderDay.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalenderDayFirestoreData(
  CalenderDayStruct? calenderDay, [
  bool forFieldValue = false,
]) {
  if (calenderDay == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calenderDay.toMap());

  // Add any Firestore field values
  calenderDay.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalenderDayListFirestoreData(
  List<CalenderDayStruct>? calenderDays,
) =>
    calenderDays?.map((e) => getCalenderDayFirestoreData(e, true)).toList() ??
    [];
