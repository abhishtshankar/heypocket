// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalanderStruct extends FFFirebaseStruct {
  CalanderStruct({
    bool? present,
    DateTime? calander,
    DocumentReference? user,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _present = present,
        _calander = calander,
        _user = user,
        super(firestoreUtilData);

  // "present" field.
  bool? _present;
  bool get present => _present ?? false;
  set present(bool? val) => _present = val;
  bool hasPresent() => _present != null;

  // "calander" field.
  DateTime? _calander;
  DateTime? get calander => _calander;
  set calander(DateTime? val) => _calander = val;
  bool hasCalander() => _calander != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;
  bool hasUser() => _user != null;

  static CalanderStruct fromMap(Map<String, dynamic> data) => CalanderStruct(
        present: data['present'] as bool?,
        calander: data['calander'] as DateTime?,
        user: data['user'] as DocumentReference?,
      );

  static CalanderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CalanderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'present': _present,
        'calander': _calander,
        'user': _user,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'present': serializeParam(
          _present,
          ParamType.bool,
        ),
        'calander': serializeParam(
          _calander,
          ParamType.DateTime,
        ),
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CalanderStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalanderStruct(
        present: deserializeParam(
          data['present'],
          ParamType.bool,
          false,
        ),
        calander: deserializeParam(
          data['calander'],
          ParamType.DateTime,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'CalanderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CalanderStruct &&
        present == other.present &&
        calander == other.calander &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash([present, calander, user]);
}

CalanderStruct createCalanderStruct({
  bool? present,
  DateTime? calander,
  DocumentReference? user,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CalanderStruct(
      present: present,
      calander: calander,
      user: user,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CalanderStruct? updateCalanderStruct(
  CalanderStruct? calanderStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    calanderStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCalanderStructData(
  Map<String, dynamic> firestoreData,
  CalanderStruct? calanderStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (calanderStruct == null) {
    return;
  }
  if (calanderStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && calanderStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final calanderStructData =
      getCalanderFirestoreData(calanderStruct, forFieldValue);
  final nestedData =
      calanderStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = calanderStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCalanderFirestoreData(
  CalanderStruct? calanderStruct, [
  bool forFieldValue = false,
]) {
  if (calanderStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(calanderStruct.toMap());

  // Add any Firestore field values
  calanderStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCalanderListFirestoreData(
  List<CalanderStruct>? calanderStructs,
) =>
    calanderStructs?.map((e) => getCalanderFirestoreData(e, true)).toList() ??
    [];
