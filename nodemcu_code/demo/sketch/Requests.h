//Dados de rotas
String URL = "https://arduckapi.otaviozordan.repl.co";
String SEND_DATA_route = URL+"/tensao"; //Rota para envio de dados de tensao
String STATE_route = URL+"/state"; //Rota para recebimento de dados de estado
String GET_ELEMENT_route = URL+"/circuito"; //Rota para recebimento de dados de estado

//Cliente HTTP e WiFi
const char* fingerpr = "04 02 35 B9 C0 0E E5 F2 AE 94 93 3C 8D 44 4C 5B C8 E7 61 69";
            
WiFiClientSecure client;
//client.connect(URL, 80);
HTTPClient http; //Inicia cliente HTTP

//Variaveis de saida
int httpStatus_Global;  //Variavel de status de resposta do servidor
int state_server; //Variavel do numero do circuito
char *elementosList[]; //Array de elementos
int size; //Tamanho do array de elementos

//Constantes de medição
int tensao_referencia = 2419; //Tensão de referência para conversão do valor lido pelo ADC maxima.

//Tensao de saida
int tensao, medida;

void state_test()
{
    Serial.println("Enviando requisição para: " + STATE_route);
    Serial.println("Verificando estado do servidor...");

    client.setFingerprint(fingerpr);
    http.begin(client, STATE_route);                    // Inicia requisição HTTP
    http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho
    int httpCode = http.GET();                          // Envia requisição GET
    httpStatus_Global = httpCode;                       // Salva o status da requisição
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
        Serial.println("Circuito" + String(state_server!=0 ? "  " : " não ") + "está ativo"); // Exibe status do servidor
        Serial.println("");
        delay(1000);
    }
    else
    {
        String payload = http.getString();     // Recebe resposta do servidor
        http.end();                            // Finaliza requisição
        Serial.println(payload);   
        Serial.println("Erro ao enviar requisição");
        Serial.println("");
        state_server = true;
        return;
    }
}

void tensao_send()
{
    Serial.println("");
    Serial.println("Enviando requisição para: " + SEND_DATA_route); // Exibe rota de envio de dados

    // Prepara payload para envio
    medida = analogRead(A0) / 1023.0 * tensao_referencia;
    tensao = map(medida, 0, tensao_referencia, 0, 5);
    String JSON;
    JSON = "{\"tensao\":";
    JSON += tensao;
    JSON += ",\"escala\": ";
    JSON += "\"mV\"}";
    Serial.println(JSON);
    

    client.setFingerprint(fingerpr);
    http.begin(client, SEND_DATA_route);                // Inicia cliente HTTP com o endereço do servidor
    http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho ao cliente HTTP

    int httpCode = http.POST(JSON); // Envia requisição POST com o payload
    httpStatus_Global = httpCode;

    Serial.print("Código de resposta: ");
    Serial.println(httpCode); // Exibe código de resposta do servidor

    if (httpCode == HTTP_CODE_OK) // Se o código de resposta for 200, o servidor respondeu com sucesso
    {
        String payload = http.getString(); // Recebe resposta do servidor
        Serial.println("Requisição enviada com sucesso");
        Serial.println("");
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

void elementos_import(int circuito)
{   
    GET_ELEMENT_route = GET_ELEMENT_route + "/" + String(circuito);
    Serial.println("Enviando requisição para: " + GET_ELEMENT_route);
    Serial.println("Verificando estado do servidor...");

    client.setFingerprint(fingerpr);
    http.begin(client, GET_ELEMENT_route);                    // Inicia requisição HTTP
    http.addHeader("Content-Type", "application/json"); // Adiciona cabeçalho
    int httpCode = http.GET();                          // Envia requisição GET
    httpStatus_Global = httpCode;                       // Salva o status da requisição
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

        for (size = 0; size < obj["elementos"].size(); size++)
        {
            elementosList[size] = (obj["elemento"][size]);          // Atribui valor de status do servidor a variável
        }
    }
    else
    {
        String payload = http.getString();     // Recebe resposta do servidor
        http.end();                            // Finaliza requisição
        Serial.println(payload);   
        Serial.println("Erro ao enviar requisição");
        Serial.println("");
        state_server = true;
        return;
    }
}