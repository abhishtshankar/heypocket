import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "USer" field.
  DocumentReference? _uSer;
  DocumentReference? get uSer => _uSer;
  bool hasUSer() => _uSer != null;

  // "Present" field.
  bool? _present;
  bool get present => _present ?? false;
  bool hasPresent() => _present != null;

  // "Absent" field.
  bool? _absent;
  bool get absent => _absent ?? false;
  bool hasAbsent() => _absent != null;

  // "Createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "StaffReferance" field.
  DocumentReference? _staffReferance;
  DocumentReference? get staffReferance => _staffReferance;
  bool hasStaffReferance() => _staffReferance != null;

  // "Projects" field.
  DocumentReference? _projects;
  DocumentReference? get projects => _projects;
  bool hasProjects() => _projects != null;

  // "CalanderDate" field.
  String? _calanderDate;
  String get calanderDate => _calanderDate ?? '';
  bool hasCalanderDate() => _calanderDate != null;

  // "ExpenceRef" field.
  DocumentReference? _expenceRef;
  DocumentReference? get expenceRef => _expenceRef;
  bool hasExpenceRef() => _expenceRef != null;

  // "Staffnames" field.
  String? _staffnames;
  String get staffnames => _staffnames ?? '';
  bool hasStaffnames() => _staffnames != null;

  void _initializeFields() {
    _uSer = snapshotData['USer'] as DocumentReference?;
    _present = snapshotData['Present'] as bool?;
    _absent = snapshotData['Absent'] as bool?;
    _createdat = snapshotData['Createdat'] as DateTime?;
    _staffReferance = snapshotData['StaffReferance'] as DocumentReference?;
    _projects = snapshotData['Projects'] as DocumentReference?;
    _calanderDate = snapshotData['CalanderDate'] as String?;
    _expenceRef = snapshotData['ExpenceRef'] as DocumentReference?;
    _staffnames = snapshotData['Staffnames'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  DocumentReference? uSer,
  bool? present,
  bool? absent,
  DateTime? createdat,
  DocumentReference? staffReferance,
  DocumentReference? projects,
  String? calanderDate,
  DocumentReference? expenceRef,
  String? staffnames,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'USer': uSer,
      'Present': present,
      'Absent': absent,
      'Createdat': createdat,
      'StaffReferance': staffReferance,
      'Projects': projects,
      'CalanderDate': calanderDate,
      'ExpenceRef': expenceRef,
      'Staffnames': staffnames,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.uSer == e2?.uSer &&
        e1?.present == e2?.present &&
        e1?.absent == e2?.absent &&
        e1?.createdat == e2?.createdat &&
        e1?.staffReferance == e2?.staffReferance &&
        e1?.projects == e2?.projects &&
        e1?.calanderDate == e2?.calanderDate &&
        e1?.expenceRef == e2?.expenceRef &&
        e1?.staffnames == e2?.staffnames;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash([
        e?.uSer,
        e?.present,
        e?.absent,
        e?.createdat,
        e?.staffReferance,
        e?.projects,
        e?.calanderDate,
        e?.expenceRef,
        e?.staffnames
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
