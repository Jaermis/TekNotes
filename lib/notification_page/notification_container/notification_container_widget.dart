import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/forum/open_post/open_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_container_model.dart';
export 'notification_container_model.dart';

class NotificationContainerWidget extends StatefulWidget {
  const NotificationContainerWidget({
    super.key,
    this.document,
    required this.notif,
  });

  final DocumentReference? document;
  final DocumentReference? notif;

  @override
  State<NotificationContainerWidget> createState() =>
      _NotificationContainerWidgetState();
}

class _NotificationContainerWidgetState
    extends State<NotificationContainerWidget> {
  late NotificationContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationContainerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await widget.notif!.update(createNotificationsRecordData(
        seen: true,
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NotificationsRecord>(
      stream: NotificationsRecord.getDocument(widget.notif!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitChasingDots(
                color: Color(0xFF630F12),
                size: 50.0,
              ),
            ),
          );
        }
        final rowNotificationsRecord = snapshot.data!;
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (rowNotificationsRecord.notificationType == 'comment') {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: OpenPostWidget(
                      postRef: widget.document!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }

            await rowNotificationsRecord.reference
                .update(createNotificationsRecordData(
              seen: true,
            ));
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-0.58, 0.04),
                              child: StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(
                                    rowNotificationsRecord.sender!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: Color(0xFF630F12),
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final circleImageUsersRecord = snapshot.data!;
                                  return Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      circleImageUsersRecord.photoUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                            if (rowNotificationsRecord.notificationType ==
                                'like')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.thumb_up,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            if (rowNotificationsRecord.notificationType ==
                                'dislike')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.thumb_down,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            if (rowNotificationsRecord.notificationType ==
                                'comment')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.mode_comment,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            if (rowNotificationsRecord.notificationType ==
                                'save')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.bookmark_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            if (rowNotificationsRecord.notificationType ==
                                'follow')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.person_add_alt_1,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            if (rowNotificationsRecord.notificationType ==
                                'flag')
                              Align(
                                alignment: const AlignmentDirectional(0.94, 0.76),
                                child: Icon(
                                  Icons.flag_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 80,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<UsersRecord>(
                          stream: UsersRecord.getDocument(
                              rowNotificationsRecord.sender!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitChasingDots(
                                    color: Color(0xFF630F12),
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final columnUsersRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: columnUsersRecord.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${rowNotificationsRecord.message}',
                                          style: GoogleFonts.getFont(
                                            'Montserrat',
                                            fontSize: 20.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    dateTimeFormat(
                                      'relative',
                                      rowNotificationsRecord.timePosted!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (!rowNotificationsRecord.seen)
                                Icon(
                                  Icons.circle_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
