import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'create_item_widget.dart' show CreateItemWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateItemModel extends FlutterFlowModel<CreateItemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SellingPrice widget.
  FocusNode? sellingPriceFocusNode;
  TextEditingController? sellingPriceController;
  String? Function(BuildContext, String?)? sellingPriceControllerValidator;
  // State field(s) for PurchasePrice widget.
  FocusNode? purchasePriceFocusNode;
  TextEditingController? purchasePriceController;
  String? Function(BuildContext, String?)? purchasePriceControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for Percent widget.
  String? percentValue;
  FormFieldController<String>? percentValueController;
  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for GST widget.
  String? gstValue;
  FormFieldController<String>? gstValueController;
  // State field(s) for Unit widget.
  FocusNode? unitFocusNode;
  TextEditingController? unitController;
  String? Function(BuildContext, String?)? unitControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    tabBarController?.dispose();
    sellingPriceFocusNode?.dispose();
    sellingPriceController?.dispose();

    purchasePriceFocusNode?.dispose();
    purchasePriceController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    unitFocusNode?.dispose();
    unitController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
