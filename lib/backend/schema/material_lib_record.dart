import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialLibRecord extends FirestoreRecord {
  MaterialLibRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ItemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Qty" field.
  double? _qty;
  double get qty => _qty ?? 0.0;
  bool hasQty() => _qty != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "dateused" field.
  DateTime? _dateused;
  DateTime? get dateused => _dateused;
  bool hasDateused() => _dateused != null;

  // "materialused" field.
  List<MaterialusedStruct>? _materialused;
  List<MaterialusedStruct> get materialused => _materialused ?? const [];
  bool hasMaterialused() => _materialused != null;

  // "materialused1" field.
  List<double>? _materialused1;
  List<double> get materialused1 => _materialused1 ?? const [];
  bool hasMaterialused1() => _materialused1 != null;

  // "materialused2" field.
  double? _materialused2;
  double get materialused2 => _materialused2 ?? 0.0;
  bool hasMaterialused2() => _materialused2 != null;

  // "projectreferance" field.
  DocumentReference? _projectreferance;
  DocumentReference? get projectreferance => _projectreferance;
  bool hasProjectreferance() => _projectreferance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _itemName = snapshotData['ItemName'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _qty = castToType<double>(snapshotData['Qty']);
    _createdat = snapshotData['createdat'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _dateused = snapshotData['dateused'] as DateTime?;
    _materialused = getStructList(
      snapshotData['materialused'],
      MaterialusedStruct.fromMap,
    );
    _materialused1 = getDataList(snapshotData['materialused1']);
    _materialused2 = castToType<double>(snapshotData['materialused2']);
    _projectreferance = snapshotData['projectreferance'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MaterialLib')
          : FirebaseFirestore.instance.collectionGroup('MaterialLib');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('MaterialLib').doc();

  static Stream<MaterialLibRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialLibRecord.fromSnapshot(s));

  static Future<MaterialLibRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialLibRecord.fromSnapshot(s));

  static MaterialLibRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialLibRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialLibRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialLibRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialLibRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialLibRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialLibRecordData({
  String? itemName,
  double? price,
  double? qty,
  DateTime? createdat,
  DocumentReference? user,
  DateTime? dateused,
  double? materialused2,
  DocumentReference? projectreferance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ItemName': itemName,
      'Price': price,
      'Qty': qty,
      'createdat': createdat,
      'user': user,
      'dateused': dateused,
      'materialused2': materialused2,
      'projectreferance': projectreferance,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialLibRecordDocumentEquality implements Equality<MaterialLibRecord> {
  const MaterialLibRecordDocumentEquality();

  @override
  bool equals(MaterialLibRecord? e1, MaterialLibRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemName == e2?.itemName &&
        e1?.price == e2?.price &&
        e1?.qty == e2?.qty &&
        e1?.createdat == e2?.createdat &&
        e1?.user == e2?.user &&
        e1?.dateused == e2?.dateused &&
        listEquality.equals(e1?.materialused, e2?.materialused) &&
        listEquality.equals(e1?.materialused1, e2?.materialused1) &&
        e1?.materialused2 == e2?.materialused2 &&
        e1?.projectreferance == e2?.projectreferance;
  }

  @override
  int hash(MaterialLibRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.price,
        e?.qty,
        e?.createdat,
        e?.user,
        e?.dateused,
        e?.materialused,
        e?.materialused1,
        e?.materialused2,
        e?.projectreferance
      ]);

  @override
  bool isValidKey(Object? o) => o is MaterialLibRecord;
}
