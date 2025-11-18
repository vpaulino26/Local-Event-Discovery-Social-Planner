import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'events_list_widget.dart' show EventsListWidget;
import 'package:flutter/material.dart';

class EventsListModel extends FlutterFlowModel<EventsListWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in eventsList widget.
  UsersRecord? usersDocument;
  // Stores action output result for [Custom Action - joinInterestsList] action in eventsList widget.
  String? joinedInterests;
  // Stores action output result for [Custom Action - callTicketmasterAPI] action in eventsList widget.
  List<dynamic>? apiResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - callTicketmasterAPI] action in TextField widget.
  List<dynamic>? searchResult;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }
}
