import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'analytics_model.dart';
export 'analytics_model.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({super.key});

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget>
    with TickerProviderStateMixin {
  late AnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: const Offset(-19.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList1 = [
      const Color(0xFF6B0A0A),
      const Color(0xFF9B262B),
      const Color(0xFFDF4F54)
    ];
    final chartPieChartColorsList2 = [const Color(0xFF6B0A0A), const Color(0xFF9B262B)];
    final chartPieChartColorsList5 = [
      const Color(0xFF6B0A0A),
      const Color(0xFF9B262B),
      const Color(0xFFDF4F54)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFFF3DE),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 75.0,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/teknotes_square.png',
                                        width: 73.0,
                                        height: 62.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderRadius: 0.0,
                                        borderWidth: 0.0,
                                        buttonSize: 74.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.userCog,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 40.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('UserManagement');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 0.0,
                                      buttonSize: 74.0,
                                      icon: Icon(
                                        Icons.analytics,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 50.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 0.0,
                                      borderWidth: 0.0,
                                      buttonSize: 74.0,
                                      icon: Icon(
                                        Icons.feedback,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('Feedback');
                                      },
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 0.0,
                                    borderWidth: 1.0,
                                    buttonSize: 74.0,
                                    hoverColor: const Color(0xFF630F12),
                                    hoverIconColor: const Color(0xFFFFF3DE),
                                    icon: const Icon(
                                      Icons.logout_rounded,
                                      color: Color(0xFF630F12),
                                      size: 50.0,
                                    ),
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context)
                                          .clearRedirectLocation();

                                      context.pushNamedAuth(
                                        'SignIn',
                                        context.mounted,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 90,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 40.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'wmpajtzb' /* Engagement and Notes Analytics */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'pa7k4zp4' /* Engagement Analytics */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 100,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 20.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 512.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bvw5fwrn' /* Student Program Distribution */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<AnalyticsRecord>>(
                                                      stream:
                                                          queryAnalyticsRecord(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: Color(
                                                                    0xFF630F12),
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AnalyticsRecord>
                                                            chartAnalyticsRecordList =
                                                            snapshot.data!;
                                                        return SizedBox(
                                                          width: 426.0,
                                                          height: 431.0,
                                                          child: Stack(
                                                            children: [
                                                              FlutterFlowPieChart(
                                                                data:
                                                                    FFPieChartData(
                                                                  values: chartAnalyticsRecordList
                                                                      .map((d) =>
                                                                          d.courseCount)
                                                                      .toList(),
                                                                  colors:
                                                                      chartPieChartColorsList1,
                                                                  radius: [
                                                                    100.0
                                                                  ],
                                                                ),
                                                                donutHoleRadius:
                                                                    100.0,
                                                                donutHoleColor:
                                                                    Colors
                                                                        .transparent,
                                                                sectionLabelType:
                                                                    PieChartSectionLabelType
                                                                        .percent,
                                                                sectionLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    FlutterFlowChartLegendWidget(
                                                                  entries: chartAnalyticsRecordList
                                                                      .map((d) => d.course)
                                                                      .toList()
                                                                      .asMap()
                                                                      .entries
                                                                      .map(
                                                                        (label) =>
                                                                            LegendEntry(
                                                                          chartPieChartColorsList1[label.key %
                                                                              chartPieChartColorsList1.length],
                                                                          label
                                                                              .value,
                                                                        ),
                                                                      )
                                                                      .toList(),
                                                                  width: 100.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
                                                                  textPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          40.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  indicatorSize:
                                                                      10.0,
                                                                  indicatorBorderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 100,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 512.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jygwall2' /* Student to Instructor Ratio */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<
                                                            UserAnalyticsRecord>>(
                                                      future:
                                                          queryUserAnalyticsRecordOnce(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: Color(
                                                                    0xFF630F12),
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserAnalyticsRecord>
                                                            chartUserAnalyticsRecordList =
                                                            snapshot.data!;
                                                        return SizedBox(
                                                          width: 426.0,
                                                          height: 431.0,
                                                          child: Stack(
                                                            children: [
                                                              FlutterFlowPieChart(
                                                                data:
                                                                    FFPieChartData(
                                                                  values: chartUserAnalyticsRecordList
                                                                      .map((d) =>
                                                                          d.count)
                                                                      .toList(),
                                                                  colors:
                                                                      chartPieChartColorsList2,
                                                                  radius: [
                                                                    100.0
                                                                  ],
                                                                ),
                                                                donutHoleRadius:
                                                                    100.0,
                                                                sectionLabelType:
                                                                    PieChartSectionLabelType
                                                                        .value,
                                                                sectionLabelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                labelFormatter:
                                                                    LabelFormatter(
                                                                  numberFormat:
                                                                      (val) =>
                                                                          formatNumber(
                                                                    val,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .periodDecimal,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    FlutterFlowChartLegendWidget(
                                                                  entries: chartUserAnalyticsRecordList
                                                                      .map((d) => d.accType)
                                                                      .toList()
                                                                      .asMap()
                                                                      .entries
                                                                      .map(
                                                                        (label) =>
                                                                            LegendEntry(
                                                                          chartPieChartColorsList2[label.key %
                                                                              chartPieChartColorsList2.length],
                                                                          label
                                                                              .value,
                                                                        ),
                                                                      )
                                                                      .toList(),
                                                                  width: 100.0,
                                                                  height: 50.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                      ),
                                                                  textPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          40.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  indicatorSize:
                                                                      10.0,
                                                                  indicatorBorderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 100,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 30.0, 20.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 600.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xthi3fz2' /* Number of Logins */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<LoginAnalyticsRecord>>(
                                                  stream:
                                                      queryLoginAnalyticsRecord(
                                                    queryBuilder:
                                                        (loginAnalyticsRecord) =>
                                                            loginAnalyticsRecord
                                                                .orderBy(
                                                                    'week_logged'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return const Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitChasingDots(
                                                            color: Color(
                                                                0xFF630F12),
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LoginAnalyticsRecord>
                                                        chartLoginAnalyticsRecordList =
                                                        snapshot.data!;
                                                    return SizedBox(
                                                      width: 1072.0,
                                                      height: 230.0,
                                                      child:
                                                          FlutterFlowLineChart(
                                                        data: [
                                                          FFLineChartData(
                                                            xData: chartLoginAnalyticsRecordList
                                                                .map((d) => d
                                                                    .weekLogged)
                                                                .toList(),
                                                            yData: chartLoginAnalyticsRecordList
                                                                .map((d) =>
                                                                    d.weekCount)
                                                                .toList(),
                                                            settings:
                                                                LineChartBarData(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              barWidth: 2.0,
                                                              isCurved: true,
                                                              preventCurveOverShooting:
                                                                  true,
                                                              dotData: FlDotData(
                                                                  show: false),
                                                            ),
                                                          )
                                                        ],
                                                        chartStylingInfo:
                                                            ChartStylingInfo(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                          showGrid: true,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderWidth: 1.0,
                                                        ),
                                                        axisBounds:
                                                            const AxisBounds(),
                                                        xAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'v95hffjr' /* Weeks */,
                                                          ),
                                                          titleTextStyle:
                                                              GoogleFonts
                                                                  .getFont(
                                                            'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              GoogleFonts
                                                                  .getFont(
                                                            'Montserrat',
                                                          ),
                                                          labelInterval: 10.0,
                                                          labelFormatter:
                                                              LabelFormatter(
                                                            numberFormat:
                                                                (val) =>
                                                                    formatNumber(
                                                              val,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                            ),
                                                          ),
                                                        ),
                                                        yAxisLabelInfo:
                                                            AxisLabelInfo(
                                                          title: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'rvahb01e' /* Number of Logins */,
                                                          ),
                                                          titleTextStyle:
                                                              const TextStyle(
                                                            fontSize: 14.0,
                                                          ),
                                                          showLabels: true,
                                                          labelTextStyle:
                                                              GoogleFonts
                                                                  .getFont(
                                                            'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          labelInterval: 10.0,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 100,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 30.0, 20.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 600.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm1o9y3w2' /* Total App Engagement */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: StreamBuilder<
                                            List<EngagementRecord>>(
                                          stream: queryEngagementRecord(
                                            queryBuilder: (engagementRecord) =>
                                                engagementRecord
                                                    .orderBy('month'),
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
                                            List<EngagementRecord>
                                                chartEngagementRecordList =
                                                snapshot.data!;
                                            return SizedBox(
                                              width: 1072.0,
                                              height: 230.0,
                                              child: FlutterFlowLineChart(
                                                data: [
                                                  FFLineChartData(
                                                    xData:
                                                        chartEngagementRecordList
                                                            .map((d) => d.month)
                                                            .toList(),
                                                    yData:
                                                        chartEngagementRecordList
                                                            .map((d) =>
                                                                d.retentionRate)
                                                            .toList(),
                                                    settings: LineChartBarData(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      barWidth: 2.0,
                                                      isCurved: true,
                                                      preventCurveOverShooting:
                                                          true,
                                                      dotData: FlDotData(
                                                          show: false),
                                                    ),
                                                  )
                                                ],
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  showGrid: true,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                ),
                                                axisBounds: const AxisBounds(),
                                                xAxisLabelInfo: AxisLabelInfo(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'i8hlph1s' /* Month */,
                                                  ),
                                                  titleTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.0,
                                                  ),
                                                  showLabels: true,
                                                  labelTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                  ),
                                                  labelInterval: 10.0,
                                                  labelFormatter:
                                                      LabelFormatter(
                                                    numberFormat: (val) =>
                                                        formatNumber(
                                                      val,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                    ),
                                                  ),
                                                ),
                                                yAxisLabelInfo: AxisLabelInfo(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'q8r1hi3d' /* Retention Rate */,
                                                  ),
                                                  titleTextStyle: const TextStyle(
                                                    fontSize: 14.0,
                                                  ),
                                                  showLabels: true,
                                                  labelTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  labelInterval: 30.0,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '889rauj0' /* Notes Analytics */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 100,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 512.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lvrumyco' /* Subject Notes Distribution */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: StreamBuilder<
                                                List<NotesAnalyticsRecord>>(
                                              stream:
                                                  queryNotesAnalyticsRecord(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitChasingDots(
                                                        color:
                                                            Color(0xFF630F12),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<NotesAnalyticsRecord>
                                                    chartNotesAnalyticsRecordList =
                                                    snapshot.data!;
                                                return SizedBox(
                                                  width: 426.0,
                                                  height: 431.0,
                                                  child: Stack(
                                                    children: [
                                                      FlutterFlowPieChart(
                                                        data: FFPieChartData(
                                                          values:
                                                              chartNotesAnalyticsRecordList
                                                                  .map((d) => d
                                                                      .uploadCount)
                                                                  .toList(),
                                                          colors:
                                                              chartPieChartColorsList5,
                                                          radius: [100.0],
                                                        ),
                                                        donutHoleRadius: 100.0,
                                                        donutHoleColor:
                                                            Colors.transparent,
                                                        sectionLabelType:
                                                            PieChartSectionLabelType
                                                                .percent,
                                                        sectionLabelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 1.0),
                                                        child:
                                                            FlutterFlowChartLegendWidget(
                                                          entries:
                                                              chartNotesAnalyticsRecordList
                                                                  .map((d) => d
                                                                      .notesCourse)
                                                                  .toList()
                                                                  .asMap()
                                                                  .entries
                                                                  .map(
                                                                    (label) =>
                                                                        LegendEntry(
                                                                      chartPieChartColorsList5[label
                                                                              .key %
                                                                          chartPieChartColorsList5
                                                                              .length],
                                                                      label
                                                                          .value,
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                          width: 100.0,
                                                          height: 50.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                  ),
                                                          textPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      40.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          borderWidth: 1.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          indicatorSize: 10.0,
                                                          indicatorBorderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 100,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 30.0, 20.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  height: 600.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gm7vkzdq' /* Uploads per Month */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: StreamBuilder<
                                            List<NotesMonthlyRecord>>(
                                          stream: queryNotesMonthlyRecord(
                                            queryBuilder:
                                                (notesMonthlyRecord) =>
                                                    notesMonthlyRecord
                                                        .orderBy('month'),
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
                                            List<NotesMonthlyRecord>
                                                chartNotesMonthlyRecordList =
                                                snapshot.data!;
                                            return SizedBox(
                                              width: 1072.0,
                                              height: 230.0,
                                              child: FlutterFlowLineChart(
                                                data: [
                                                  FFLineChartData(
                                                    xData:
                                                        chartNotesMonthlyRecordList
                                                            .map((d) => d.month)
                                                            .toList(),
                                                    yData:
                                                        chartNotesMonthlyRecordList
                                                            .map((d) =>
                                                                d.uploadCount)
                                                            .toList(),
                                                    settings: LineChartBarData(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      barWidth: 2.0,
                                                      isCurved: true,
                                                      preventCurveOverShooting:
                                                          true,
                                                      dotData: FlDotData(
                                                          show: false),
                                                    ),
                                                  )
                                                ],
                                                chartStylingInfo:
                                                    ChartStylingInfo(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary,
                                                  showGrid: true,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderWidth: 1.0,
                                                ),
                                                axisBounds: const AxisBounds(),
                                                xAxisLabelInfo: AxisLabelInfo(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '85kwhcdu' /* Month */,
                                                  ),
                                                  titleTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.0,
                                                  ),
                                                  showLabels: true,
                                                  labelTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                  ),
                                                  labelInterval: 10.0,
                                                  labelFormatter:
                                                      LabelFormatter(
                                                    numberFormat: (val) =>
                                                        formatNumber(
                                                      val,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                    ),
                                                  ),
                                                ),
                                                yAxisLabelInfo: AxisLabelInfo(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ylwlli1v' /* Number of Uploads */,
                                                  ),
                                                  titleTextStyle: const TextStyle(
                                                    fontSize: 14.0,
                                                  ),
                                                  showLabels: true,
                                                  labelTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  labelInterval: 10.0,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
