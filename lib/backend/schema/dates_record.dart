import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatesRecord extends FirestoreRecord {
  DatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "calender" field.
  DateTime? _calender;
  DateTime? get calender => _calender;
  bool hasCalender() => _calender != null;

  void _initializeFields() {
    _calender = snapshotData['calender'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dates');

  static Stream<DatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatesRecord.fromSnapshot(s));

  static Future<DatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatesRecord.fromSnapshot(s));

  static DatesRecord fromSnapshot(DocumentSnapshot snapshot) => DatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatesRecordData({
  DateTime? calender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'calender': calender,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatesRecordDocumentEquality implements Equality<DatesRecord> {
  const DatesRecordDocumentEquality();

  @override
  bool equals(DatesRecord? e1, DatesRecord? e2) {
    return e1?.calender == e2?.calender;
  }

  @override
  int hash(DatesRecord? e) => const ListEquality().hash([e?.calender]);

  @override
  bool isValidKey(Object? o) => o is DatesRecord;
}
