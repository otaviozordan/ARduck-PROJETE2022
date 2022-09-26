import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../quiz_2_resistores/quiz2_resistores_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AcertoQuiz2Widget extends StatefulWidget {
  const AcertoQuiz2Widget({Key? key}) : super(key: key);

  @override
  _AcertoQuiz2WidgetState createState() => _AcertoQuiz2WidgetState();
}

class _AcertoQuiz2WidgetState extends State<AcertoQuiz2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Navigator.pop(context);
    });
  }

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
                        builder: (context) => Quiz2ResistoresWidget(),
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
