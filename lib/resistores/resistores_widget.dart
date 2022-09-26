import '../esquematico_resistores/esquematico_resistores_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_screen/home_screen_widget.dart';
import '../log_out/log_out_widget.dart';
import '../quiz_1_resistores/quiz1_resistores_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResistoresWidget extends StatefulWidget {
  const ResistoresWidget({Key? key}) : super(key: key);

  @override
  _ResistoresWidgetState createState() => _ResistoresWidgetState();
}

class _ResistoresWidgetState extends State<ResistoresWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF161616),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/image_2022-09-20_065606759.png',
                                      width: double.infinity,
                                      height: 300,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xB3090F13),
                                              Color(0x00090F13)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 40, 16, 16),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreenWidget(),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .black600,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.87,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF161616),
                                    border: Border.all(
                                      color: Color(0xFF161616),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Resistores',
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          color: Color(0xFF161616),
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Text(
                                                'O que é um resistor?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFFD9D9D9),
                                                        ),
                                              ),
                                              collapsed: Text(
                                                'é o componente mais utilizado e mais barato...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    ' é o componente mais usado e mais barato, não possui polaridade e tem por finalidade oferecer oposição  à  passagem de corrente elétrica (resistência). Sua unidade de medida é Ohm (Ω).',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogOutWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Color(0xFF161616),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/image_2022-09-04_103521836.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7, 120, 0, 0),
                                child: Text(
                                  'Realidade Aumentada',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EsquematicoResistoresWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Color(0xFF161616),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/image_2022-09-04_103921327.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7, 120, 0, 0),
                                child: Text(
                                  'Esquemático',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quiz1ResistoresWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: 325,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFF161616),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/image_2022-09-04_104504041.png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(7, 120, 5, 0),
                            child: Text(
                              'Quiz',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
