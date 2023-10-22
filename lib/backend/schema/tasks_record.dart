import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "users_assigned" field.
  List<DocumentReference>? _usersAssigned;
  List<DocumentReference> get usersAssigned => _usersAssigned ?? const [];
  bool hasUsersAssigned() => _usersAssigned != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "number_tasks" field.
  int? _numberTasks;
  int get numberTasks => _numberTasks ?? 0;
  bool hasNumberTasks() => _numberTasks != null;

  // "completed_tasks" field.
  int? _completedTasks;
  int get completedTasks => _completedTasks ?? 0;
  bool hasCompletedTasks() => _completedTasks != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "SelectedStaff" field.
  String? _selectedStaff;
  String get selectedStaff => _selectedStaff ?? '';
  bool hasSelectedStaff() => _selectedStaff != null;

  // "SelectedPROJECT" field.
  String? _selectedPROJECT;
  String get selectedPROJECT => _selectedPROJECT ?? '';
  bool hasSelectedPROJECT() => _selectedPROJECT != null;

  // "StartDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "EndDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "Progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  bool hasProgress() => _progress != null;

  // "Value" field.
  int? _value;
  int get value => _value ?? 0;
  bool hasValue() => _value != null;

  // "Priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "ProjectRef" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _usersAssigned = getDataList(snapshotData['users_assigned']);
    _description = snapshotData['description'] as String?;
    _numberTasks = castToType<int>(snapshotData['number_tasks']);
    _completedTasks = castToType<int>(snapshotData['completed_tasks']);
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _name = snapshotData['Name'] as String?;
    _selectedStaff = snapshotData['SelectedStaff'] as String?;
    _selectedPROJECT = snapshotData['SelectedPROJECT'] as String?;
    _startDate = snapshotData['StartDate'] as String?;
    _endDate = snapshotData['EndDate'] as String?;
    _progress = castToType<int>(snapshotData['Progress']);
    _value = castToType<int>(snapshotData['Value']);
    _priority = snapshotData['Priority'] as String?;
    _projectRef = snapshotData['ProjectRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Tasks')
          : FirebaseFirestore.instance.collectionGroup('Tasks');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Tasks').doc();

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DocumentReference? owner,
  String? description,
  int? numberTasks,
  int? completedTasks,
  DateTime? lastEdited,
  DateTime? timeCreated,
  String? name,
  String? selectedStaff,
  String? selectedPROJECT,
  String? startDate,
  String? endDate,
  int? progress,
  int? value,
  String? priority,
  DocumentReference? projectRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'description': description,
      'number_tasks': numberTasks,
      'completed_tasks': completedTasks,
      'last_edited': lastEdited,
      'time_created': timeCreated,
      'Name': name,
      'SelectedStaff': selectedStaff,
      'SelectedPROJECT': selectedPROJECT,
      'StartDate': startDate,
      'EndDate': endDate,
      'Progress': progress,
      'Value': value,
      'Priority': priority,
      'ProjectRef': projectRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        listEquality.equals(e1?.usersAssigned, e2?.usersAssigned) &&
        e1?.description == e2?.description &&
        e1?.numberTasks == e2?.numberTasks &&
        e1?.completedTasks == e2?.completedTasks &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.name == e2?.name &&
        e1?.selectedStaff == e2?.selectedStaff &&
        e1?.selectedPROJECT == e2?.selectedPROJECT &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.progress == e2?.progress &&
        e1?.value == e2?.value &&
        e1?.priority == e2?.priority &&
        e1?.projectRef == e2?.projectRef;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.usersAssigned,
        e?.description,
        e?.numberTasks,
        e?.completedTasks,
        e?.lastEdited,
        e?.timeCreated,
        e?.name,
        e?.selectedStaff,
        e?.selectedPROJECT,
        e?.startDate,
        e?.endDate,
        e?.progress,
        e?.value,
        e?.priority,
        e?.projectRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
