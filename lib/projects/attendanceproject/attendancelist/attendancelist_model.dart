import '/backend/backend.dart';
import '/components/topheader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'attendancelist_widget.dart' show AttendancelistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttendancelistModel extends FlutterFlowModel<AttendancelistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for topheader component.
  late TopheaderModel topheaderModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topheaderModel = createModel(context, () => TopheaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    topheaderModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
