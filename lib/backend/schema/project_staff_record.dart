import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStaffRecord extends FirestoreRecord {
  ProjectStaffRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "StaffName" field.
  String? _staffName;
  String get staffName => _staffName ?? '';
  bool hasStaffName() => _staffName != null;

  // "CalenderDate" field.
  DateTime? _calenderDate;
  DateTime? get calenderDate => _calenderDate;
  bool hasCalenderDate() => _calenderDate != null;

  // "AttendenceType" field.
  String? _attendenceType;
  String get attendenceType => _attendenceType ?? '';
  bool hasAttendenceType() => _attendenceType != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "ProjectRef" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "AttendeceRef" field.
  DocumentReference? _attendeceRef;
  DocumentReference? get attendeceRef => _attendeceRef;
  bool hasAttendeceRef() => _attendeceRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _staffName = snapshotData['StaffName'] as String?;
    _calenderDate = snapshotData['CalenderDate'] as DateTime?;
    _attendenceType = snapshotData['AttendenceType'] as String?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _projectRef = snapshotData['ProjectRef'] as DocumentReference?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _attendeceRef = snapshotData['AttendeceRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ProjectStaff')
          : FirebaseFirestore.instance.collectionGroup('ProjectStaff');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ProjectStaff').doc();

  static Stream<ProjectStaffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectStaffRecord.fromSnapshot(s));

  static Future<ProjectStaffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectStaffRecord.fromSnapshot(s));

  static ProjectStaffRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectStaffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectStaffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectStaffRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectStaffRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectStaffRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectStaffRecordData({
  String? staffName,
  DateTime? calenderDate,
  String? attendenceType,
  DocumentReference? userRef,
  DocumentReference? projectRef,
  DateTime? createdAt,
  DocumentReference? attendeceRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'StaffName': staffName,
      'CalenderDate': calenderDate,
      'AttendenceType': attendenceType,
      'UserRef': userRef,
      'ProjectRef': projectRef,
      'CreatedAt': createdAt,
      'AttendeceRef': attendeceRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectStaffRecordDocumentEquality
    implements Equality<ProjectStaffRecord> {
  const ProjectStaffRecordDocumentEquality();

  @override
  bool equals(ProjectStaffRecord? e1, ProjectStaffRecord? e2) {
    return e1?.staffName == e2?.staffName &&
        e1?.calenderDate == e2?.calenderDate &&
        e1?.attendenceType == e2?.attendenceType &&
        e1?.userRef == e2?.userRef &&
        e1?.projectRef == e2?.projectRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.attendeceRef == e2?.attendeceRef;
  }

  @override
  int hash(ProjectStaffRecord? e) => const ListEquality().hash([
        e?.staffName,
        e?.calenderDate,
        e?.attendenceType,
        e?.userRef,
        e?.projectRef,
        e?.createdAt,
        e?.attendeceRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectStaffRecord;
}
