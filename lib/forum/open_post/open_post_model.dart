import '/flutter_flow/flutter_flow_util.dart';
import 'open_post_widget.dart' show OpenPostWidget;
import 'package:flutter/material.dart';

class OpenPostModel extends FlutterFlowModel<OpenPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for commentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldController;
  String? Function(BuildContext, String?)? commentFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFieldFocusNode?.dispose();
    commentFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
