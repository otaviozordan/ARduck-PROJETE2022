import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../quiz_3_led/quiz3_led_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AcertoQuiz2ledWidget extends StatefulWidget {
  const AcertoQuiz2ledWidget({Key? key}) : super(key: key);

  @override
  _AcertoQuiz2ledWidgetState createState() => _AcertoQuiz2ledWidgetState();
}

class _AcertoQuiz2ledWidgetState extends State<AcertoQuiz2ledWidget> {
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    frameRate: FrameRate(60),
                    repeat: false,
                    animate: true,
                  ),
                ],
              ),
              Text(
                'Parabéns!',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 32,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Continue assim!',
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 27),
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
                          color: FlutterFlowTheme.of(context).black600,
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
