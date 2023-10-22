import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userRefs" field.
  DocumentReference? _userRefs;
  DocumentReference? get userRefs => _userRefs;
  bool hasUserRefs() => _userRefs != null;

  // "userRefss" field.
  List<DocumentReference>? _userRefss;
  List<DocumentReference> get userRefss => _userRefss ?? const [];
  bool hasUserRefss() => _userRefss != null;

  // "isStaff" field.
  bool? _isStaff;
  bool get isStaff => _isStaff ?? false;
  bool hasIsStaff() => _isStaff != null;

  // "staff" field.
  bool? _staff;
  bool get staff => _staff ?? false;
  bool hasStaff() => _staff != null;

  // "Project" field.
  DocumentReference? _project;
  DocumentReference? get project => _project;
  bool hasProject() => _project != null;

  // "IncomeNExpense" field.
  DocumentReference? _incomeNExpense;
  DocumentReference? get incomeNExpense => _incomeNExpense;
  bool hasIncomeNExpense() => _incomeNExpense != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userRefs = snapshotData['userRefs'] as DocumentReference?;
    _userRefss = getDataList(snapshotData['userRefss']);
    _isStaff = snapshotData['isStaff'] as bool?;
    _staff = snapshotData['staff'] as bool?;
    _project = snapshotData['Project'] as DocumentReference?;
    _incomeNExpense = snapshotData['IncomeNExpense'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? userRefs,
  bool? isStaff,
  bool? staff,
  DocumentReference? project,
  DocumentReference? incomeNExpense,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userRefs': userRefs,
      'isStaff': isStaff,
      'staff': staff,
      'Project': project,
      'IncomeNExpense': incomeNExpense,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userRefs == e2?.userRefs &&
        listEquality.equals(e1?.userRefss, e2?.userRefss) &&
        e1?.isStaff == e2?.isStaff &&
        e1?.staff == e2?.staff &&
        e1?.project == e2?.project &&
        e1?.incomeNExpense == e2?.incomeNExpense;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userRefs,
        e?.userRefss,
        e?.isStaff,
        e?.staff,
        e?.project,
        e?.incomeNExpense
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
