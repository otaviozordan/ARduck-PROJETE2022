import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../quiz_3_led/quiz3_led_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ErroQuiz2ledWidget extends StatefulWidget {
  const ErroQuiz2ledWidget({Key? key}) : super(key: key);

  @override
  _ErroQuiz2ledWidgetState createState() => _ErroQuiz2ledWidgetState();
}

class _ErroQuiz2ledWidgetState extends State<ErroQuiz2ledWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF161616),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie_animations/114322-wrong-answer-animation.json',
                      width: 150,
                      height: 130,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Text(
                  'Não foi dessa vez!',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 32,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Continue tentando, o erro faz parte da aprendizagem!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quiz3LedWidget(),
                      ),
                    );
                  },
                  text: 'Próximo',
                  options: FFButtonOptions(
                    width: 130,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
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
