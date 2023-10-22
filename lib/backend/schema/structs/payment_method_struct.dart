// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodStruct extends FFFirebaseStruct {
  PaymentMethodStruct({
    String? uPITransfer,
    String? cash,
    String? cheque,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uPITransfer = uPITransfer,
        _cash = cash,
        _cheque = cheque,
        super(firestoreUtilData);

  // "UPI_Transfer" field.
  String? _uPITransfer;
  String get uPITransfer => _uPITransfer ?? '';
  set uPITransfer(String? val) => _uPITransfer = val;
  bool hasUPITransfer() => _uPITransfer != null;

  // "Cash" field.
  String? _cash;
  String get cash => _cash ?? '';
  set cash(String? val) => _cash = val;
  bool hasCash() => _cash != null;

  // "Cheque" field.
  String? _cheque;
  String get cheque => _cheque ?? '';
  set cheque(String? val) => _cheque = val;
  bool hasCheque() => _cheque != null;

  static PaymentMethodStruct fromMap(Map<String, dynamic> data) =>
      PaymentMethodStruct(
        uPITransfer: data['UPI_Transfer'] as String?,
        cash: data['Cash'] as String?,
        cheque: data['Cheque'] as String?,
      );

  static PaymentMethodStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PaymentMethodStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'UPI_Transfer': _uPITransfer,
        'Cash': _cash,
        'Cheque': _cheque,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UPI_Transfer': serializeParam(
          _uPITransfer,
          ParamType.String,
        ),
        'Cash': serializeParam(
          _cash,
          ParamType.String,
        ),
        'Cheque': serializeParam(
          _cheque,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentMethodStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentMethodStruct(
        uPITransfer: deserializeParam(
          data['UPI_Transfer'],
          ParamType.String,
          false,
        ),
        cash: deserializeParam(
          data['Cash'],
          ParamType.String,
          false,
        ),
        cheque: deserializeParam(
          data['Cheque'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentMethodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentMethodStruct &&
        uPITransfer == other.uPITransfer &&
        cash == other.cash &&
        cheque == other.cheque;
  }

  @override
  int get hashCode => const ListEquality().hash([uPITransfer, cash, cheque]);
}

PaymentMethodStruct createPaymentMethodStruct({
  String? uPITransfer,
  String? cash,
  String? cheque,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentMethodStruct(
      uPITransfer: uPITransfer,
      cash: cash,
      cheque: cheque,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentMethodStruct? updatePaymentMethodStruct(
  PaymentMethodStruct? paymentMethod, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentMethod
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentMethodStructData(
  Map<String, dynamic> firestoreData,
  PaymentMethodStruct? paymentMethod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentMethod == null) {
    return;
  }
  if (paymentMethod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentMethod.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentMethodData =
      getPaymentMethodFirestoreData(paymentMethod, forFieldValue);
  final nestedData =
      paymentMethodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentMethod.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentMethodFirestoreData(
  PaymentMethodStruct? paymentMethod, [
  bool forFieldValue = false,
]) {
  if (paymentMethod == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentMethod.toMap());

  // Add any Firestore field values
  paymentMethod.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentMethodListFirestoreData(
  List<PaymentMethodStruct>? paymentMethods,
) =>
    paymentMethods
        ?.map((e) => getPaymentMethodFirestoreData(e, true))
        .toList() ??
    [];
