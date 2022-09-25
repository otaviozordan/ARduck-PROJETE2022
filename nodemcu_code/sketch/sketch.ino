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

#include "StgsAndLibs.h"

bool state_server;

void setup()
{
  // Botão send para enviar a requisição
  pinMode(botao, INPUT_PULLUP);

  // Led de indicação
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);

  // Inicia Monitor Serial para Debug
  Serial.begin(115200);

  inicializarOLED();
  conectarWiFI();
}

void loop()
{    
  if (/*digitalRead(botao)*/ true) // Teste
  {
    Serial.println("Enviando requisição para: " + STATE_route);
    Serial.println("Verificando estado do servidor...");

    http.begin(client, STATE_route);                // Inicia requisição HTTP
    http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho
    int httpCode = http.GET();                          // Envia requisição GET
    Serial.print("Status: ");                           // Exibe código de resposta
    Serial.println(httpCode);                           // Exibe código de resposta
    Serial.println("");

    if (httpCode > 0)
    {
      String payload = http.getString(); // Recebe resposta do servidor
      http.end();                        // Finaliza requisição
      Serial.println(payload);           // Exibe resposta do servidor
      deserializeJson(doc, payload);
      JsonObject obj = doc.as<JsonObject>();
      state_server = obj["status"];
      Serial.println("Request realizada com sucesso: " + String(state_server));
      Serial.println("Servidor" + String(state_server ? "  " : " não ") + "está ativo");
      Serial.println("");
      delay(1000);
    }
    else
    {
      Serial.print("Erro na requisição");
      Serial.println("");
      http.end();
      delay(1000);
      state_server = false;
      return;
    }

    if (state_server)
    {
      Serial.println("Enviando requisição para: " + SEND_DATA_route);

      // Prepara payload para envio
      int tensao;
      tensao = analogRead(A0) / 1023.0 * 5.0;
      String JSON;
      JSON = "{\"tensao\": ";
      JSON += tensao;
      JSON += "}";
      Serial.println(JSON);

      http.begin(client, SEND_DATA_route);                // Inicia cliente HTTP com o endereço do servidor
      http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho ao cliente HTTP

      int httpCode = http.POST(JSON); // Envia requisição POST com o payload

      Serial.print("Código de resposta: ");
      Serial.println(httpCode); // Exibe código de resposta do servidor

      if (httpCode == HTTP_CODE_OK) // Se o código de resposta for 200, o servidor respondeu com sucesso
      {
        String payload = http.getString(); // Recebe resposta do servidor
        Serial.println("Requisição enviada com sucesso");
        Serial.println("##################");
        Serial.println(payload);              // Exibe resposta do servidor
        Serial.println("##################"); // Pula linha
        Serial.println("");
        http.end(); // Encerra requisição HTTP
        delay(1000);
      }
      else
      {
        http.end();
        Serial.println("Erro ao enviar requisição");
        Serial.println("");
        delay(1000);
      }
    }
    else
    {
      Serial.println("Servidor indisponível");
      Serial.println("");
    }
  }
}
