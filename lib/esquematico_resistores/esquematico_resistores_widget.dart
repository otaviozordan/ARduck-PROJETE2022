import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../resistores/resistores_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EsquematicoResistoresWidget extends StatefulWidget {
  const EsquematicoResistoresWidget({Key? key}) : super(key: key);

  @override
  _EsquematicoResistoresWidgetState createState() =>
      _EsquematicoResistoresWidgetState();
}

class _EsquematicoResistoresWidgetState
    extends State<EsquematicoResistoresWidget> {
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
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResistoresWidget(),
              ),
            );
          },
        ),
        title: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFF161616),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 0),
            child: Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFF161616),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Text(
                  'Esquemático',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Color(0xFF161616),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/image_2022-09-20_131043080.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      'Associação de resistores',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                    child: Text(
                      'Level 1',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFD9D9D9),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF161616),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFF161616),
                          child: ExpandableNotifier(
                            initialExpanded: false,
                            child: ExpandablePanel(
                              header: Text(
                                'Leitura do esquemático',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              ),
                              collapsed: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFF161616),
                                ),
                                child: Text(
                                  'Há três resistores associados em série e cada um ...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF57636C),
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Há três resistores associados em série e cada um  com um valor de 1kΩ.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                iconColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF161616),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFF161616),
                          child: ExpandableNotifier(
                            initialExpanded: false,
                            child: ExpandablePanel(
                              header: Text(
                                'Funcionamento do circuito',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              ),
                              collapsed: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFF161616),
                                ),
                                child: Text(
                                  'Como é uma associação em série a corren...',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF57636C),
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Como é uma associação em série a corrente é a mesma pois só há um caminho/malha, a tensão vai se dividir proporcionalmente entre os componentes do circuito, uma vez que todos tem valores iguais.',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                iconColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryText,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Color(0x32000000),
                  offset: Offset(0, -2),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
