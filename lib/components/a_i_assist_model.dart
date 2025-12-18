import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_assist_widget.dart' show AIAssistWidget;
import 'package:flutter/material.dart';

class AIAssistModel extends FlutterFlowModel<AIAssistWidget> {
  ///  Local state fields for this component.

  List<dynamic> messages = [];
  void addToMessages(dynamic item) => messages.add(item);
  void removeFromMessages(dynamic item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, dynamic item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(dynamic) updateFn) =>
      messages[index] = updateFn(messages[index]);

  bool isLoading = true;

  String currentQuestion = '';

  String aiResponseComp = 'Ask me anything about this event!';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - callAIWithQuestion] action in IconButton widget.
  String? aiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
