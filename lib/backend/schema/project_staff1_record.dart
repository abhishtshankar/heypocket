import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStaff1Record extends FirestoreRecord {
  ProjectStaff1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "staffname" field.
  String? _staffname;
  String get staffname => _staffname ?? '';
  bool hasStaffname() => _staffname != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _staffname = snapshotData['staffname'] as String?;
    _createdat = snapshotData['createdat'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ProjectStaff1')
          : FirebaseFirestore.instance.collectionGroup('ProjectStaff1');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ProjectStaff1').doc();

  static Stream<ProjectStaff1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectStaff1Record.fromSnapshot(s));

  static Future<ProjectStaff1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectStaff1Record.fromSnapshot(s));

  static ProjectStaff1Record fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectStaff1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectStaff1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectStaff1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectStaff1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectStaff1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectStaff1RecordData({
  String? staffname,
  DateTime? createdat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'staffname': staffname,
      'createdat': createdat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectStaff1RecordDocumentEquality
    implements Equality<ProjectStaff1Record> {
  const ProjectStaff1RecordDocumentEquality();

  @override
  bool equals(ProjectStaff1Record? e1, ProjectStaff1Record? e2) {
    return e1?.staffname == e2?.staffname && e1?.createdat == e2?.createdat;
  }

  @override
  int hash(ProjectStaff1Record? e) =>
      const ListEquality().hash([e?.staffname, e?.createdat]);

  @override
  bool isValidKey(Object? o) => o is ProjectStaff1Record;
}
