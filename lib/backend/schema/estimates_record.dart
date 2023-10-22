import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstimatesRecord extends FirestoreRecord {
  EstimatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "EstimateNo" field.
  String? _estimateNo;
  String get estimateNo => _estimateNo ?? '';
  bool hasEstimateNo() => _estimateNo != null;

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

  // "CustomerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _estimateNo = snapshotData['EstimateNo'] as String?;
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
    _customerName = snapshotData['CustomerName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Estimates')
          : FirebaseFirestore.instance.collectionGroup('Estimates');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Estimates').doc();

  static Stream<EstimatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstimatesRecord.fromSnapshot(s));

  static Future<EstimatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EstimatesRecord.fromSnapshot(s));

  static EstimatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstimatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstimatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstimatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstimatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstimatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstimatesRecordData({
  String? estimateNo,
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
  String? customerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'EstimateNo': estimateNo,
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
      'CustomerName': customerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstimatesRecordDocumentEquality implements Equality<EstimatesRecord> {
  const EstimatesRecordDocumentEquality();

  @override
  bool equals(EstimatesRecord? e1, EstimatesRecord? e2) {
    return e1?.estimateNo == e2?.estimateNo &&
        e1?.dueDate == e2?.dueDate &&
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
        e1?.customerName == e2?.customerName;
  }

  @override
  int hash(EstimatesRecord? e) => const ListEquality().hash([
        e?.estimateNo,
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
        e?.customerName
      ]);

  @override
  bool isValidKey(Object? o) => o is EstimatesRecord;
}
