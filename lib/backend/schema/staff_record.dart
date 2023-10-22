import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffRecord extends FirestoreRecord {
  StaffRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "PhoneNumebr" field.
  String? _phoneNumebr;
  String get phoneNumebr => _phoneNumebr ?? '';
  bool hasPhoneNumebr() => _phoneNumebr != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "PaymentType" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "EditedAt" field.
  DateTime? _editedAt;
  DateTime? get editedAt => _editedAt;
  bool hasEditedAt() => _editedAt != null;

  // "Userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "Address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "Payment" field.
  double? _payment;
  double get payment => _payment ?? 0.0;
  bool hasPayment() => _payment != null;

  // "Attendance" field.
  DocumentReference? _attendance;
  DocumentReference? get attendance => _attendance;
  bool hasAttendance() => _attendance != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _phoneNumebr = snapshotData['PhoneNumebr'] as String?;
    _email = snapshotData['Email'] as String?;
    _paymentType = snapshotData['PaymentType'] as String?;
    _role = snapshotData['Role'] as String?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
    _editedAt = snapshotData['EditedAt'] as DateTime?;
    _userref = snapshotData['Userref'] as DocumentReference?;
    _address = AddressStruct.maybeFromMap(snapshotData['Address']);
    _payment = castToType<double>(snapshotData['Payment']);
    _attendance = snapshotData['Attendance'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Staff');

  static Stream<StaffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StaffRecord.fromSnapshot(s));

  static Future<StaffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StaffRecord.fromSnapshot(s));

  static StaffRecord fromSnapshot(DocumentSnapshot snapshot) => StaffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StaffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StaffRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StaffRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StaffRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStaffRecordData({
  String? name,
  String? phoneNumebr,
  String? email,
  String? paymentType,
  String? role,
  DateTime? createdAt,
  DateTime? editedAt,
  DocumentReference? userref,
  AddressStruct? address,
  double? payment,
  DocumentReference? attendance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'PhoneNumebr': phoneNumebr,
      'Email': email,
      'PaymentType': paymentType,
      'Role': role,
      'CreatedAt': createdAt,
      'EditedAt': editedAt,
      'Userref': userref,
      'Address': AddressStruct().toMap(),
      'Payment': payment,
      'Attendance': attendance,
    }.withoutNulls,
  );

  // Handle nested data for "Address" field.
  addAddressStructData(firestoreData, address, 'Address');

  return firestoreData;
}

class StaffRecordDocumentEquality implements Equality<StaffRecord> {
  const StaffRecordDocumentEquality();

  @override
  bool equals(StaffRecord? e1, StaffRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phoneNumebr == e2?.phoneNumebr &&
        e1?.email == e2?.email &&
        e1?.paymentType == e2?.paymentType &&
        e1?.role == e2?.role &&
        e1?.createdAt == e2?.createdAt &&
        e1?.editedAt == e2?.editedAt &&
        e1?.userref == e2?.userref &&
        e1?.address == e2?.address &&
        e1?.payment == e2?.payment &&
        e1?.attendance == e2?.attendance;
  }

  @override
  int hash(StaffRecord? e) => const ListEquality().hash([
        e?.name,
        e?.phoneNumebr,
        e?.email,
        e?.paymentType,
        e?.role,
        e?.createdAt,
        e?.editedAt,
        e?.userref,
        e?.address,
        e?.payment,
        e?.attendance
      ]);

  @override
  bool isValidKey(Object? o) => o is StaffRecord;
}
