//Pinos do NodeMCU
// SDA (AZUL) => D1 (GPIO5)
// SCL (VERDE) => D2 (GPIO4)

//Bibliotecas para uso do OLED
#include <Wire.h>
#include "SSD1306Wire.h"

//Criação do objeto para o display OLED
SSD1306Wire  display(0x3c, 5, 4);

void iniciarOLED(){
  display.init();
  display.flipScreenVertically();
}

void draw_telainicial()
{
  //Apaga o display
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  //Seleciona a fonte
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "Projete 2022");
  display.drawString(63, 26, "ARduck");
  display.drawString(63, 45, "Iniciando...");
  display.display();
  delay(3000);
}

void draw_conectando(String ssid_stg)
{
  //Mostra que o ESP está conectando ao WiFi
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  //Seleciona a fonte
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "Conectando");
  display.drawString(63, 26, "a rede:");
  display.setFont(ArialMT_Plain_10);
  display.drawString(63, 45, ssid_stg);
  display.display();
  delay(500);
}

void draw_conectado(String ssid_stg){
  //Mostra que o ESP está conectado ao WiFi
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  //Seleciona a fonte
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 16, "Conectado");
  display.setFont(ArialMT_Plain_10);
  display.drawString(63, 45, ssid_stg);
  display.display();
  delay(3000);
  display.clear();
}

void draw_ip(String ip_stg){
 display.clear();
 display.setTextAlignment(TEXT_ALIGN_CENTER);
 display.setFont(ArialMT_Plain_16);
 display.drawString(63, 7, "ARduck");
 display.drawString(63, 26, "Endereço IP:");
 display.drawString(63, 45, ip_stg);
 display.display();
 delay(3000);
}

void draw_espera(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Inicie o desafio e");
  display.setFont(ArialMT_Plain_10);
  display.drawString(63, 45, "aperte o botão para medir");
  display.display();
}

void draw_verificandoEstado(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Aguarde");
  display.setFont(ArialMT_Plain_10);
  display.drawString(63, 45, "Carregando missão");
  display.display();
  delay(1000);
}

void draw_response(int status, int httpCode){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, String(status)== "0" ? "Cicuito não" : "Circuito: " + String(status));
  display.drawString(63, 45,  "Está ativo");
  display.display();
  delay(3000);
  if(httpCode != 200){
    display.clear();
    display.setTextAlignment(TEXT_ALIGN_CENTER);
    display.setFont(ArialMT_Plain_16);
    display.drawString(63, 7, "ARduck");
    display.drawString(63, 26, "Código de erro:");
    display.drawString(63, 45, String(httpCode));
    display.display();
    delay(3000);
  }
}

void draw_medindoTensao(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Medindo tensão");
  display.drawString(63, 45, "do circuito");
  display.display();
  delay(2500);
}

void draw_tensao(int tensao){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Tensão medida:");
  String tensao_str = String(tensao) + "mV";
  display.drawString(63, 45, tensao_str);
  display.display();
  delay(5000);
}

void draw_enviandoDados(int httpcode){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Enviando dados");
  display.drawString(63, 45, "ao app");
  display.display();
  delay(2000);
  display.clear();

  if (httpcode == 200){
    display.setTextAlignment(TEXT_ALIGN_CENTER);
    display.setFont(ArialMT_Plain_16);
    display.drawString(63, 7, "Dados enviados");
    display.drawString(63, 26, "com sucesso");
    display.drawString(63, 45, String(tensao) + "mV");
    display.display();
    delay(3000);
    display.clear();
  }
  else{
    display.setTextAlignment(TEXT_ALIGN_CENTER);
    display.setFont(ArialMT_Plain_16);
    display.drawString(63, 7, "ARduck");
    display.drawString(63, 26, "Erro ao enviar");
    display.drawString(63, 45, "dados ao servidor");
    display.display();
    delay(3000);
    display.clear();
    display.drawString(63, 7, "ARduck");
    display.drawString(63, 26, "Código de erro:");
    display.drawString(63, 45, String(httpcode));
    display.display();
    delay(3000);
    display.clear();
  }
}

void draw_cancelar(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Cancelando");
  display.drawString(63, 45, "Busca");
  display.display();
  delay(1000);
}

void draw_OTA(int progresso, int total){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Atualizando firmware");
  display.drawString(63, 45, String((progresso / (total / 100))));
  display.display();
}

void draw_statusOff(){
  Serial.println("Servidor indisponível");
  Serial.println("Inicializando modo de espera, inicialize modo de medicao para continuar");
  Serial.println("");
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Missão não");
  display.drawString(63, 45, "Selecionada");
  display.display();
  delay(3000);
}

void draw_elementosMedidos(){
  for (int i = 0; i < size; i++)
  {
    display.clear();
    display.drawString(63, 7, "ARduck");
    display.drawString(63, 26, "Medido:");
    display.drawString(63, 45, String(elementosList[i]));
    display.display();
    delay(3000);
  }
}

void draw_calibracao(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Calibrando");
  display.drawString(63, 45, "Sensores");
  display.display();
  delay(3000);
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Conecte Prob");
  display.drawString(63, 45, "Ao 5V");
  display.display();
  delay(3000);
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 26, "Precione botão");
  display.drawString(63, 45, "Resetar referencia");
  display.display();
}

void draw_calibrado(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "ARduck");
  display.drawString(63, 26, "Adotado");
  display.drawString(63, 45, String(tensao_referencia)+"mV");
  display.display();
  delay(3000);
}

void draw_tensaoTempoReal(){
  display.clear();
  display.setTextAlignment(TEXT_ALIGN_CENTER);
  display.setFont(ArialMT_Plain_16);
  display.drawString(63, 7, "Tensão em");
  display.drawString(63, 26, "Tempo real");
  display.drawString(63, 45, String(tensao)+"mV");
  display.display();
}
