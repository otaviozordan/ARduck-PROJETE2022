import '../acenda_um_led/acenda_um_led_widget.dart';
import '../acerto_quiz1_led/acerto_quiz1_led_widget.dart';
import '../erro_quiz_1led/erro_quiz1led_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz1LedWidget extends StatefulWidget {
  const Quiz1LedWidget({Key? key}) : super(key: key);

  @override
  _Quiz1LedWidgetState createState() => _Quiz1LedWidgetState();
}

class _Quiz1LedWidgetState extends State<Quiz1LedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF161616),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AcendaUmLedWidget(),
              ),
            );
          },
        ),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
          child: Container(
            width: 140,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF161616),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              child: Text(
                'Perguntas',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
              ),
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF161616),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Container(
                          width: 325,
                          height: 325,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).textColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(3),
                                      bottomRight: Radius.circular(3),
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      'assets/images/image_2022-09-20_133825621.png',
                                      width: 325,
                                      height: 250,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Qual dos dois circuitos estão certos?',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 20,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 0),
                        child: Text(
                          'Questão',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Text(
                          'Level 1',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 375,
                              height: 400,
                              decoration: BoxDecoration(
                                color: Color(0xFF161616),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.1, -0.09),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 15, 55),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ErroQuiz1ledWidget(),
                                                ),
                                              );
                                            },
                                            text: 'Esquerda',
                                            options: FFButtonOptions(
                                              width: 330,
                                              height: 70,
                                              color: Color(0xFF08BD08),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 24,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.1, -0.78),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 15, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ErroQuiz1ledWidget(),
                                                ),
                                              );
                                            },
                                            text: 'Direita',
                                            options: FFButtonOptions(
                                              width: 330,
                                              height: 70,
                                              color: Color(0xFF4361EE),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 24,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.1, -0.78),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 200, 15, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AcertoQuiz1LedWidget(),
                                                ),
                                              );
                                            },
                                            text: 'Ambos',
                                            options: FFButtonOptions(
                                              width: 330,
                                              height: 70,
                                              color: Color(0xFFFFD300),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 24,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
