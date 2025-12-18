import '/flutter_flow/flutter_flow_util.dart';
import 'add_event_widget.dart' show AddEventWidget;
import 'package:flutter/material.dart';

class AddEventModel extends FlutterFlowModel<AddEventWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CEventName widget.
  FocusNode? cEventNameFocusNode;
  TextEditingController? cEventNameTextController;
  String? Function(BuildContext, String?)? cEventNameTextControllerValidator;
  // State field(s) for CEventDesc widget.
  FocusNode? cEventDescFocusNode;
  TextEditingController? cEventDescTextController;
  String? Function(BuildContext, String?)? cEventDescTextControllerValidator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for CEventDate widget.
  FocusNode? cEventDateFocusNode;
  TextEditingController? cEventDateTextController;
  String? Function(BuildContext, String?)? cEventDateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for EnterTime widget.
  FocusNode? enterTimeFocusNode;
  TextEditingController? enterTimeTextController;
  String? Function(BuildContext, String?)? enterTimeTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  bool isDataUploading_uploadDataGdi = false;
  FFUploadedFile uploadedLocalFile_uploadDataGdi =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataGdi = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cEventNameFocusNode?.dispose();
    cEventNameTextController?.dispose();

    cEventDescFocusNode?.dispose();
    cEventDescTextController?.dispose();

    cEventDateFocusNode?.dispose();
    cEventDateTextController?.dispose();

    enterTimeFocusNode?.dispose();
    enterTimeTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController5?.dispose();
  }
}
