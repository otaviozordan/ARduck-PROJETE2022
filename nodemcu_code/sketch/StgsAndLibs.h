//Biblioteca para utilização do ESP8266
#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>

//Dados do WiFi
const char* ssid = "TP-Link_52EB";
const char* password = "15712981";

//Cliente HTTP e WiFi
WiFiClient client; //Cria um cliente para conexão com o servidor
HTTPClient http; //Inicia cliente HTTP

//Biblioteca para trabalho com JSON
#include <ArduinoJson.h>
DynamicJsonDocument doc(1024); //Cria um buffer para armazenar o JSON

//Botão Send
const int botao = 14; //D5

//Led para indicar que o ESP recebeu uma requisição
const int led = BUILTIN_LED; //D4

void conectarWiFI(){
  //Conecta com o WiFi
  Serial.print("Conectando a ");
  Serial.print(ssid);
  Serial.println("");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password); //Conecta com o SSID e senha definidos anteriormente
  while (WiFi.status() != WL_CONNECTED) { //Espera conexão com o WiFi
    digitalWrite(led, HIGH);
    delay(250);
    digitalWrite(led, LOW);
    delay(250);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connectado a ");
  Serial.println(ssid); 
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP()); //Exibe IP do ESP8266
  Serial.println("");
}

//Comunicação OTA
#include <ESP8266mDNS.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>

void OTA_Conection(){
    ArduinoOTA.setHostname("ARduck-ESP8266");
    ArduinoOTA.onStart([]() {
    String type;
    if (ArduinoOTA.getCommand() == U_FLASH) {
      type = "sketch";
    } else { // U_FS
      type = "filesystem";
    }

    // NOTE: if updating FS this would be the place to unmount FS using FS.end()
    Serial.println("Start updating " + type);
  });
  ArduinoOTA.onEnd([]() {
    Serial.println("\nEnd");
  });
  ArduinoOTA.onProgress([](unsigned int progress, unsigned int total) {
    Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
  });
  ArduinoOTA.onError([](ota_error_t error) {
    Serial.printf("Error[%u]: ", error);
    if (error == OTA_AUTH_ERROR) {
      Serial.println("Auth Failed");
    } else if (error == OTA_BEGIN_ERROR) {
      Serial.println("Begin Failed");
    } else if (error == OTA_CONNECT_ERROR) {
      Serial.println("Connect Failed");
    } else if (error == OTA_RECEIVE_ERROR) {
      Serial.println("Receive Failed");
    } else if (error == OTA_END_ERROR) {
      Serial.println("End Failed");
    }
  });
  ArduinoOTA.begin();
}
