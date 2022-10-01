/**
 * Scketch.ino - ESP8266 Sketch
 * Author: Otávio Zordan < Github: @otaviozordan > < Linkedin: https://www.linkedin.com/in/otavio-zordan/ > < Instagram: @otaviozordan >
 * License: MIT
 * Date: 2022-07-28
 * Description:
 *      This sketch is intended to be used by Team 2106 at PROJETE 2022 held at ETE FMC.
 *      The objective is to create an ESP8266 board working as a multimeter, for this it
 *      must be connected to an OLED display by the I2C protocol, where important information
 *      will be displayed to the user. It is also necessary that the ESP hosted a web server
 *      that when it receives a GET request returns a Json with the necessary data for the proper
 *      functioning of our application.
 **/

#include "StgsAndLibs.h" //Configurações e Imports
#include "Requests.h"    //Funções de requisições
#include "Imgs.h"        //Imagens

void setup()
{
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
  if (!digitalRead(botao))
  { 
    draw_verificandoEstado();
      state_test();
    draw_response(state_server, httpStatus_Global);
    if (state_server!=0)
    {
      draw_medindoTensao();
        tensao_send();
      draw_tensao(tensao);
      draw_enviandoDados(httpStatus_Global);
        elementos_import(state_server);
      draw_elementosMedidos();
    }
    else
    {
      Serial.println("Servidor indisponível");
      Serial.println("Inicializando modo de espera, inicialize modo de medicao para continuar");
      Serial.println("");
      draw_statusOff();
      do
      {
        draw_verificandoEstado();
          state_test();
        draw_response(state_server, httpStatus_Global);
        if (state_server!=0)
        {
          return;
        }
        if(!botao){
          draw_cancelar();
          break;
        }
      } while (state_server==0);
    }
  }
  else
  {
    draw_espera();
  }
}
