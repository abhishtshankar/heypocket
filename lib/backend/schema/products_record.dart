import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ItemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "PrdUser" field.
  DocumentReference? _prdUser;
  DocumentReference? get prdUser => _prdUser;
  bool hasPrdUser() => _prdUser != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "TaxName" field.
  String? _taxName;
  String get taxName => _taxName ?? '';
  bool hasTaxName() => _taxName != null;

  // "Tax" field.
  List<String>? _tax;
  List<String> get tax => _tax ?? const [];
  bool hasTax() => _tax != null;

  // "SellingPrice" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  bool hasSellingPrice() => _sellingPrice != null;

  // "DiscountPrice" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  bool hasDiscountPrice() => _discountPrice != null;

  // "Purchaseprice" field.
  double? _purchaseprice;
  double get purchaseprice => _purchaseprice ?? 0.0;
  bool hasPurchaseprice() => _purchaseprice != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Units" field.
  String? _units;
  String get units => _units ?? '';
  bool hasUnits() => _units != null;

  void _initializeFields() {
    _itemName = snapshotData['ItemName'] as String?;
    _prdUser = snapshotData['PrdUser'] as DocumentReference?;
    _description = snapshotData['Description'] as String?;
    _image = snapshotData['Image'] as String?;
    _taxName = snapshotData['TaxName'] as String?;
    _tax = getDataList(snapshotData['Tax']);
    _sellingPrice = castToType<double>(snapshotData['SellingPrice']);
    _discountPrice = castToType<double>(snapshotData['DiscountPrice']);
    _purchaseprice = castToType<double>(snapshotData['Purchaseprice']);
    _quantity = castToType<int>(snapshotData['Quantity']);
    _category = snapshotData['Category'] as String?;
    _units = snapshotData['Units'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? itemName,
  DocumentReference? prdUser,
  String? description,
  String? image,
  String? taxName,
  double? sellingPrice,
  double? discountPrice,
  double? purchaseprice,
  int? quantity,
  String? category,
  String? units,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ItemName': itemName,
      'PrdUser': prdUser,
      'Description': description,
      'Image': image,
      'TaxName': taxName,
      'SellingPrice': sellingPrice,
      'DiscountPrice': discountPrice,
      'Purchaseprice': purchaseprice,
      'Quantity': quantity,
      'Category': category,
      'Units': units,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemName == e2?.itemName &&
        e1?.prdUser == e2?.prdUser &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.taxName == e2?.taxName &&
        listEquality.equals(e1?.tax, e2?.tax) &&
        e1?.sellingPrice == e2?.sellingPrice &&
        e1?.discountPrice == e2?.discountPrice &&
        e1?.purchaseprice == e2?.purchaseprice &&
        e1?.quantity == e2?.quantity &&
        e1?.category == e2?.category &&
        e1?.units == e2?.units;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.prdUser,
        e?.description,
        e?.image,
        e?.taxName,
        e?.tax,
        e?.sellingPrice,
        e?.discountPrice,
        e?.purchaseprice,
        e?.quantity,
        e?.category,
        e?.units
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
