/**
   Scketch.ino - ESP8266 Sketch
   Author: Otávio Zordan < Github: @otaviozordan > < Linkedin: https://www.linkedin.com/in/otavio-zordan/ > < Instagram: @otaviozordan >
   Date: 2022-07-28
   Description:
        This sketch is intended to be used by Team 2106 at PROJETE 2022 held at ETE FMC.
        The objective is to create an ESP8266 board working as a multimeter, for this it
        must be connected to an OLED display by the I2C protocol, where important information
        will be displayed to the user. It is also necessary that the ESP hosted a web server
        that when it receives a GET request returns a Json with the necessary data for the proper
        functioning of our application.
 **/
#include "StgsAndLibs.h" //Configurações e Imports
#include "Requests.h"    //Funções de requisições
#include "Imgs.h"        //Imagens

//Constantes de medição
int tensao = 2419; //Tensão de referência para conversão do valor lido pelo ADC maxima.

bool press = false; //Variável para verificar se o botão foi pressionado
int less_press = 0; //Variável para verificar se o botão foi pressionado por menos de 1 segundo

void setup()
{
  pinMode(A0, INPUT);
  
  // Inicia Monitor Serial para Debug
  Serial.begin(115200);

  // Inicia o display
  iniciarOLED();
  draw_telainicial();

  // Botão send para enviar a requisição
  pinMode(botao, INPUT_PULLUP);

  // Led de indicação
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);

  draw_conectando(ssid);
  conectarWiFI();
  OTA_Conection();
  draw_conectado(ssid);
  draw_ip(IP);
}

void loop()
{
  ArduinoOTA.handle();
  if(!digitalRead(botao)){
    draw_verificandoEstado();
    state_test();
    while (state_server == 0) //Espera inicio da missão
    {
      ArduinoOTA.handle();
      draw_statusOff();
      draw_verificandoEstado();
      state_test();
      if (httpStatus_Global != 200) {
        draw_response(state_server, httpStatus_Global);
      }
      if (!digitalRead(botao)) {
        draw_cancelar();
        delay(1000);
        break;
      }
    }
    draw_response(state_server, httpStatus_Global);
    draw_medindoTensao();
    tensao = (analogRead(A0)/1023)*3300;
    tensao_send(tensao);
    draw_tensao(tensao); 
    draw_enviandoDados(httpStatus_Global, tensao);
    elementos_import(state_server);
    draw_elementosMedidos();
  }else{
    draw_espera();
  }
}
