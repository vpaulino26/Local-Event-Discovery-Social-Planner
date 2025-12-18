import '/components/day_lable_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_comp_widget.dart' show CalendarCompWidget;
import 'package:flutter/material.dart';

class CalendarCompModel extends FlutterFlowModel<CalendarCompWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  DateTime? inputDate;

  ///  State fields for stateful widgets in this component.

  // Model for DayLable component.
  late DayLableModel dayLableModel1;
  // Model for DayLable component.
  late DayLableModel dayLableModel2;
  // Model for DayLable component.
  late DayLableModel dayLableModel3;
  // Model for DayLable component.
  late DayLableModel dayLableModel4;
  // Model for DayLable component.
  late DayLableModel dayLableModel5;
  // Model for DayLable component.
  late DayLableModel dayLableModel6;
  // Model for DayLable component.
  late DayLableModel dayLableModel7;

  @override
  void initState(BuildContext context) {
    dayLableModel1 = createModel(context, () => DayLableModel());
    dayLableModel2 = createModel(context, () => DayLableModel());
    dayLableModel3 = createModel(context, () => DayLableModel());
    dayLableModel4 = createModel(context, () => DayLableModel());
    dayLableModel5 = createModel(context, () => DayLableModel());
    dayLableModel6 = createModel(context, () => DayLableModel());
    dayLableModel7 = createModel(context, () => DayLableModel());
  }

  @override
  void dispose() {
    dayLableModel1.dispose();
    dayLableModel2.dispose();
    dayLableModel3.dispose();
    dayLableModel4.dispose();
    dayLableModel5.dispose();
    dayLableModel6.dispose();
    dayLableModel7.dispose();
  }
}
