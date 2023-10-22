import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttednacenewRecord extends FirestoreRecord {
  AttednacenewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "attendance" field.
  List<AttendanceStruct>? _attendance;
  List<AttendanceStruct> get attendance => _attendance ?? const [];
  bool hasAttendance() => _attendance != null;

  // "absent" field.
  List<String>? _absent;
  List<String> get absent => _absent ?? const [];
  bool hasAbsent() => _absent != null;

  // "present" field.
  List<String>? _present;
  List<String> get present => _present ?? const [];
  bool hasPresent() => _present != null;

  // "userrefe" field.
  DocumentReference? _userrefe;
  DocumentReference? get userrefe => _userrefe;
  bool hasUserrefe() => _userrefe != null;

  // "projectref" field.
  DocumentReference? _projectref;
  DocumentReference? get projectref => _projectref;
  bool hasProjectref() => _projectref != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdat = snapshotData['createdat'] as DateTime?;
    _date = snapshotData['Date'] as DateTime?;
    _attendance = getStructList(
      snapshotData['attendance'],
      AttendanceStruct.fromMap,
    );
    _absent = getDataList(snapshotData['absent']);
    _present = getDataList(snapshotData['present']);
    _userrefe = snapshotData['userrefe'] as DocumentReference?;
    _projectref = snapshotData['projectref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('attednacenew')
          : FirebaseFirestore.instance.collectionGroup('attednacenew');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('attednacenew').doc();

  static Stream<AttednacenewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttednacenewRecord.fromSnapshot(s));

  static Future<AttednacenewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttednacenewRecord.fromSnapshot(s));

  static AttednacenewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttednacenewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttednacenewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttednacenewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttednacenewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttednacenewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttednacenewRecordData({
  DateTime? createdat,
  DateTime? date,
  DocumentReference? userrefe,
  DocumentReference? projectref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdat': createdat,
      'Date': date,
      'userrefe': userrefe,
      'projectref': projectref,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttednacenewRecordDocumentEquality
    implements Equality<AttednacenewRecord> {
  const AttednacenewRecordDocumentEquality();

  @override
  bool equals(AttednacenewRecord? e1, AttednacenewRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdat == e2?.createdat &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.attendance, e2?.attendance) &&
        listEquality.equals(e1?.absent, e2?.absent) &&
        listEquality.equals(e1?.present, e2?.present) &&
        e1?.userrefe == e2?.userrefe &&
        e1?.projectref == e2?.projectref;
  }

  @override
  int hash(AttednacenewRecord? e) => const ListEquality().hash([
        e?.createdat,
        e?.date,
        e?.attendance,
        e?.absent,
        e?.present,
        e?.userrefe,
        e?.projectref
      ]);

  @override
  bool isValidKey(Object? o) => o is AttednacenewRecord;
}
