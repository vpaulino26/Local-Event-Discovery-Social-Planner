import '/components/day_lable_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_comp_model.dart';
export 'calendar_comp_model.dart';

class CalendarCompWidget extends StatefulWidget {
  const CalendarCompWidget({
    super.key,
    required this.inputDate,
    this.initalSelectedDate,
    this.onSelctedDateAction,
  });

  final DateTime? inputDate;
  final DateTime? initalSelectedDate;
  final Future Function(DateTime selectedDate)? onSelctedDateAction;

  @override
  State<CalendarCompWidget> createState() => _CalendarCompWidgetState();
}

class _CalendarCompWidgetState extends State<CalendarCompWidget> {
  late CalendarCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CALENDAR_CalendarComp_ON_INIT_STATE');
      logFirebaseEvent('CalendarComp_update_component_state');
      _model.inputDate = widget.inputDate;
      safeSetState(() {});
      if (widget.initalSelectedDate != null) {
        logFirebaseEvent('CalendarComp_update_component_state');
        _model.selectedDate = widget.initalSelectedDate;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 340.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      dateTimeFormat("MMMM", _model.inputDate),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    Text(
                      dateTimeFormat("y", _model.inputDate),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.restart_alt,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('CALENDAR_restart_alt_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_update_component_state');
                    _model.inputDate = getCurrentTimestamp;
                    _model.selectedDate = getCurrentTimestamp;
                    safeSetState(() {});
                    logFirebaseEvent('IconButton_execute_callback');
                    await widget.onSelctedDateAction?.call(
                      _model.selectedDate!,
                    );
                  },
                ),
              ),
            ].addToStart(SizedBox(width: 24.0)).addToEnd(SizedBox(width: 24.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.dayLableModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Mon',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Tue',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Wed',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Thu',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Fri',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Sat',
                  ),
                ),
                wrapWithModel(
                  model: _model.dayLableModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: DayLableWidget(
                    day: 'Sun',
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 202.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Builder(
                builder: (context) {
                  final calendar =
                      functions.getCalendarForMonth(_model.inputDate!).toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 18.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: calendar.length,
                    itemBuilder: (context, calendarIndex) {
                      final calendarItem = calendar[calendarIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CALENDAR_COMP_COMP_DayContainer_ON_TAP');
                          logFirebaseEvent(
                              'DayContainer_update_component_state');
                          _model.selectedDate = calendarItem.calendarDate;
                          safeSetState(() {});
                          logFirebaseEvent('DayContainer_execute_callback');
                          await widget.onSelctedDateAction?.call(
                            _model.selectedDate!,
                          );
                        },
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: dateTimeFormat(
                                        "yMd", calendarItem.calendarDate) ==
                                    dateTimeFormat("yMd", _model.selectedDate)
                                ? Color(0xFF6D92F9)
                                : Color(0x00000000),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: dateTimeFormat(
                                          "yMd", calendarItem.calendarDate) ==
                                      dateTimeFormat("yMd", getCurrentTimestamp)
                                  ? Color(0xFF6D92F9)
                                  : Color(0x00000000),
                              width: 0.8,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                                "d",
                                dateTimeFromSecondsSinceEpoch(
                                    valueOrDefault<int>(
                                  calendarItem.calendarDate?.secondsSinceEpoch,
                                  0,
                                ))),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                                  color: calendarItem.isPreviousMonth ||
                                          calendarItem.isNextMonth
                                      ? (dateTimeFormat("yMd",
                                                  calendarItem.calendarDate) ==
                                              dateTimeFormat(
                                                  "yMd", _model.selectedDate)
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : Color(0xFF6F6F6F))
                                      : (dateTimeFormat("yMd",
                                                  calendarItem.calendarDate) ==
                                              dateTimeFormat(
                                                  "yMd", _model.selectedDate)
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : FlutterFlowTheme.of(context)
                                              .primaryText),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            height: 40.0,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('CALENDAR_COMP_COMP_BackMonth_ON_TAP');
                      logFirebaseEvent('BackMonth_update_component_state');
                      _model.inputDate =
                          functions.getLastMonthDateTime(_model.inputDate!);
                      safeSetState(() {});
                    },
                  ),
                  Transform.rotate(
                    angle: 180.0 * (math.pi / 180),
                    child: FlutterFlowIconButton(
                      borderRadius: 100.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('CALENDAR_COMP_COMP_NextMonth_ON_TAP');
                        logFirebaseEvent('NextMonth_update_component_state');
                        _model.inputDate =
                            functions.getNextMonthDateTime(_model.inputDate!);
                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].addToStart(SizedBox(height: 16.0)),
      ),
    );
  }
}
