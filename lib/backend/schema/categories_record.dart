import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CategoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "UserCategory" field.
  DocumentReference? _userCategory;
  DocumentReference? get userCategory => _userCategory;
  bool hasUserCategory() => _userCategory != null;

  // "ProductCategory" field.
  DocumentReference? _productCategory;
  DocumentReference? get productCategory => _productCategory;
  bool hasProductCategory() => _productCategory != null;

  void _initializeFields() {
    _categoryName = snapshotData['CategoryName'] as String?;
    _userCategory = snapshotData['UserCategory'] as DocumentReference?;
    _productCategory = snapshotData['ProductCategory'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  DocumentReference? userCategory,
  DocumentReference? productCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CategoryName': categoryName,
      'UserCategory': userCategory,
      'ProductCategory': productCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.userCategory == e2?.userCategory &&
        e1?.productCategory == e2?.productCategory;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryName, e?.userCategory, e?.productCategory]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
