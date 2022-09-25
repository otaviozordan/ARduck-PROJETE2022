//Bibliotecas para utilização do Display OLED
// Inicia o display OLED
// D3 (GPIO ...) -> SDA
// D5 (GPIO ...) -> SCL
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
const char* ssid = "Teleco";
const char* password = "09876543";

//Dados de rotas
String IP = "http://192.168.210.3";
String SEND_DATA_route = IP+"/tensao"; //Rota para envio de dados de tensao
String STATE_route = IP+"/state"; //Rota para recebimento de dados de estado

//Botão Send
const int botao = 2;
//Led para indicar que o ESP recebeu uma requisição
const int led = 2;

//Cliente HTTP e WiFi
WiFiClient client; //Cria um cliente para conexão com o servidor
HTTPClient http; //Inicia cliente HTTP

//Biblioteca para trabalho com JSON
#include <ArduinoJson.h>
DynamicJsonDocument doc(1024); //Cria um buffer para armazenar o JSON

void conectarWiFI(){
  //Conecta com o WiFi
  Serial.print("Conectando a ");
  Serial.print(ssid);
  Serial.println("");
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password); //Conecta com o SSID e senha definidos anteriormente
  while (WiFi.status() != WL_CONNECTED) { //Espera conexão com o WiFi
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("Connectado"); 
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP()); //Exibe IP do ESP8266
  Serial.println("");
}

void inicializarOLED(){
  //Inicializa display OLED
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { 
    Serial.println("");
    Serial.println(F("SSD1306 allocation failed"));
    Serial.println("");
    for(;;); 
  }
  display.display();
}
