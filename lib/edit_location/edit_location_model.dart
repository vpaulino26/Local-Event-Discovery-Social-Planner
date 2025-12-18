import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_location_widget.dart' show EditLocationWidget;
import 'package:flutter/material.dart';

class EditLocationModel extends FlutterFlowModel<EditLocationWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your city is required';
    }

    return null;
  }

  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for Slider widget.
  double? sliderValue;

  @override
  void initState(BuildContext context) {
    cityTextControllerValidator = _cityTextControllerValidator;
  }

  @override
  void dispose() {
    cityFocusNode?.dispose();
    cityTextController?.dispose();
  }
}
