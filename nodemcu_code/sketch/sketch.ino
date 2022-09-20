/**
 * Scketch.ino - ESP8266 Sketch
 * Author: Otávio Zordan < Github: @otaviozordan > < Linkedin: https://www.linkedin.com/in/otavio-zordan/ >
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

//Bibliotecas para utilização do Display OLED
// Inicia o display OLED
// D3 (GPIO ...) -> SDA
// D5 (GPIO ...) -> SCL
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

//Biblioteca para utilização do ESP8266
#include <ESP8266HTTPClient.h>
#include <ESP8266WiFi.h>

//Dados do WiFi
const char* ssid = "ETE-ALUNOS";
const char* password = "etefmc890";

//Dados do servidor
#define SERVER "http://10.10.2.12:5000/tensao"

//Botão Send
const int botao = 2;
//Led para indicar que o ESP recebeu uma requisição
const int led = 2;

void setup() {
  //Botão send para enviar a requisição
  pinMode(botao, INPUT_PULLUP);

  //Led de indicação
  pinMode(led, OUTPUT);
  digitalWrite(led, 0);
  
  //Inicia Monitor Serial para Debug
  Serial.begin(115200);

  //Inicializa display OLED
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { 
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); 
  }
  display.display();

  //Conecta com o WiFi
  Serial.print("Conectando a ");
  Serial.print(ssid);
  Serial.println("");
  WiFi.begin(ssid, password); //Conecta com o SSID e senha definidos anteriormente
  while (WiFi.status() != WL_CONNECTED) { //Espera conexão com o WiFi
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("Connectado"); 
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP()); //Exibe IP do ESP8266
}

void loop() {

  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.println("Sem conexão com a internet");
    delay(500);
  }

  if (/*digitalRead(botao)*/true) //Teste
  {
    Serial.println("Enviando requisição...");

    HTTPClient http; //Inicia cliente HTTP
    WiFiClient client;
    http.begin(client, SERVER); //Inicia cliente HTTP com o endereço do servidor
    http.addHeader("Content-Type", "application/json"); //Adiciona cabeçalho ao cliente HTTP

    //Prepara payload para envio
    float tensao;
    tensao = analogRead(A0)/1023.0*5.0;
    String JSON;
    JSON = "{\"tensao\": ";
    JSON += tensao;
    JSON += "}";
    Serial.println(JSON);

    int httpCode = http.POST(JSON); //Envia requisição POST com o payload

    Serial.print("Código de resposta: ");
    Serial.println(httpCode); //Exibe código de resposta do servidor

    if(httpCode == HTTP_CODE_OK) //Se o código de resposta for 200, o servidor respondeu com sucesso
    {
      String payload = http.getString(); //Recebe resposta do servidor
      Serial.println("Requisição enviada com sucesso");
      Serial.println(payload); //Exibe resposta do servidor
      Serial.println("");//Pula linha
      
      digitalWrite(led, 0);
    }
    else
    {
      Serial.println("Erro ao enviar requisição");
      digitalWrite(led, 0);
      delay(500);
      digitalWrite(led, 1);
    }
    http.end();
  }
  delay(500);
}
