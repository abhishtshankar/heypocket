import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/topheader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'material_libarary_widget.dart' show MaterialLibararyWidget;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MaterialLibararyModel extends FlutterFlowModel<MaterialLibararyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topheader component.
  late TopheaderModel topheaderModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ItemName widget.
  FocusNode? itemNameFocusNode1;
  TextEditingController? itemNameController1;
  String? Function(BuildContext, String?)? itemNameController1Validator;
  // State field(s) for Price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;
  // State field(s) for Quantity widget.
  FocusNode? quantityFocusNode1;
  TextEditingController? quantityController1;
  String? Function(BuildContext, String?)? quantityController1Validator;
  // State field(s) for ItemName widget.
  FocusNode? itemNameFocusNode2;
  TextEditingController? itemNameController2;
  String? Function(BuildContext, String?)? itemNameController2Validator;
  // State field(s) for Quantity widget.
  FocusNode? quantityFocusNode2;
  TextEditingController? quantityController2;
  String? Function(BuildContext, String?)? quantityController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topheaderModel = createModel(context, () => TopheaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topheaderModel.dispose();
    tabBarController?.dispose();
    itemNameFocusNode1?.dispose();
    itemNameController1?.dispose();

    priceFocusNode?.dispose();
    priceController?.dispose();

    quantityFocusNode1?.dispose();
    quantityController1?.dispose();

    itemNameFocusNode2?.dispose();
    itemNameController2?.dispose();

    quantityFocusNode2?.dispose();
    quantityController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
