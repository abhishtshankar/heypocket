import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpenseVsIncomeRecord extends FirestoreRecord {
  ExpenseVsIncomeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "IncomeAmount" field.
  double? _incomeAmount;
  double get incomeAmount => _incomeAmount ?? 0.0;
  bool hasIncomeAmount() => _incomeAmount != null;

  // "ExpenseAmount" field.
  double? _expenseAmount;
  double get expenseAmount => _expenseAmount ?? 0.0;
  bool hasExpenseAmount() => _expenseAmount != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ExpenseID" field.
  String? _expenseID;
  String get expenseID => _expenseID ?? '';
  bool hasExpenseID() => _expenseID != null;

  // "IncomeID" field.
  String? _incomeID;
  String get incomeID => _incomeID ?? '';
  bool hasIncomeID() => _incomeID != null;

  // "Createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "Edited" field.
  DateTime? _edited;
  DateTime? get edited => _edited;
  bool hasEdited() => _edited != null;

  // "TransactionNo" field.
  String? _transactionNo;
  String get transactionNo => _transactionNo ?? '';
  bool hasTransactionNo() => _transactionNo != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "SelectedStaff" field.
  String? _selectedStaff;
  String get selectedStaff => _selectedStaff ?? '';
  bool hasSelectedStaff() => _selectedStaff != null;

  // "CustomerSel" field.
  String? _customerSel;
  String get customerSel => _customerSel ?? '';
  bool hasCustomerSel() => _customerSel != null;

  // "VendorSel" field.
  String? _vendorSel;
  String get vendorSel => _vendorSel ?? '';
  bool hasVendorSel() => _vendorSel != null;

  // "CnV" field.
  DocumentReference? _cnV;
  DocumentReference? get cnV => _cnV;
  bool hasCnV() => _cnV != null;

  // "Project" field.
  DocumentReference? _project;
  DocumentReference? get project => _project;
  bool hasProject() => _project != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "PaymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "ProjectIncome" field.
  List<double>? _projectIncome;
  List<double> get projectIncome => _projectIncome ?? const [];
  bool hasProjectIncome() => _projectIncome != null;

  // "ProjectExpence" field.
  List<double>? _projectExpence;
  List<double> get projectExpence => _projectExpence ?? const [];
  bool hasProjectExpence() => _projectExpence != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _incomeAmount = castToType<double>(snapshotData['IncomeAmount']);
    _expenseAmount = castToType<double>(snapshotData['ExpenseAmount']);
    _name = snapshotData['Name'] as String?;
    _expenseID = snapshotData['ExpenseID'] as String?;
    _incomeID = snapshotData['IncomeID'] as String?;
    _createdat = snapshotData['Createdat'] as DateTime?;
    _edited = snapshotData['Edited'] as DateTime?;
    _transactionNo = snapshotData['TransactionNo'] as String?;
    _image = snapshotData['Image'] as String?;
    _date = snapshotData['Date'] as String?;
    _selectedStaff = snapshotData['SelectedStaff'] as String?;
    _customerSel = snapshotData['CustomerSel'] as String?;
    _vendorSel = snapshotData['VendorSel'] as String?;
    _cnV = snapshotData['CnV'] as DocumentReference?;
    _project = snapshotData['Project'] as DocumentReference?;
    _category = snapshotData['Category'] as String?;
    _paymentMode = snapshotData['PaymentMode'] as String?;
    _projectIncome = getDataList(snapshotData['ProjectIncome']);
    _projectExpence = getDataList(snapshotData['ProjectExpence']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ExpenseVsIncome')
          : FirebaseFirestore.instance.collectionGroup('ExpenseVsIncome');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ExpenseVsIncome').doc();

  static Stream<ExpenseVsIncomeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpenseVsIncomeRecord.fromSnapshot(s));

  static Future<ExpenseVsIncomeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpenseVsIncomeRecord.fromSnapshot(s));

  static ExpenseVsIncomeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpenseVsIncomeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpenseVsIncomeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpenseVsIncomeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpenseVsIncomeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpenseVsIncomeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpenseVsIncomeRecordData({
  DocumentReference? userRef,
  double? incomeAmount,
  double? expenseAmount,
  String? name,
  String? expenseID,
  String? incomeID,
  DateTime? createdat,
  DateTime? edited,
  String? transactionNo,
  String? image,
  String? date,
  String? selectedStaff,
  String? customerSel,
  String? vendorSel,
  DocumentReference? cnV,
  DocumentReference? project,
  String? category,
  String? paymentMode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserRef': userRef,
      'IncomeAmount': incomeAmount,
      'ExpenseAmount': expenseAmount,
      'Name': name,
      'ExpenseID': expenseID,
      'IncomeID': incomeID,
      'Createdat': createdat,
      'Edited': edited,
      'TransactionNo': transactionNo,
      'Image': image,
      'Date': date,
      'SelectedStaff': selectedStaff,
      'CustomerSel': customerSel,
      'VendorSel': vendorSel,
      'CnV': cnV,
      'Project': project,
      'Category': category,
      'PaymentMode': paymentMode,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpenseVsIncomeRecordDocumentEquality
    implements Equality<ExpenseVsIncomeRecord> {
  const ExpenseVsIncomeRecordDocumentEquality();

  @override
  bool equals(ExpenseVsIncomeRecord? e1, ExpenseVsIncomeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.incomeAmount == e2?.incomeAmount &&
        e1?.expenseAmount == e2?.expenseAmount &&
        e1?.name == e2?.name &&
        e1?.expenseID == e2?.expenseID &&
        e1?.incomeID == e2?.incomeID &&
        e1?.createdat == e2?.createdat &&
        e1?.edited == e2?.edited &&
        e1?.transactionNo == e2?.transactionNo &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.selectedStaff == e2?.selectedStaff &&
        e1?.customerSel == e2?.customerSel &&
        e1?.vendorSel == e2?.vendorSel &&
        e1?.cnV == e2?.cnV &&
        e1?.project == e2?.project &&
        e1?.category == e2?.category &&
        e1?.paymentMode == e2?.paymentMode &&
        listEquality.equals(e1?.projectIncome, e2?.projectIncome) &&
        listEquality.equals(e1?.projectExpence, e2?.projectExpence);
  }

  @override
  int hash(ExpenseVsIncomeRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.incomeAmount,
        e?.expenseAmount,
        e?.name,
        e?.expenseID,
        e?.incomeID,
        e?.createdat,
        e?.edited,
        e?.transactionNo,
        e?.image,
        e?.date,
        e?.selectedStaff,
        e?.customerSel,
        e?.vendorSel,
        e?.cnV,
        e?.project,
        e?.category,
        e?.paymentMode,
        e?.projectIncome,
        e?.projectExpence
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpenseVsIncomeRecord;
}
