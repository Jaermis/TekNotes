import '/flutter_flow/flutter_flow_util.dart';
import 'edit_p_p_widget.dart' show EditPPWidget;
import 'package:flutter/material.dart';

class EditPPModel extends FlutterFlowModel<EditPPWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
