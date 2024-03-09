import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'upload_notes_model.dart';
export 'upload_notes_model.dart';

class UploadNotesWidget extends StatefulWidget {
  const UploadNotesWidget({super.key});

  @override
  State<UploadNotesWidget> createState() => _UploadNotesWidgetState();
}

class _UploadNotesWidgetState extends State<UploadNotesWidget> {
  late UploadNotesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadNotesModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: 1095.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '24wpz9iq' /* Upload Note */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: MouseCursor.defer ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            setState(() => _model.mouseRegionHovered = true);
                          }),
                          onExit: ((event) async {
                            setState(() => _model.mouseRegionHovered = false);
                          }),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final selectedFiles = await selectFiles(
                                allowedExtensions: ['pdf'],
                                multiFile: false,
                              );
                              if (selectedFiles != null) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedFiles
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedFiles.map(
                                      (f) async => await uploadData(
                                          f.storagePath, f.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedFiles.length &&
                                    downloadUrls.length ==
                                        selectedFiles.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                } else {
                                  setState(() {});
                                  return;
                                }
                              }

                              setState(() {
                                FFAppState().FileUploaded = true;
                              });
                            },
                            text: FFLocalizations.of(context).getText(
                              '1yiem2tw' /* Attach File */,
                            ),
                            icon: const Icon(
                              Icons.attach_file,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    decoration: TextDecoration.underline,
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'n5fxnwkz' /* Filename */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'dc996uai' /* Enter Filename Here... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 280.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: [
                            FFLocalizations.of(context).getText(
                              '0cuuygs7' /* #STS031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'wr0w9s2n' /* #PSYCH031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jncgt86a' /* #PE103 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '40jfx86n' /* #NSTP111 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jtu7jpeq' /* #MATH137 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ob47a7xc' /* #MATH031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ebalwdrz' /* #CPE361 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'ridlojmf' /* #CPE131 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'bf9dxkvx' /* #CHEM181 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r9sz9pww' /* #CHEM131 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'h7suk807' /* #PHYS182 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'henq58ql' /* #PHYS132 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'niciegyq' /* #PE104 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cab77af6' /* #NSTP112 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '6xwcoss6' /* #MATH138 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'vzm1xoa0' /* #CPE162 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cuyymt0s' /* #CPE132 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'kzvyxrjs' /* #SOCSCI031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'j9aennm4' /* #ENGL031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'z0xswhng' /* #PHILO031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5k4vz2li' /* #HUM031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rok1kzta' /* #ES031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4r2gyjol' /* #ENGL014 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '1p5i6lch' /* #EE281 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '3y5ykqbx' /* #EE231 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'r8lz053q' /* #CPE261 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'w538hkr3' /* #ES083 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5q925gyd' /* #SSP031 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'v08scq8c' /* #ECE254 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '8huof63c' /* #ECE204 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'p51gwe4o' /* #CPE264 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'j7hbxeiv' /* #CPE262 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '9v127yum' /* #CPE234 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'cjquvo7h' /* #CPE232 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'psq6c0kh' /* #CPE330 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'nedtpegp' /* #CPE340 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'j6ibp5yk' /* #ES038 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'jll9zr6h' /* #CPEPE361/SD */,
                            ),
                            FFLocalizations.of(context).getText(
                              'rtu7218y' /* #CPE381 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b18st1f4' /* #CPE363 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'njowtnzv' /* #CPE361 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '2cx5kirf' /* #CPE335 */,
                            ),
                            FFLocalizations.of(context).getText(
                              '5cpg97yz' /* #CPE333 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'q21bsipw' /* #CPE331 */,
                            )
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 180.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                          searchTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '3k623hgt' /* Tags... */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            'hp907fpv' /* Search Tag.... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().FileUploaded &&
                    (_model.textController.text != ''))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 555.0,
                            height: 46.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidFilePdf,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    _model.textController.text,
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).secondary,
                              borderRadius: 0.0,
                              borderWidth: 0.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                await FirebaseStorage.instance
                                    .refFromURL(_model.uploadedFileUrl)
                                    .delete();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await FirebaseStorage.instance
                              .refFromURL(_model.uploadedFileUrl)
                              .delete();
                          Navigator.pop(context);
                        },
                        text: FFLocalizations.of(context).getText(
                          'dvu6ivys' /* Cancel */,
                        ),
                        options: FFButtonOptions(
                          height: 60.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w800,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          hoverColor: FlutterFlowTheme.of(context).primary,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          hoverTextColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: ((/* NOT RECOMMENDED */ _model
                                          .textController.text ==
                                      'true') ||
                                  _model.isDataUploading ||
                                  (_model.dropDownValue == ''))
                              ? null
                              : () async {
                                  await NotesRecord.collection
                                      .doc()
                                      .set(createNotesRecordData(
                                        postTitle: _model.textController.text,
                                        postUser: currentUserReference,
                                        timePosted: getCurrentTimestamp,
                                        pdfUrl: _model.uploadedFileUrl,
                                        tag: _model.dropDownValue,
                                        accSender: valueOrDefault(
                                            currentUserDocument?.accType, ''),
                                      ));

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'contribution_points':
                                            FieldValue.increment(5),
                                      },
                                    ),
                                  });
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Notes Upload'),
                                            content: const Text('Upload succesful!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;

                                  await NotesAnalyticsRecord.collection
                                      .doc()
                                      .set(createNotesAnalyticsRecordData(
                                        notesCourse: (_model.dropDownValue!)
                                            .substring(1, 5),
                                        uploadCount: 1,
                                      ));
                                  _model.month =
                                      await queryNotesMonthlyRecordOnce(
                                    queryBuilder: (notesMonthlyRecord) =>
                                        notesMonthlyRecord.orderBy('month',
                                            descending: true),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.month?.month !=
                                      functions.monthGetter()) {
                                    await NotesMonthlyRecord.collection
                                        .doc()
                                        .set(createNotesMonthlyRecordData(
                                          uploadCount: 1,
                                          month: functions.monthGetter(),
                                        ));
                                  } else {
                                    await _model.month!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'upload_count':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  }

                                  setState(() {
                                    FFAppState().FileUploaded = false;
                                  });
                                  context.safePop();

                                  setState(() {});
                                },
                          text: FFLocalizations.of(context).getText(
                            'xbbzdr4a' /* Upload Note */,
                          ),
                          options: FFButtonOptions(
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            hoverColor: FlutterFlowTheme.of(context).secondary,
                            hoverBorderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            hoverTextColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 30.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
