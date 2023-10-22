// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpenseCategoryStruct extends FFFirebaseStruct {
  ExpenseCategoryStruct({
    String? category,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        super(firestoreUtilData);

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  static ExpenseCategoryStruct fromMap(Map<String, dynamic> data) =>
      ExpenseCategoryStruct(
        category: data['Category'] as String?,
      );

  static ExpenseCategoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ExpenseCategoryStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExpenseCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExpenseCategoryStruct(
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExpenseCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExpenseCategoryStruct && category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([category]);
}

ExpenseCategoryStruct createExpenseCategoryStruct({
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExpenseCategoryStruct(
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExpenseCategoryStruct? updateExpenseCategoryStruct(
  ExpenseCategoryStruct? expenseCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    expenseCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExpenseCategoryStructData(
  Map<String, dynamic> firestoreData,
  ExpenseCategoryStruct? expenseCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (expenseCategory == null) {
    return;
  }
  if (expenseCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && expenseCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final expenseCategoryData =
      getExpenseCategoryFirestoreData(expenseCategory, forFieldValue);
  final nestedData =
      expenseCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = expenseCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExpenseCategoryFirestoreData(
  ExpenseCategoryStruct? expenseCategory, [
  bool forFieldValue = false,
]) {
  if (expenseCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(expenseCategory.toMap());

  // Add any Firestore field values
  expenseCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExpenseCategoryListFirestoreData(
  List<ExpenseCategoryStruct>? expenseCategorys,
) =>
    expenseCategorys
        ?.map((e) => getExpenseCategoryFirestoreData(e, true))
        .toList() ??
    [];
