// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SavedEventStruct extends FFFirebaseStruct {
  SavedEventStruct({
    String? title,
    String? formattedDate,
    String? location,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _formattedDate = formattedDate,
        _location = location,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "formattedDate" field.
  String? _formattedDate;
  String get formattedDate => _formattedDate ?? '';
  set formattedDate(String? val) => _formattedDate = val;

  bool hasFormattedDate() => _formattedDate != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static SavedEventStruct fromMap(Map<String, dynamic> data) =>
      SavedEventStruct(
        title: data['title'] as String?,
        formattedDate: data['formattedDate'] as String?,
        location: data['location'] as String?,
        description: data['description'] as String?,
      );

  static SavedEventStruct? maybeFromMap(dynamic data) => data is Map
      ? SavedEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'formattedDate': _formattedDate,
        'location': _location,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'formattedDate': serializeParam(
          _formattedDate,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static SavedEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedEventStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        formattedDate: deserializeParam(
          data['formattedDate'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SavedEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SavedEventStruct &&
        title == other.title &&
        formattedDate == other.formattedDate &&
        location == other.location &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, formattedDate, location, description]);
}

SavedEventStruct createSavedEventStruct({
  String? title,
  String? formattedDate,
  String? location,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedEventStruct(
      title: title,
      formattedDate: formattedDate,
      location: location,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavedEventStruct? updateSavedEventStruct(
  SavedEventStruct? savedEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savedEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavedEventStructData(
  Map<String, dynamic> firestoreData,
  SavedEventStruct? savedEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savedEvent == null) {
    return;
  }
  if (savedEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savedEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savedEventData = getSavedEventFirestoreData(savedEvent, forFieldValue);
  final nestedData = savedEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = savedEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavedEventFirestoreData(
  SavedEventStruct? savedEvent, [
  bool forFieldValue = false,
]) {
  if (savedEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savedEvent.toMap());

  // Add any Firestore field values
  savedEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavedEventListFirestoreData(
  List<SavedEventStruct>? savedEvents,
) =>
    savedEvents?.map((e) => getSavedEventFirestoreData(e, true)).toList() ?? [];
