import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxNameRecord extends FirestoreRecord {
  TaxNameRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TaxName" field.
  String? _taxName;
  String get taxName => _taxName ?? '';
  bool hasTaxName() => _taxName != null;

  // "UserTax" field.
  DocumentReference? _userTax;
  DocumentReference? get userTax => _userTax;
  bool hasUserTax() => _userTax != null;

  // "PrdouctTax" field.
  DocumentReference? _prdouctTax;
  DocumentReference? get prdouctTax => _prdouctTax;
  bool hasPrdouctTax() => _prdouctTax != null;

  void _initializeFields() {
    _taxName = snapshotData['TaxName'] as String?;
    _userTax = snapshotData['UserTax'] as DocumentReference?;
    _prdouctTax = snapshotData['PrdouctTax'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TaxName');

  static Stream<TaxNameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaxNameRecord.fromSnapshot(s));

  static Future<TaxNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaxNameRecord.fromSnapshot(s));

  static TaxNameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaxNameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaxNameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaxNameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaxNameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaxNameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaxNameRecordData({
  String? taxName,
  DocumentReference? userTax,
  DocumentReference? prdouctTax,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TaxName': taxName,
      'UserTax': userTax,
      'PrdouctTax': prdouctTax,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaxNameRecordDocumentEquality implements Equality<TaxNameRecord> {
  const TaxNameRecordDocumentEquality();

  @override
  bool equals(TaxNameRecord? e1, TaxNameRecord? e2) {
    return e1?.taxName == e2?.taxName &&
        e1?.userTax == e2?.userTax &&
        e1?.prdouctTax == e2?.prdouctTax;
  }

  @override
  int hash(TaxNameRecord? e) =>
      const ListEquality().hash([e?.taxName, e?.userTax, e?.prdouctTax]);

  @override
  bool isValidKey(Object? o) => o is TaxNameRecord;
}
