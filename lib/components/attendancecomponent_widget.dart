import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendancecomponent_model.dart';
export 'attendancecomponent_model.dart';

class AttendancecomponentWidget extends StatefulWidget {
  const AttendancecomponentWidget({
    Key? key,
    this.staffname,
    required this.present,
    required this.absent,
  }) : super(key: key);

  final List<String>? staffname;
  final List<bool>? present;
  final List<bool>? absent;

  @override
  _AttendancecomponentWidgetState createState() =>
      _AttendancecomponentWidgetState();
}

class _AttendancecomponentWidgetState extends State<AttendancecomponentWidget> {
  late AttendancecomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendancecomponentModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          valueOrDefault<String>(
            widget.staffname?.first,
            '1',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Checkbox(
                key: ValueKey(widget.present!.first.toString()),
                value: _model.presentValue ??= false,
                onChanged: (newValue) async {
                  setState(() => _model.presentValue = newValue!);
                },
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).info,
              ),
            ),
            Text(
              'Present',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                unselectedWidgetColor:
                    FlutterFlowTheme.of(context).secondaryText,
              ),
              child: Checkbox(
                key: ValueKey(widget.absent!.first.toString()),
                value: _model.absentValue ??= false,
                onChanged: (newValue) async {
                  setState(() => _model.absentValue = newValue!);
                },
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).info,
              ),
            ),
            Text(
              'Absent',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
