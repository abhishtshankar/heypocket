import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'marekeda_model.dart';
export 'marekeda_model.dart';

class MarekedaWidget extends StatefulWidget {
  const MarekedaWidget({
    Key? key,
    required this.absnet,
    required this.present,
  }) : super(key: key);

  final List<bool>? absnet;
  final List<bool>? present;

  @override
  _MarekedaWidgetState createState() => _MarekedaWidgetState();
}

class _MarekedaWidgetState extends State<MarekedaWidget> {
  late MarekedaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarekedaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Switch.adaptive(
      value: _model.switchValue ??= true,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
      },
      activeColor: FlutterFlowTheme.of(context).accent4,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
