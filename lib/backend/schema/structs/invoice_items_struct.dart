// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceItemsStruct extends FFFirebaseStruct {
  InvoiceItemsStruct({
    String? itemName,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _price = price,
        super(firestoreUtilData);

  // "ItemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static InvoiceItemsStruct fromMap(Map<String, dynamic> data) =>
      InvoiceItemsStruct(
        itemName: data['ItemName'] as String?,
        price: castToType<double>(data['Price']),
      );

  static InvoiceItemsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? InvoiceItemsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ItemName': _itemName,
        'Price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ItemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'Price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static InvoiceItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvoiceItemsStruct(
        itemName: deserializeParam(
          data['ItemName'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['Price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InvoiceItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvoiceItemsStruct &&
        itemName == other.itemName &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([itemName, price]);
}

InvoiceItemsStruct createInvoiceItemsStruct({
  String? itemName,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvoiceItemsStruct(
      itemName: itemName,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvoiceItemsStruct? updateInvoiceItemsStruct(
  InvoiceItemsStruct? invoiceItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invoiceItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvoiceItemsStructData(
  Map<String, dynamic> firestoreData,
  InvoiceItemsStruct? invoiceItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invoiceItems == null) {
    return;
  }
  if (invoiceItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invoiceItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invoiceItemsData =
      getInvoiceItemsFirestoreData(invoiceItems, forFieldValue);
  final nestedData =
      invoiceItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invoiceItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvoiceItemsFirestoreData(
  InvoiceItemsStruct? invoiceItems, [
  bool forFieldValue = false,
]) {
  if (invoiceItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invoiceItems.toMap());

  // Add any Firestore field values
  invoiceItems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvoiceItemsListFirestoreData(
  List<InvoiceItemsStruct>? invoiceItemss,
) =>
    invoiceItemss?.map((e) => getInvoiceItemsFirestoreData(e, true)).toList() ??
    [];
