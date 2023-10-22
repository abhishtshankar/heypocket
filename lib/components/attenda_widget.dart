import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attenda_model.dart';
export 'attenda_model.dart';

class AttendaWidget extends StatefulWidget {
  const AttendaWidget({
    Key? key,
    this.staffname,
    required this.date,
    required this.currentdate,
  }) : super(key: key);

  final String? staffname;
  final DateTime? date;
  final DateTime? currentdate;

  @override
  _AttendaWidgetState createState() => _AttendaWidgetState();
}

class _AttendaWidgetState extends State<AttendaWidget> {
  late AttendaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendaModel());

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

    return Container();
  }
}
