// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusStruct extends FFFirebaseStruct {
  StatusStruct({
    bool? onGoing,
    bool? completed,
    bool? delay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _onGoing = onGoing,
        _completed = completed,
        _delay = delay,
        super(firestoreUtilData);

  // "On-Going" field.
  bool? _onGoing;
  bool get onGoing => _onGoing ?? false;
  set onGoing(bool? val) => _onGoing = val;
  bool hasOnGoing() => _onGoing != null;

  // "Completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  set completed(bool? val) => _completed = val;
  bool hasCompleted() => _completed != null;

  // "Delay" field.
  bool? _delay;
  bool get delay => _delay ?? false;
  set delay(bool? val) => _delay = val;
  bool hasDelay() => _delay != null;

  static StatusStruct fromMap(Map<String, dynamic> data) => StatusStruct(
        onGoing: data['On-Going'] as bool?,
        completed: data['Completed'] as bool?,
        delay: data['Delay'] as bool?,
      );

  static StatusStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StatusStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'On-Going': _onGoing,
        'Completed': _completed,
        'Delay': _delay,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'On-Going': serializeParam(
          _onGoing,
          ParamType.bool,
        ),
        'Completed': serializeParam(
          _completed,
          ParamType.bool,
        ),
        'Delay': serializeParam(
          _delay,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusStruct(
        onGoing: deserializeParam(
          data['On-Going'],
          ParamType.bool,
          false,
        ),
        completed: deserializeParam(
          data['Completed'],
          ParamType.bool,
          false,
        ),
        delay: deserializeParam(
          data['Delay'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusStruct &&
        onGoing == other.onGoing &&
        completed == other.completed &&
        delay == other.delay;
  }

  @override
  int get hashCode => const ListEquality().hash([onGoing, completed, delay]);
}

StatusStruct createStatusStruct({
  bool? onGoing,
  bool? completed,
  bool? delay,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusStruct(
      onGoing: onGoing,
      completed: completed,
      delay: delay,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusStruct? updateStatusStruct(
  StatusStruct? status, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    status
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusStructData(
  Map<String, dynamic> firestoreData,
  StatusStruct? status,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (status == null) {
    return;
  }
  if (status.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && status.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusData = getStatusFirestoreData(status, forFieldValue);
  final nestedData = statusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = status.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusFirestoreData(
  StatusStruct? status, [
  bool forFieldValue = false,
]) {
  if (status == null) {
    return {};
  }
  final firestoreData = mapToFirestore(status.toMap());

  // Add any Firestore field values
  status.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusListFirestoreData(
  List<StatusStruct>? statuss,
) =>
    statuss?.map((e) => getStatusFirestoreData(e, true)).toList() ?? [];
