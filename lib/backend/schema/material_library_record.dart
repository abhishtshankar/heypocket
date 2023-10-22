import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaterialLibraryRecord extends FirestoreRecord {
  MaterialLibraryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "Itemname" field.
  String? _itemname;
  String get itemname => _itemname ?? '';
  bool hasItemname() => _itemname != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "TotalPrice" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "ItemPricePerPeice" field.
  double? _itemPricePerPeice;
  double get itemPricePerPeice => _itemPricePerPeice ?? 0.0;
  bool hasItemPricePerPeice() => _itemPricePerPeice != null;

  // "Units" field.
  double? _units;
  double get units => _units ?? 0.0;
  bool hasUnits() => _units != null;

  // "UnitsName" field.
  String? _unitsName;
  String get unitsName => _unitsName ?? '';
  bool hasUnitsName() => _unitsName != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Edited_at" field.
  DateTime? _editedAt;
  DateTime? get editedAt => _editedAt;
  bool hasEditedAt() => _editedAt != null;

  // "TotalStock" field.
  double? _totalStock;
  double get totalStock => _totalStock ?? 0.0;
  bool hasTotalStock() => _totalStock != null;

  void _initializeFields() {
    _userref = snapshotData['userref'] as DocumentReference?;
    _itemname = snapshotData['Itemname'] as String?;
    _description = snapshotData['Description'] as String?;
    _totalPrice = castToType<double>(snapshotData['TotalPrice']);
    _itemPricePerPeice = castToType<double>(snapshotData['ItemPricePerPeice']);
    _units = castToType<double>(snapshotData['Units']);
    _unitsName = snapshotData['UnitsName'] as String?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _editedAt = snapshotData['Edited_at'] as DateTime?;
    _totalStock = castToType<double>(snapshotData['TotalStock']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MaterialLibrary');

  static Stream<MaterialLibraryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaterialLibraryRecord.fromSnapshot(s));

  static Future<MaterialLibraryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MaterialLibraryRecord.fromSnapshot(s));

  static MaterialLibraryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaterialLibraryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaterialLibraryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaterialLibraryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaterialLibraryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaterialLibraryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaterialLibraryRecordData({
  DocumentReference? userref,
  String? itemname,
  String? description,
  double? totalPrice,
  double? itemPricePerPeice,
  double? units,
  String? unitsName,
  DateTime? createdAt,
  DateTime? editedAt,
  double? totalStock,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userref': userref,
      'Itemname': itemname,
      'Description': description,
      'TotalPrice': totalPrice,
      'ItemPricePerPeice': itemPricePerPeice,
      'Units': units,
      'UnitsName': unitsName,
      'Created_at': createdAt,
      'Edited_at': editedAt,
      'TotalStock': totalStock,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaterialLibraryRecordDocumentEquality
    implements Equality<MaterialLibraryRecord> {
  const MaterialLibraryRecordDocumentEquality();

  @override
  bool equals(MaterialLibraryRecord? e1, MaterialLibraryRecord? e2) {
    return e1?.userref == e2?.userref &&
        e1?.itemname == e2?.itemname &&
        e1?.description == e2?.description &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.itemPricePerPeice == e2?.itemPricePerPeice &&
        e1?.units == e2?.units &&
        e1?.unitsName == e2?.unitsName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.editedAt == e2?.editedAt &&
        e1?.totalStock == e2?.totalStock;
  }

  @override
  int hash(MaterialLibraryRecord? e) => const ListEquality().hash([
        e?.userref,
        e?.itemname,
        e?.description,
        e?.totalPrice,
        e?.itemPricePerPeice,
        e?.units,
        e?.unitsName,
        e?.createdAt,
        e?.editedAt,
        e?.totalStock
      ]);

  @override
  bool isValidKey(Object? o) => o is MaterialLibraryRecord;
}
