import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkedAttendanceRecord extends FirestoreRecord {
  MarkedAttendanceRecord._(
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

  // "AttendanceRef" field.
  DocumentReference? _attendanceRef;
  DocumentReference? get attendanceRef => _attendanceRef;
  bool hasAttendanceRef() => _attendanceRef != null;

  // "MarkedAttendnaceRef" field.
  DocumentReference? _markedAttendnaceRef;
  DocumentReference? get markedAttendnaceRef => _markedAttendnaceRef;
  bool hasMarkedAttendnaceRef() => _markedAttendnaceRef != null;

  // "NoInformation" field.
  bool? _noInformation;
  bool get noInformation => _noInformation ?? false;
  bool hasNoInformation() => _noInformation != null;

  // "Leave" field.
  bool? _leave;
  bool get leave => _leave ?? false;
  bool hasLeave() => _leave != null;

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
    _attendanceRef = snapshotData['AttendanceRef'] as DocumentReference?;
    _markedAttendnaceRef =
        snapshotData['MarkedAttendnaceRef'] as DocumentReference?;
    _noInformation = snapshotData['NoInformation'] as bool?;
    _leave = snapshotData['Leave'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MarkedAttendance');

  static Stream<MarkedAttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarkedAttendanceRecord.fromSnapshot(s));

  static Future<MarkedAttendanceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MarkedAttendanceRecord.fromSnapshot(s));

  static MarkedAttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarkedAttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarkedAttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarkedAttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarkedAttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarkedAttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarkedAttendanceRecordData({
  DocumentReference? uSer,
  bool? present,
  bool? absent,
  DateTime? createdat,
  DocumentReference? staffReferance,
  DocumentReference? projects,
  String? calanderDate,
  DocumentReference? expenceRef,
  String? staffnames,
  DocumentReference? attendanceRef,
  DocumentReference? markedAttendnaceRef,
  bool? noInformation,
  bool? leave,
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
      'AttendanceRef': attendanceRef,
      'MarkedAttendnaceRef': markedAttendnaceRef,
      'NoInformation': noInformation,
      'Leave': leave,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarkedAttendanceRecordDocumentEquality
    implements Equality<MarkedAttendanceRecord> {
  const MarkedAttendanceRecordDocumentEquality();

  @override
  bool equals(MarkedAttendanceRecord? e1, MarkedAttendanceRecord? e2) {
    return e1?.uSer == e2?.uSer &&
        e1?.present == e2?.present &&
        e1?.absent == e2?.absent &&
        e1?.createdat == e2?.createdat &&
        e1?.staffReferance == e2?.staffReferance &&
        e1?.projects == e2?.projects &&
        e1?.calanderDate == e2?.calanderDate &&
        e1?.expenceRef == e2?.expenceRef &&
        e1?.staffnames == e2?.staffnames &&
        e1?.attendanceRef == e2?.attendanceRef &&
        e1?.markedAttendnaceRef == e2?.markedAttendnaceRef &&
        e1?.noInformation == e2?.noInformation &&
        e1?.leave == e2?.leave;
  }

  @override
  int hash(MarkedAttendanceRecord? e) => const ListEquality().hash([
        e?.uSer,
        e?.present,
        e?.absent,
        e?.createdat,
        e?.staffReferance,
        e?.projects,
        e?.calanderDate,
        e?.expenceRef,
        e?.staffnames,
        e?.attendanceRef,
        e?.markedAttendnaceRef,
        e?.noInformation,
        e?.leave
      ]);

  @override
  bool isValidKey(Object? o) => o is MarkedAttendanceRecord;
}
