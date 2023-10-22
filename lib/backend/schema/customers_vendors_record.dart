import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersVendorsRecord extends FirestoreRecord {
  CustomersVendorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CustomerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "VendorName" field.
  String? _vendorName;
  String get vendorName => _vendorName ?? '';
  bool hasVendorName() => _vendorName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "GST" field.
  String? _gst;
  String get gst => _gst ?? '';
  bool hasGst() => _gst != null;

  // "PAN" field.
  String? _pan;
  String get pan => _pan ?? '';
  bool hasPan() => _pan != null;

  // "Createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "EditedAt" field.
  DateTime? _editedAt;
  DateTime? get editedAt => _editedAt;
  bool hasEditedAt() => _editedAt != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _customerName = snapshotData['CustomerName'] as String?;
    _vendorName = snapshotData['VendorName'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
    _gst = snapshotData['GST'] as String?;
    _pan = snapshotData['PAN'] as String?;
    _createdat = snapshotData['Createdat'] as DateTime?;
    _editedAt = snapshotData['EditedAt'] as DateTime?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CustomersVendors')
          : FirebaseFirestore.instance.collectionGroup('CustomersVendors');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('CustomersVendors').doc();

  static Stream<CustomersVendorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersVendorsRecord.fromSnapshot(s));

  static Future<CustomersVendorsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomersVendorsRecord.fromSnapshot(s));

  static CustomersVendorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersVendorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersVendorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersVendorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersVendorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersVendorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersVendorsRecordData({
  String? customerName,
  String? vendorName,
  String? email,
  String? phone,
  AddressStruct? address,
  String? gst,
  String? pan,
  DateTime? createdat,
  DateTime? editedAt,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CustomerName': customerName,
      'VendorName': vendorName,
      'email': email,
      'phone': phone,
      'address': AddressStruct().toMap(),
      'GST': gst,
      'PAN': pan,
      'Createdat': createdat,
      'EditedAt': editedAt,
      'UserRef': userRef,
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}

class CustomersVendorsRecordDocumentEquality
    implements Equality<CustomersVendorsRecord> {
  const CustomersVendorsRecordDocumentEquality();

  @override
  bool equals(CustomersVendorsRecord? e1, CustomersVendorsRecord? e2) {
    return e1?.customerName == e2?.customerName &&
        e1?.vendorName == e2?.vendorName &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.address == e2?.address &&
        e1?.gst == e2?.gst &&
        e1?.pan == e2?.pan &&
        e1?.createdat == e2?.createdat &&
        e1?.editedAt == e2?.editedAt &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(CustomersVendorsRecord? e) => const ListEquality().hash([
        e?.customerName,
        e?.vendorName,
        e?.email,
        e?.phone,
        e?.address,
        e?.gst,
        e?.pan,
        e?.createdat,
        e?.editedAt,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomersVendorsRecord;
}
