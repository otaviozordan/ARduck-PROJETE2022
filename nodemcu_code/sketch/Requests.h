#include "StgsAndLibs.h"


bool state_server;

void state_test()
{
    Serial.println("Enviando requisição para: " + STATE_route);
    Serial.println("Verificando estado do servidor...");

    http.begin(client, STATE_route);                    // Inicia requisição HTTP
    http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho
    int httpCode = http.GET();                          // Envia requisição GET
    Serial.print("Status: ");                           // Exibe código de resposta
    Serial.println(httpCode);                           // Exibe código de resposta
    Serial.println("");                                 // Pula linha

    if (httpCode == HTTP_CODE_OK)
    {
        String payload = http.getString();     // Recebe resposta do servidor
        http.end();                            // Finaliza requisição
        Serial.println(payload);               // Exibe resposta do servidor
        deserializeJson(doc, payload);         // Deserializa JSON
        JsonObject obj = doc.as<JsonObject>(); // Converte JSON para objeto
        state_server = obj["status"];          // Atribui valor de status do servidor a variável
        Serial.println("Request realizada com sucesso: " + String(state_server));
        Serial.println("Servidor" + String(state_server ? "  " : " não ") + "está ativo"); // Exibe status do servidor
        Serial.println("");
        delay(1000);
    }
    else
    {
        http.end();
        Serial.println("Erro ao enviar requisição");
        Serial.println("");
        state_server = false;
        return;
    }
}

void tensao_send()
{
    Serial.println("");
    Serial.println("Enviando requisição para: " + SEND_DATA_route); // Exibe rota de envio de dados

    // Prepara payload para envio
    int tensao;
    tensao = analogRead(A0) / 1023.0 * tensao_referencia;
    String JSON;
    JSON = "{\"tensao\": ";
    JSON += tensao + ",";
    JSON += "\"escala\": ";
    JSON += "\"mV\"}";
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
        Serial.println("Resposta do servidor: ");
        Serial.println(payload);                                // Exibe resposta do servidor
        Serial.println("*----------------------------------*"); // Pula linha
        Serial.println("");
        http.end(); // Encerra requisição HTTP
    }
    else
    {
        http.end();
        Serial.println("Erro ao enviar requisição");
        Serial.println("");
        return;
    }
}