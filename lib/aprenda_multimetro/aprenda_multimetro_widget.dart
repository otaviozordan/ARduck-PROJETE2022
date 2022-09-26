import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../resistores/resistores_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AprendaMultimetroWidget extends StatefulWidget {
  const AprendaMultimetroWidget({Key? key}) : super(key: key);

  @override
  _AprendaMultimetroWidgetState createState() =>
      _AprendaMultimetroWidgetState();
}

class _AprendaMultimetroWidgetState extends State<AprendaMultimetroWidget> {
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
                            'assets/images/technician-using-multimeter-measure-voltage-broken-computer-young-man-checking-computer-connections-repair-shop.jpg',
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
                      'Multímetro',
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
                                'Um pouquinho de introdução...',
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
                                  'Um engenheiro britânico dos correios, Donald Macadie, em 19...',
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
                                    'Um engenheiro britânico dos correios, Donald Macadie, em 1920, é considerado o inventor do primeiro multímetro. A história diz que ele estava frustrado por precisar carregar um monte de ferramentas diferentes ao trabalhar em linhas de telecomunicações, e então criou uma ferramenta que podia medir amperes, volts e ohms.\n \nUm multímetro é uma ferramenta de medição absolutamente necessária em eletrônica. Ele combina três características essenciais: um voltímetro, ohímetro e amperímetro e, em alguns casos, continuidade.',
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
                                'Composição do instrumento',
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
                                  'Um multímetro é composto por quatro seções essenciais:',
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
                                    'Um multímetro é composto por quatro seções essenciais:\n\n. Display: é aqui que as medições são exibidas\n. Botão de seleção: seleciona o que você deseja medir\n. Bornes de conexão: é aqui que você conecta as ponteiras\n. Pontas de Prova: um multímetro vem com duas pontas de prova. Geralmente uma é vermelha e o outro é preta.',
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
                                'Funcionalidades',
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
                                  'O borne de conexão “COM” é onde a sonda preta...',
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
                                    'O borne de conexão “COM” é onde a sonda preta deve ser conectada. A sonda COM é convencionalmente preta.\n10A é usado ao medir grandes correntes, maiores que 200mA\nµAmA é usado para medir a corrente\nVΩ permite medir tensão e resistência e testar a continuidade\n \nOBS: Esses bornes de conexão podem variar dependendo do multímetro que você está usando.',
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
                                'Funcionalidades',
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
                                  'O borne de conexão “COM” é onde a sonda preta...',
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
                                    'O borne de conexão “COM” é onde a sonda preta deve ser conectada. A sonda COM é convencionalmente preta.\n10A é usado ao medir grandes correntes, maiores que 200mA\nµAmA é usado para medir a corrente\nVΩ permite medir tensão e resistência e testar a continuidade\n \nOBS: Esses bornes de conexão podem variar dependendo do multímetro que você está usando.',
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
