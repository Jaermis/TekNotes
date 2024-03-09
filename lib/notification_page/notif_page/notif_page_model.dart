import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notif_page_widget.dart' show NotifPageWidget;
import 'package:flutter/material.dart';

class NotifPageModel extends FlutterFlowModel<NotifPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in NotifPage widget.
  NotificationsRecord? recentNotif;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
