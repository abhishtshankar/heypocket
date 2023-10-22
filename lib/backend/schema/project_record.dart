import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectRecord extends FirestoreRecord {
  ProjectRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NameOfProject" field.
  String? _nameOfProject;
  String get nameOfProject => _nameOfProject ?? '';
  bool hasNameOfProject() => _nameOfProject != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "StartDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "EndDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "EditedAt" field.
  DateTime? _editedAt;
  DateTime? get editedAt => _editedAt;
  bool hasEditedAt() => _editedAt != null;

  // "Tasks" field.
  DocumentReference? _tasks;
  DocumentReference? get tasks => _tasks;
  bool hasTasks() => _tasks != null;

  // "CustomersNvendors" field.
  DocumentReference? _customersNvendors;
  DocumentReference? get customersNvendors => _customersNvendors;
  bool hasCustomersNvendors() => _customersNvendors != null;

  // "UserR" field.
  DocumentReference? _userR;
  DocumentReference? get userR => _userR;
  bool hasUserR() => _userR != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "StaffReferance" field.
  DocumentReference? _staffReferance;
  DocumentReference? get staffReferance => _staffReferance;
  bool hasStaffReferance() => _staffReferance != null;

  // "Status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  bool hasStatus() => _status != null;

  // "projecttransaction" field.
  DocumentReference? _projecttransaction;
  DocumentReference? get projecttransaction => _projecttransaction;
  bool hasProjecttransaction() => _projecttransaction != null;

  // "customers" field.
  List<String>? _customers;
  List<String> get customers => _customers ?? const [];
  bool hasCustomers() => _customers != null;

  // "vendors" field.
  List<String>? _vendors;
  List<String> get vendors => _vendors ?? const [];
  bool hasVendors() => _vendors != null;

  // "staff" field.
  List<String>? _staff;
  List<String> get staff => _staff ?? const [];
  bool hasStaff() => _staff != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nameOfProject = snapshotData['NameOfProject'] as String?;
    _description = snapshotData['Description'] as String?;
    _notes = snapshotData['Notes'] as String?;
    _startDate = snapshotData['StartDate'] as String?;
    _endDate = snapshotData['EndDate'] as String?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _editedAt = snapshotData['EditedAt'] as DateTime?;
    _tasks = snapshotData['Tasks'] as DocumentReference?;
    _customersNvendors =
        snapshotData['CustomersNvendors'] as DocumentReference?;
    _userR = snapshotData['UserR'] as DocumentReference?;
    _city = snapshotData['City'] as String?;
    _location = snapshotData['Location'] as String?;
    _staffReferance = snapshotData['StaffReferance'] as DocumentReference?;
    _status = StatusStruct.maybeFromMap(snapshotData['Status']);
    _projecttransaction =
        snapshotData['projecttransaction'] as DocumentReference?;
    _customers = getDataList(snapshotData['customers']);
    _vendors = getDataList(snapshotData['vendors']);
    _staff = getDataList(snapshotData['staff']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Project')
          : FirebaseFirestore.instance.collectionGroup('Project');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Project').doc();

  static Stream<ProjectRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectRecord.fromSnapshot(s));

  static Future<ProjectRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectRecord.fromSnapshot(s));

  static ProjectRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectRecordData({
  String? nameOfProject,
  String? description,
  String? notes,
  String? startDate,
  String? endDate,
  DateTime? createdAt,
  DateTime? editedAt,
  DocumentReference? tasks,
  DocumentReference? customersNvendors,
  DocumentReference? userR,
  String? city,
  String? location,
  DocumentReference? staffReferance,
  StatusStruct? status,
  DocumentReference? projecttransaction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NameOfProject': nameOfProject,
      'Description': description,
      'Notes': notes,
      'StartDate': startDate,
      'EndDate': endDate,
      'CreatedAt': createdAt,
      'EditedAt': editedAt,
      'Tasks': tasks,
      'CustomersNvendors': customersNvendors,
      'UserR': userR,
      'City': city,
      'Location': location,
      'StaffReferance': staffReferance,
      'Status': StatusStruct().toMap(),
      'projecttransaction': projecttransaction,
    }.withoutNulls,
  );

  // Handle nested data for "Status" field.
  addStatusStructData(firestoreData, status, 'Status');

  return firestoreData;
}

class ProjectRecordDocumentEquality implements Equality<ProjectRecord> {
  const ProjectRecordDocumentEquality();

  @override
  bool equals(ProjectRecord? e1, ProjectRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nameOfProject == e2?.nameOfProject &&
        e1?.description == e2?.description &&
        e1?.notes == e2?.notes &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.editedAt == e2?.editedAt &&
        e1?.tasks == e2?.tasks &&
        e1?.customersNvendors == e2?.customersNvendors &&
        e1?.userR == e2?.userR &&
        e1?.city == e2?.city &&
        e1?.location == e2?.location &&
        e1?.staffReferance == e2?.staffReferance &&
        e1?.status == e2?.status &&
        e1?.projecttransaction == e2?.projecttransaction &&
        listEquality.equals(e1?.customers, e2?.customers) &&
        listEquality.equals(e1?.vendors, e2?.vendors) &&
        listEquality.equals(e1?.staff, e2?.staff);
  }

  @override
  int hash(ProjectRecord? e) => const ListEquality().hash([
        e?.nameOfProject,
        e?.description,
        e?.notes,
        e?.startDate,
        e?.endDate,
        e?.createdAt,
        e?.editedAt,
        e?.tasks,
        e?.customersNvendors,
        e?.userR,
        e?.city,
        e?.location,
        e?.staffReferance,
        e?.status,
        e?.projecttransaction,
        e?.customers,
        e?.vendors,
        e?.staff
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectRecord;
}
