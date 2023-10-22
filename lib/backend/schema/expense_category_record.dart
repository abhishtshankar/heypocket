import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpenseCategoryRecord extends FirestoreRecord {
  ExpenseCategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "ExpenseUser" field.
  DocumentReference? _expenseUser;
  DocumentReference? get expenseUser => _expenseUser;
  bool hasExpenseUser() => _expenseUser != null;

  // "CreatedAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _category = snapshotData['Category'] as String?;
    _expenseUser = snapshotData['ExpenseUser'] as DocumentReference?;
    _createdAt = snapshotData['CreatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ExpenseCategory');

  static Stream<ExpenseCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpenseCategoryRecord.fromSnapshot(s));

  static Future<ExpenseCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpenseCategoryRecord.fromSnapshot(s));

  static ExpenseCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpenseCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpenseCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpenseCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpenseCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpenseCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpenseCategoryRecordData({
  String? category,
  DocumentReference? expenseUser,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Category': category,
      'ExpenseUser': expenseUser,
      'CreatedAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpenseCategoryRecordDocumentEquality
    implements Equality<ExpenseCategoryRecord> {
  const ExpenseCategoryRecordDocumentEquality();

  @override
  bool equals(ExpenseCategoryRecord? e1, ExpenseCategoryRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.expenseUser == e2?.expenseUser &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ExpenseCategoryRecord? e) =>
      const ListEquality().hash([e?.category, e?.expenseUser, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ExpenseCategoryRecord;
}
