import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'attendance_widget.dart' show AttendanceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttendanceModel extends FlutterFlowModel<AttendanceWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  List<ProjectStaff1Record>? listViewProjectStaff1RecordListPreviousSnapshot;
  // State field(s) for present widget.

  Map<ProjectStaff1Record, bool> presentValueMap = {};
  List<ProjectStaff1Record> get presentCheckedItems =>
      presentValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for absent widget.

  Map<ProjectStaff1Record, bool> absentValueMap = {};
  List<ProjectStaff1Record> get absentCheckedItems =>
      absentValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
