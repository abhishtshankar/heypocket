import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _value = prefs.getInt('ff_value') ?? _value;
    });
    _safeInit(() {
      _userRef = prefs.getString('ff_userRef')?.ref ?? _userRef;
    });
    _safeInit(() {
      _CreateStaff = prefs.getString('ff_CreateStaff')?.ref ?? _CreateStaff;
    });
    _safeInit(() {
      _staffDropdown =
          prefs.getStringList('ff_staffDropdown') ?? _staffDropdown;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchactive = false;
  bool get searchactive => _searchactive;
  set searchactive(bool _value) {
    _searchactive = _value;
  }

  List<DocumentReference> _POVar = [];
  List<DocumentReference> get POVar => _POVar;
  set POVar(List<DocumentReference> _value) {
    _POVar = _value;
  }

  void addToPOVar(DocumentReference _value) {
    _POVar.add(_value);
  }

  void removeFromPOVar(DocumentReference _value) {
    _POVar.remove(_value);
  }

  void removeAtIndexFromPOVar(int _index) {
    _POVar.removeAt(_index);
  }

  void updatePOVarAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _POVar[_index] = updateFn(_POVar[_index]);
  }

  void insertAtIndexInPOVar(int _index, DocumentReference _value) {
    _POVar.insert(_index, _value);
  }

  int _value = 0;
  int get value => _value;
  set value(int _value) {
    _value = _value;
    prefs.setInt('ff_value', _value);
  }

  List<MaterialusedStruct> _usedmaterial = [];
  List<MaterialusedStruct> get usedmaterial => _usedmaterial;
  set usedmaterial(List<MaterialusedStruct> _value) {
    _usedmaterial = _value;
  }

  void addToUsedmaterial(MaterialusedStruct _value) {
    _usedmaterial.add(_value);
  }

  void removeFromUsedmaterial(MaterialusedStruct _value) {
    _usedmaterial.remove(_value);
  }

  void removeAtIndexFromUsedmaterial(int _index) {
    _usedmaterial.removeAt(_index);
  }

  void updateUsedmaterialAtIndex(
    int _index,
    MaterialusedStruct Function(MaterialusedStruct) updateFn,
  ) {
    _usedmaterial[_index] = updateFn(_usedmaterial[_index]);
  }

  void insertAtIndexInUsedmaterial(int _index, MaterialusedStruct _value) {
    _usedmaterial.insert(_index, _value);
  }

  List<String> _itemsList = [];
  List<String> get itemsList => _itemsList;
  set itemsList(List<String> _value) {
    _itemsList = _value;
  }

  void addToItemsList(String _value) {
    _itemsList.add(_value);
  }

  void removeFromItemsList(String _value) {
    _itemsList.remove(_value);
  }

  void removeAtIndexFromItemsList(int _index) {
    _itemsList.removeAt(_index);
  }

  void updateItemsListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _itemsList[_index] = updateFn(_itemsList[_index]);
  }

  void insertAtIndexInItemsList(int _index, String _value) {
    _itemsList.insert(_index, _value);
  }

  List<DocumentReference> _Estimate = [];
  List<DocumentReference> get Estimate => _Estimate;
  set Estimate(List<DocumentReference> _value) {
    _Estimate = _value;
  }

  void addToEstimate(DocumentReference _value) {
    _Estimate.add(_value);
  }

  void removeFromEstimate(DocumentReference _value) {
    _Estimate.remove(_value);
  }

  void removeAtIndexFromEstimate(int _index) {
    _Estimate.removeAt(_index);
  }

  void updateEstimateAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Estimate[_index] = updateFn(_Estimate[_index]);
  }

  void insertAtIndexInEstimate(int _index, DocumentReference _value) {
    _Estimate.insert(_index, _value);
  }

  List<DocumentReference> _Invoice = [];
  List<DocumentReference> get Invoice => _Invoice;
  set Invoice(List<DocumentReference> _value) {
    _Invoice = _value;
  }

  void addToInvoice(DocumentReference _value) {
    _Invoice.add(_value);
  }

  void removeFromInvoice(DocumentReference _value) {
    _Invoice.remove(_value);
  }

  void removeAtIndexFromInvoice(int _index) {
    _Invoice.removeAt(_index);
  }

  void updateInvoiceAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Invoice[_index] = updateFn(_Invoice[_index]);
  }

  void insertAtIndexInInvoice(int _index, DocumentReference _value) {
    _Invoice.insert(_index, _value);
  }

  DocumentReference? _displaye;
  DocumentReference? get displaye => _displaye;
  set displaye(DocumentReference? _value) {
    _displaye = _value;
  }

  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? _value) {
    _userRef = _value;
    _value != null
        ? prefs.setString('ff_userRef', _value.path)
        : prefs.remove('ff_userRef');
  }

  DocumentReference? _CreateStaff;
  DocumentReference? get CreateStaff => _CreateStaff;
  set CreateStaff(DocumentReference? _value) {
    _CreateStaff = _value;
    _value != null
        ? prefs.setString('ff_CreateStaff', _value.path)
        : prefs.remove('ff_CreateStaff');
  }

  Color _colors = Colors.transparent;
  Color get colors => _colors;
  set colors(Color _value) {
    _colors = _value;
  }

  double _sum = 0.0;
  double get sum => _sum;
  set sum(double _value) {
    _sum = _value;
  }

  List<String> _staffDropdown = [];
  List<String> get staffDropdown => _staffDropdown;
  set staffDropdown(List<String> _value) {
    _staffDropdown = _value;
    prefs.setStringList('ff_staffDropdown', _value);
  }

  void addToStaffDropdown(String _value) {
    _staffDropdown.add(_value);
    prefs.setStringList('ff_staffDropdown', _staffDropdown);
  }

  void removeFromStaffDropdown(String _value) {
    _staffDropdown.remove(_value);
    prefs.setStringList('ff_staffDropdown', _staffDropdown);
  }

  void removeAtIndexFromStaffDropdown(int _index) {
    _staffDropdown.removeAt(_index);
    prefs.setStringList('ff_staffDropdown', _staffDropdown);
  }

  void updateStaffDropdownAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _staffDropdown[_index] = updateFn(_staffDropdown[_index]);
    prefs.setStringList('ff_staffDropdown', _staffDropdown);
  }

  void insertAtIndexInStaffDropdown(int _index, String _value) {
    _staffDropdown.insert(_index, _value);
    prefs.setStringList('ff_staffDropdown', _staffDropdown);
  }

  List<AttendanceStruct> _attendnace = [
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"present\":\"true\",\"absent\":\"true\",\"staffname\":\"Hello World\"}'))
  ];
  List<AttendanceStruct> get attendnace => _attendnace;
  set attendnace(List<AttendanceStruct> _value) {
    _attendnace = _value;
  }

  void addToAttendnace(AttendanceStruct _value) {
    _attendnace.add(_value);
  }

  void removeFromAttendnace(AttendanceStruct _value) {
    _attendnace.remove(_value);
  }

  void removeAtIndexFromAttendnace(int _index) {
    _attendnace.removeAt(_index);
  }

  void updateAttendnaceAtIndex(
    int _index,
    AttendanceStruct Function(AttendanceStruct) updateFn,
  ) {
    _attendnace[_index] = updateFn(_attendnace[_index]);
  }

  void insertAtIndexInAttendnace(int _index, AttendanceStruct _value) {
    _attendnace.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
