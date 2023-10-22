// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemanmesPOStruct extends FFFirebaseStruct {
  ItemanmesPOStruct({
    String? itemNameD,
    String? image,
    double? sellingPrice,
    double? discount,
    double? tax,
    bool? qty,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemNameD = itemNameD,
        _image = image,
        _sellingPrice = sellingPrice,
        _discount = discount,
        _tax = tax,
        _qty = qty,
        super(firestoreUtilData);

  // "itemNameD" field.
  String? _itemNameD;
  String get itemNameD => _itemNameD ?? '';
  set itemNameD(String? val) => _itemNameD = val;
  bool hasItemNameD() => _itemNameD != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "SellingPrice" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  set sellingPrice(double? val) => _sellingPrice = val;
  void incrementSellingPrice(double amount) =>
      _sellingPrice = sellingPrice + amount;
  bool hasSellingPrice() => _sellingPrice != null;

  // "Discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;
  void incrementDiscount(double amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  // "Tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  set tax(double? val) => _tax = val;
  void incrementTax(double amount) => _tax = tax + amount;
  bool hasTax() => _tax != null;

  // "Qty" field.
  bool? _qty;
  bool get qty => _qty ?? false;
  set qty(bool? val) => _qty = val;
  bool hasQty() => _qty != null;

  static ItemanmesPOStruct fromMap(Map<String, dynamic> data) =>
      ItemanmesPOStruct(
        itemNameD: data['itemNameD'] as String?,
        image: data['Image'] as String?,
        sellingPrice: castToType<double>(data['SellingPrice']),
        discount: castToType<double>(data['Discount']),
        tax: castToType<double>(data['Tax']),
        qty: data['Qty'] as bool?,
      );

  static ItemanmesPOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ItemanmesPOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'itemNameD': _itemNameD,
        'Image': _image,
        'SellingPrice': _sellingPrice,
        'Discount': _discount,
        'Tax': _tax,
        'Qty': _qty,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemNameD': serializeParam(
          _itemNameD,
          ParamType.String,
        ),
        'Image': serializeParam(
          _image,
          ParamType.String,
        ),
        'SellingPrice': serializeParam(
          _sellingPrice,
          ParamType.double,
        ),
        'Discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'Tax': serializeParam(
          _tax,
          ParamType.double,
        ),
        'Qty': serializeParam(
          _qty,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ItemanmesPOStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemanmesPOStruct(
        itemNameD: deserializeParam(
          data['itemNameD'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['Image'],
          ParamType.String,
          false,
        ),
        sellingPrice: deserializeParam(
          data['SellingPrice'],
          ParamType.double,
          false,
        ),
        discount: deserializeParam(
          data['Discount'],
          ParamType.double,
          false,
        ),
        tax: deserializeParam(
          data['Tax'],
          ParamType.double,
          false,
        ),
        qty: deserializeParam(
          data['Qty'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ItemanmesPOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemanmesPOStruct &&
        itemNameD == other.itemNameD &&
        image == other.image &&
        sellingPrice == other.sellingPrice &&
        discount == other.discount &&
        tax == other.tax &&
        qty == other.qty;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([itemNameD, image, sellingPrice, discount, tax, qty]);
}

ItemanmesPOStruct createItemanmesPOStruct({
  String? itemNameD,
  String? image,
  double? sellingPrice,
  double? discount,
  double? tax,
  bool? qty,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemanmesPOStruct(
      itemNameD: itemNameD,
      image: image,
      sellingPrice: sellingPrice,
      discount: discount,
      tax: tax,
      qty: qty,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemanmesPOStruct? updateItemanmesPOStruct(
  ItemanmesPOStruct? itemanmesPO, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemanmesPO
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemanmesPOStructData(
  Map<String, dynamic> firestoreData,
  ItemanmesPOStruct? itemanmesPO,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemanmesPO == null) {
    return;
  }
  if (itemanmesPO.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemanmesPO.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemanmesPOData =
      getItemanmesPOFirestoreData(itemanmesPO, forFieldValue);
  final nestedData =
      itemanmesPOData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemanmesPO.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemanmesPOFirestoreData(
  ItemanmesPOStruct? itemanmesPO, [
  bool forFieldValue = false,
]) {
  if (itemanmesPO == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemanmesPO.toMap());

  // Add any Firestore field values
  itemanmesPO.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemanmesPOListFirestoreData(
  List<ItemanmesPOStruct>? itemanmesPOs,
) =>
    itemanmesPOs?.map((e) => getItemanmesPOFirestoreData(e, true)).toList() ??
    [];
