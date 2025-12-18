import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomEventsRecord extends FirestoreRecord {
  CustomEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CEName" field.
  String? _cEName;
  String get cEName => _cEName ?? '';
  bool hasCEName() => _cEName != null;

  // "CEDescription" field.
  String? _cEDescription;
  String get cEDescription => _cEDescription ?? '';
  bool hasCEDescription() => _cEDescription != null;

  // "CEEnd" field.
  DateTime? _cEEnd;
  DateTime? get cEEnd => _cEEnd;
  bool hasCEEnd() => _cEEnd != null;

  // "CEDate" field.
  String? _cEDate;
  String get cEDate => _cEDate ?? '';
  bool hasCEDate() => _cEDate != null;

  // "CELocation" field.
  String? _cELocation;
  String get cELocation => _cELocation ?? '';
  bool hasCELocation() => _cELocation != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "CEStart" field.
  String? _cEStart;
  String get cEStart => _cEStart ?? '';
  bool hasCEStart() => _cEStart != null;

  void _initializeFields() {
    _cEName = snapshotData['CEName'] as String?;
    _cEDescription = snapshotData['CEDescription'] as String?;
    _cEEnd = snapshotData['CEEnd'] as DateTime?;
    _cEDate = snapshotData['CEDate'] as String?;
    _cELocation = snapshotData['CELocation'] as String?;
    _image = snapshotData['image'] as String?;
    _cEStart = snapshotData['CEStart'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CustomEvents');

  static Stream<CustomEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomEventsRecord.fromSnapshot(s));

  static Future<CustomEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomEventsRecord.fromSnapshot(s));

  static CustomEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomEventsRecordData({
  String? cEName,
  String? cEDescription,
  DateTime? cEEnd,
  String? cEDate,
  String? cELocation,
  String? image,
  String? cEStart,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CEName': cEName,
      'CEDescription': cEDescription,
      'CEEnd': cEEnd,
      'CEDate': cEDate,
      'CELocation': cELocation,
      'image': image,
      'CEStart': cEStart,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomEventsRecordDocumentEquality
    implements Equality<CustomEventsRecord> {
  const CustomEventsRecordDocumentEquality();

  @override
  bool equals(CustomEventsRecord? e1, CustomEventsRecord? e2) {
    return e1?.cEName == e2?.cEName &&
        e1?.cEDescription == e2?.cEDescription &&
        e1?.cEEnd == e2?.cEEnd &&
        e1?.cEDate == e2?.cEDate &&
        e1?.cELocation == e2?.cELocation &&
        e1?.image == e2?.image &&
        e1?.cEStart == e2?.cEStart;
  }

  @override
  int hash(CustomEventsRecord? e) => const ListEquality().hash([
        e?.cEName,
        e?.cEDescription,
        e?.cEEnd,
        e?.cEDate,
        e?.cELocation,
        e?.image,
        e?.cEStart
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomEventsRecord;
}
