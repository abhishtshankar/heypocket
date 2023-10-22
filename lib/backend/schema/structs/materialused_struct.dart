// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialusedStruct extends FFFirebaseStruct {
  MaterialusedStruct({
    double? materialused,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _materialused = materialused,
        _date = date,
        super(firestoreUtilData);

  // "materialused" field.
  double? _materialused;
  double get materialused => _materialused ?? 0.0;
  set materialused(double? val) => _materialused = val;
  void incrementMaterialused(double amount) =>
      _materialused = materialused + amount;
  bool hasMaterialused() => _materialused != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static MaterialusedStruct fromMap(Map<String, dynamic> data) =>
      MaterialusedStruct(
        materialused: castToType<double>(data['materialused']),
        date: data['date'] as DateTime?,
      );

  static MaterialusedStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MaterialusedStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'materialused': _materialused,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'materialused': serializeParam(
          _materialused,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MaterialusedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaterialusedStruct(
        materialused: deserializeParam(
          data['materialused'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MaterialusedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaterialusedStruct &&
        materialused == other.materialused &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([materialused, date]);
}

MaterialusedStruct createMaterialusedStruct({
  double? materialused,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MaterialusedStruct(
      materialused: materialused,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MaterialusedStruct? updateMaterialusedStruct(
  MaterialusedStruct? materialusedStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    materialusedStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMaterialusedStructData(
  Map<String, dynamic> firestoreData,
  MaterialusedStruct? materialusedStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (materialusedStruct == null) {
    return;
  }
  if (materialusedStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && materialusedStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final materialusedStructData =
      getMaterialusedFirestoreData(materialusedStruct, forFieldValue);
  final nestedData =
      materialusedStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      materialusedStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMaterialusedFirestoreData(
  MaterialusedStruct? materialusedStruct, [
  bool forFieldValue = false,
]) {
  if (materialusedStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(materialusedStruct.toMap());

  // Add any Firestore field values
  materialusedStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMaterialusedListFirestoreData(
  List<MaterialusedStruct>? materialusedStructs,
) =>
    materialusedStructs
        ?.map((e) => getMaterialusedFirestoreData(e, true))
        .toList() ??
    [];
