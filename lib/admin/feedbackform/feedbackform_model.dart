import '/flutter_flow/flutter_flow_util.dart';
import 'feedbackform_widget.dart' show FeedbackformWidget;
import 'package:flutter/material.dart';

class FeedbackformModel extends FlutterFlowModel<FeedbackformWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentController;
  String? Function(BuildContext, String?)? contentControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleController?.dispose();

    contentFocusNode?.dispose();
    contentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
