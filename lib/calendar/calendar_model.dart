import '/components/calendar_comp_widget.dart';
import '/components/daily_events_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_widget.dart' show CalendarWidget;
import 'package:flutter/material.dart';

class CalendarModel extends FlutterFlowModel<CalendarWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ///  State fields for stateful widgets in this page.

  // Model for CalendarComp component.
  late CalendarCompModel calendarCompModel;
  // Model for DailyEventsList component.
  late DailyEventsListModel dailyEventsListModel;

  @override
  void initState(BuildContext context) {
    calendarCompModel = createModel(context, () => CalendarCompModel());
    dailyEventsListModel = createModel(context, () => DailyEventsListModel());
  }

  @override
  void dispose() {
    calendarCompModel.dispose();
    dailyEventsListModel.dispose();
  }
}
