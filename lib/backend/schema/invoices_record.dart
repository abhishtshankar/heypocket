import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "DueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "CurrentDate" field.
  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  bool hasCurrentDate() => _currentDate != null;

  // "UserPO" field.
  DocumentReference? _userPO;
  DocumentReference? get userPO => _userPO;
  bool hasUserPO() => _userPO != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "editedat" field.
  DateTime? _editedat;
  DateTime? get editedat => _editedat;
  bool hasEditedat() => _editedat != null;

  // "Itemname" field.
  String? _itemname;
  String get itemname => _itemname ?? '';
  bool hasItemname() => _itemname != null;

  // "DiscountPrice" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  bool hasDiscountPrice() => _discountPrice != null;

  // "SellingPrice" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  bool hasSellingPrice() => _sellingPrice != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "ItemImage" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  bool hasItemImage() => _itemImage != null;

  // "InvoiceNo" field.
  String? _invoiceNo;
  String get invoiceNo => _invoiceNo ?? '';
  bool hasInvoiceNo() => _invoiceNo != null;

  // "CustomerDetails" field.
  String? _customerDetails;
  String get customerDetails => _customerDetails ?? '';
  bool hasCustomerDetails() => _customerDetails != null;

  // "TotalValue" field.
  double? _totalValue;
  double get totalValue => _totalValue ?? 0.0;
  bool hasTotalValue() => _totalValue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dueDate = snapshotData['DueDate'] as DateTime?;
    _currentDate = snapshotData['CurrentDate'] as DateTime?;
    _userPO = snapshotData['UserPO'] as DocumentReference?;
    _id = castToType<int>(snapshotData['ID']);
    _createdat = snapshotData['createdat'] as DateTime?;
    _editedat = snapshotData['editedat'] as DateTime?;
    _itemname = snapshotData['Itemname'] as String?;
    _discountPrice = castToType<double>(snapshotData['DiscountPrice']);
    _sellingPrice = castToType<double>(snapshotData['SellingPrice']);
    _quantity = castToType<int>(snapshotData['Quantity']);
    _itemImage = snapshotData['ItemImage'] as String?;
    _invoiceNo = snapshotData['InvoiceNo'] as String?;
    _customerDetails = snapshotData['CustomerDetails'] as String?;
    _totalValue = castToType<double>(snapshotData['TotalValue']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Invoices')
          : FirebaseFirestore.instance.collectionGroup('Invoices');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Invoices').doc();

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  DateTime? dueDate,
  DateTime? currentDate,
  DocumentReference? userPO,
  int? id,
  DateTime? createdat,
  DateTime? editedat,
  String? itemname,
  double? discountPrice,
  double? sellingPrice,
  int? quantity,
  String? itemImage,
  String? invoiceNo,
  String? customerDetails,
  double? totalValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DueDate': dueDate,
      'CurrentDate': currentDate,
      'UserPO': userPO,
      'ID': id,
      'createdat': createdat,
      'editedat': editedat,
      'Itemname': itemname,
      'DiscountPrice': discountPrice,
      'SellingPrice': sellingPrice,
      'Quantity': quantity,
      'ItemImage': itemImage,
      'InvoiceNo': invoiceNo,
      'CustomerDetails': customerDetails,
      'TotalValue': totalValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    return e1?.dueDate == e2?.dueDate &&
        e1?.currentDate == e2?.currentDate &&
        e1?.userPO == e2?.userPO &&
        e1?.id == e2?.id &&
        e1?.createdat == e2?.createdat &&
        e1?.editedat == e2?.editedat &&
        e1?.itemname == e2?.itemname &&
        e1?.discountPrice == e2?.discountPrice &&
        e1?.sellingPrice == e2?.sellingPrice &&
        e1?.quantity == e2?.quantity &&
        e1?.itemImage == e2?.itemImage &&
        e1?.invoiceNo == e2?.invoiceNo &&
        e1?.customerDetails == e2?.customerDetails &&
        e1?.totalValue == e2?.totalValue;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.dueDate,
        e?.currentDate,
        e?.userPO,
        e?.id,
        e?.createdat,
        e?.editedat,
        e?.itemname,
        e?.discountPrice,
        e?.sellingPrice,
        e?.quantity,
        e?.itemImage,
        e?.invoiceNo,
        e?.customerDetails,
        e?.totalValue
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
