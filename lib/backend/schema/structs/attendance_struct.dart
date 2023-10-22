// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceStruct extends FFFirebaseStruct {
  AttendanceStruct({
    bool? present,
    bool? absent,
    String? staffname,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _present = present,
        _absent = absent,
        _staffname = staffname,
        super(firestoreUtilData);

  // "present" field.
  bool? _present;
  bool get present => _present ?? false;
  set present(bool? val) => _present = val;
  bool hasPresent() => _present != null;

  // "absent" field.
  bool? _absent;
  bool get absent => _absent ?? false;
  set absent(bool? val) => _absent = val;
  bool hasAbsent() => _absent != null;

  // "staffname" field.
  String? _staffname;
  String get staffname => _staffname ?? '';
  set staffname(String? val) => _staffname = val;
  bool hasStaffname() => _staffname != null;

  static AttendanceStruct fromMap(Map<String, dynamic> data) =>
      AttendanceStruct(
        present: data['present'] as bool?,
        absent: data['absent'] as bool?,
        staffname: data['staffname'] as String?,
      );

  static AttendanceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AttendanceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'present': _present,
        'absent': _absent,
        'staffname': _staffname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'present': serializeParam(
          _present,
          ParamType.bool,
        ),
        'absent': serializeParam(
          _absent,
          ParamType.bool,
        ),
        'staffname': serializeParam(
          _staffname,
          ParamType.String,
        ),
      }.withoutNulls;

  static AttendanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendanceStruct(
        present: deserializeParam(
          data['present'],
          ParamType.bool,
          false,
        ),
        absent: deserializeParam(
          data['absent'],
          ParamType.bool,
          false,
        ),
        staffname: deserializeParam(
          data['staffname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AttendanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendanceStruct &&
        present == other.present &&
        absent == other.absent &&
        staffname == other.staffname;
  }

  @override
  int get hashCode => const ListEquality().hash([present, absent, staffname]);
}

AttendanceStruct createAttendanceStruct({
  bool? present,
  bool? absent,
  String? staffname,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttendanceStruct(
      present: present,
      absent: absent,
      staffname: staffname,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttendanceStruct? updateAttendanceStruct(
  AttendanceStruct? attendance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attendance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttendanceStructData(
  Map<String, dynamic> firestoreData,
  AttendanceStruct? attendance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attendance == null) {
    return;
  }
  if (attendance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attendance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attendanceData = getAttendanceFirestoreData(attendance, forFieldValue);
  final nestedData = attendanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attendance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttendanceFirestoreData(
  AttendanceStruct? attendance, [
  bool forFieldValue = false,
]) {
  if (attendance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attendance.toMap());

  // Add any Firestore field values
  attendance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttendanceListFirestoreData(
  List<AttendanceStruct>? attendances,
) =>
    attendances?.map((e) => getAttendanceFirestoreData(e, true)).toList() ?? [];
