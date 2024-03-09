import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/flashcard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'view_quiz_model.dart';
export 'view_quiz_model.dart';

class ViewQuizWidget extends StatefulWidget {
  const ViewQuizWidget({
    super.key,
    required this.quizRef,
  });

  final DocumentReference? quizRef;

  @override
  State<ViewQuizWidget> createState() => _ViewQuizWidgetState();
}

class _ViewQuizWidgetState extends State<ViewQuizWidget> {
  late ViewQuizModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewQuizModel());

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

    return StreamBuilder<QuizRecord>(
      stream: QuizRecord.getDocument(widget.quizRef!),
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
        final viewQuizQuizRecord = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 1197.0,
                height: 919.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 40.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'v6n55gye' /* Back */,
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
                            ),
                            const Spacer(),
                            if (viewQuizQuizRecord.userAuthor ==
                                currentUserReference)
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 60.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 0.0,
                                      borderWidth: 0.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.delete,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        await widget.quizRef!.delete();
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          const Text('Delete Note'),
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
                                                          child:
                                                              const Text('Confirm'),
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
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<QuestionsRecord>>(
                                      stream: queryQuestionsRecord(
                                        parent: widget.quizRef,
                                      ),
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
                                        List<QuestionsRecord>
                                            carouselQuestionsRecordList =
                                            snapshot.data!;
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 646.0,
                                          child: CarouselSlider.builder(
                                            itemCount:
                                                carouselQuestionsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, carouselIndex, _) {
                                              final carouselQuestionsRecord =
                                                  carouselQuestionsRecordList[
                                                      carouselIndex];
                                              return Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: FlashcardWidget(
                                                      key: Key(
                                                          'Key20w_${carouselIndex}_of_${carouselQuestionsRecordList.length}'),
                                                      question:
                                                          carouselQuestionsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                            carouselController:
                                                _model.carouselController ??=
                                                    CarouselController(),
                                            options: CarouselOptions(
                                              initialPage: min(
                                                  1,
                                                  carouselQuestionsRecordList
                                                          .length -
                                                      1),
                                              viewportFraction: 0.5,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.25,
                                              enableInfiniteScroll: false,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: false,
                                              onPageChanged: (index, _) =>
                                                  _model.carouselCurrentIndex =
                                                      index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 20.0),
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
                                      final upvotePeopleElement =
                                          currentUserReference;
                                      final upvotePeopleUpdate =
                                          viewQuizQuizRecord.upvotePeople
                                                  .contains(upvotePeopleElement)
                                              ? FieldValue.arrayRemove(
                                                  [upvotePeopleElement])
                                              : FieldValue.arrayUnion(
                                                  [upvotePeopleElement]);
                                      await viewQuizQuizRecord.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'upvote_people': upvotePeopleUpdate,
                                          },
                                        ),
                                      });
                                      if (!viewQuizQuizRecord.upvotePeople
                                          .contains(currentUserReference)) {
                                        if (viewQuizQuizRecord.downvotePeople
                                            .contains(currentUserReference)) {
                                          await viewQuizQuizRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'downvote_count':
                                                    FieldValue.increment(-(1)),
                                                'downvote_people':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }

                                        await viewQuizQuizRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'upvote_count':
                                                  FieldValue.increment(1),
                                              'upvote_people':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await widget.quizRef!.update({
                                          ...mapToFirestore(
                                            {
                                              'upvote_count':
                                                  FieldValue.increment(-(1)),
                                              'upvote_people':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value: viewQuizQuizRecord.upvotePeople
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
                                        viewQuizQuizRecord.upvoteCount,
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
                                      final downvotePeopleElement =
                                          currentUserReference;
                                      final downvotePeopleUpdate =
                                          viewQuizQuizRecord.downvotePeople
                                                  .contains(
                                                      downvotePeopleElement)
                                              ? FieldValue.arrayRemove(
                                                  [downvotePeopleElement])
                                              : FieldValue.arrayUnion(
                                                  [downvotePeopleElement]);
                                      await viewQuizQuizRecord.reference
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'downvote_people':
                                                downvotePeopleUpdate,
                                          },
                                        ),
                                      });
                                      if (!viewQuizQuizRecord.downvotePeople
                                          .contains(currentUserReference)) {
                                        if (viewQuizQuizRecord.upvotePeople
                                            .contains(currentUserReference)) {
                                          await viewQuizQuizRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'upvote_people':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                                'upvote_count':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });
                                        }

                                        await viewQuizQuizRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'downvote_count':
                                                  FieldValue.increment(1),
                                              'downvote_people':
                                                  FieldValue.arrayUnion(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await viewQuizQuizRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'downvote_count':
                                                  FieldValue.increment(-(1)),
                                              'downvote_people':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }
                                    },
                                    value: viewQuizQuizRecord.downvotePeople
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
                                        viewQuizQuizRecord.downvoteCount,
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
