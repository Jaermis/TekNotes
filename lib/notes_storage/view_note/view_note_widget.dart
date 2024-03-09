import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'view_note_model.dart';
export 'view_note_model.dart';

class ViewNoteWidget extends StatefulWidget {
  const ViewNoteWidget({
    super.key,
    required this.noteRef,
  });

  final DocumentReference? noteRef;

  @override
  State<ViewNoteWidget> createState() => _ViewNoteWidgetState();
}

class _ViewNoteWidgetState extends State<ViewNoteWidget> {
  late ViewNoteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewNoteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 1197.0,
            height: 895.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: StreamBuilder<NotesRecord>(
              stream: NotesRecord.getDocument(widget.noteRef!),
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
                final columnNotesRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: FFLocalizations.of(context).getText(
                                'kk37r3rs' /* Back */,
                              ),
                              icon: const Icon(
                                Icons.chevron_left,
                                size: 30.0,
                              ),
                              options: FFButtonOptions(
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                670.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await actions.downloadFile(
                                  columnNotesRecord.pdfUrl,
                                );
                                context.safePop();
                              },
                              text: FFLocalizations.of(context).getText(
                                'wkw58eex' /* Download PDF */,
                              ),
                              icon: const Icon(
                                Icons.download,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 20.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          if (columnNotesRecord.postUser ==
                              currentUserReference)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 0.0,
                                borderWidth: 0.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.delete,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 40.0,
                                ),
                                onPressed: () async {
                                  await FirebaseStorage.instance
                                      .refFromURL(columnNotesRecord.pdfUrl)
                                      .delete();
                                  await columnNotesRecord.reference.delete();
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Delete Note'),
                                                content: const Text(
                                                    'Note has been successfully deleted'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: const Text('Confirm'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  context.safePop();
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: 1079.0,
                        height: 652.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF868686),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 50.0, 30.0, 30.0),
                          child: FlutterFlowPdfViewer(
                            networkPath: columnNotesRecord.pdfUrl,
                            height: 868.0,
                            horizontalScroll: false,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ToggleIcon(
                                    onPressed: () async {
                                      final likesElement = currentUserReference;
                                      final likesUpdate = columnNotesRecord
                                              .likes
                                              .contains(likesElement)
                                          ? FieldValue.arrayRemove(
                                              [likesElement])
                                          : FieldValue.arrayUnion(
                                              [likesElement]);
                                      await columnNotesRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'likes': likesUpdate,
                                          },
                                        ),
                                      });
                                      if (!columnNotesRecord.likes
                                          .contains(currentUserReference)) {
                                        if (columnNotesRecord.downvotes
                                            .contains(currentUserReference)) {
                                          await columnNotesRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'num_downvotes':
                                                    FieldValue.increment(-(1)),
                                                'downvotes':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }

                                        await columnNotesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'num_votes':
                                                  FieldValue.increment(1),
                                              'likes': FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await columnNotesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'num_votes':
                                                  FieldValue.increment(-(1)),
                                              'likes': FieldValue.arrayRemove(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value: columnNotesRecord.likes
                                        .contains(currentUserReference),
                                    onIcon: Icon(
                                      Icons.thumb_up,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.thumb_up_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      formatNumber(
                                        columnNotesRecord.numVotes,
                                        formatType: FormatType.compact,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  ToggleIcon(
                                    onPressed: () async {
                                      final downvotesElement =
                                          currentUserReference;
                                      final downvotesUpdate = columnNotesRecord
                                              .downvotes
                                              .contains(downvotesElement)
                                          ? FieldValue.arrayRemove(
                                              [downvotesElement])
                                          : FieldValue.arrayUnion(
                                              [downvotesElement]);
                                      await columnNotesRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'downvotes': downvotesUpdate,
                                          },
                                        ),
                                      });
                                      if (!columnNotesRecord.downvotes
                                          .contains(currentUserReference)) {
                                        if (columnNotesRecord.likes
                                            .contains(currentUserReference)) {
                                          await columnNotesRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                                'num_votes':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });
                                        }

                                        await columnNotesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'num_downvotes':
                                                  FieldValue.increment(1),
                                              'downvotes':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await columnNotesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'num_downvotes':
                                                  FieldValue.increment(-(1)),
                                              'downvotes':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value: columnNotesRecord.downvotes
                                        .contains(currentUserReference),
                                    onIcon: Icon(
                                      Icons.thumb_down,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.thumb_down_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      formatNumber(
                                        columnNotesRecord.numDownvotes,
                                        formatType: FormatType.compact,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ToggleIcon(
                                    onPressed: () async {
                                      setState(() => FFAppState().flaggedPost =
                                          !FFAppState().flaggedPost);
                                    },
                                    value: FFAppState().flaggedPost,
                                    onIcon: Icon(
                                      Icons.flag_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                    offIcon: Icon(
                                      Icons.flag_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
