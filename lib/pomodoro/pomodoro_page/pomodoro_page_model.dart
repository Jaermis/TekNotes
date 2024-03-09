import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'pomodoro_page_widget.dart' show PomodoroPageWidget;
import 'package:flutter/material.dart';

class PomodoroPageModel extends FlutterFlowModel<PomodoroPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds1 = 25000;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    25000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Timer widget.
  int timerMilliseconds2 = 5000;
  String timerValue2 = StopWatchTimer.getDisplayTime(
    5000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

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
    timerController1.dispose();
    timerController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
