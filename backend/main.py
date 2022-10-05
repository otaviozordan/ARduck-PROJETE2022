from flask import Flask, Response, request
from flask_cors import CORS, cross_origin
import json

app = Flask(__name__)
cors = CORS(app)

#declara variavel para tensão medida
global tensao
tensao = 0

#status da medição
global state
state = 0

#tolerancia do circuito de medição (%)
global tolmax
tolmax = 15

def zerar():
  global tensao
  tensao = 0

@app.route("/", methods=["GET"])
def index():
  return  Response(json.dumps({"Hello":"ARduck", "Tente:":"URL + /routes"}), status=200, mimetype="application/json")

@app.route("/routes", methods=["GET"])
def routes():
  response = {}
  response["Inicia leitura de tensao na missão"] = "/start/<id> [GET]"
  response["Visualiza circuito sendo executado"] = "/state [GET]"
  response["Para missão"] = "/stop [GET]"
  response["Indentifica elemento medido no circuito"] = "/circuito/<id> [GET]"
  response["Cadastra novo circuito"] = "/circuito/id [POST]"
  response["Templete de como cadastrar um novo circuito"] = "/templete [GET]"
  response["Cadastrar valor para tensao"] = "/tensao [POST]"
  response["Ler valor de tensao"] = "/tensao [GET]"


  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/start/<id>", methods=["GET"])
def start(id):
  response = {}
  response["status"] = "on"
  response["circuito"] = int(id)
  global state
  state = int(id)

  print("")
  print("Missão circuito ", id, " iniciada")

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/stop", methods=["GET"])
def stop():
  response = {}
  response["status"] = "off"
  global state
  state = 0

  print("")
  print("Missão terminada")

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/state", methods=["GET"])
def state():
  response = {}
  response["status"] = state

  print("")
  print("Medindo circuito", end=" ")
  print(state)

  try:
    return Response(json.dumps(response), status=200, mimetype="application/json")

  except:
    return Response(json.dumps({"status":0}), status=200, mimetype="application/json")

@app.route("/tensao", methods=["POST"])
def cadastrar_tensao():
  recive = request.get_json()

  try:
    global tensao
    tensao = recive["tensao"]

    print("")
    print("Nova tensão cadastrada:", end=" ")
    print(tensao, end="")
    print("[mV]")

    response = {}
    response["Valor cadastrado para tensao"] = tensao

    return Response(json.dumps(response), status=200, mimetype="application/json")
  
  except:
    print('Erro ao enviar')

    response = {}
    response["Mensagem"] = "Erro"

    return Response(json.dumps(response), status=400, mimetype="application/json")

@app.route("/tensao", methods=["GET"])
def ler_tensao():
  response = {}
  response["tensao_str"] = str(tensao) + " mV"
  response["tensao_int"] = tensao

  print("")
  print("Cliente lendo tensão:", end=" ")
  print(tensao, end="")
  print("[mV]")

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/templete", methods=["GET"])
def templete_newCircuito():
  response = open('data/circuitos/templete0.json')
  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/circuito/<id>", methods=["GET"])
def medir_elemento(id):
  response = {}
  listaElementos = []
  global VresistorAnterior 
  global VresistormaxAnterior 
  global VresistorminAnterior

  file = open('data/circuitos/circuito' + id + '.json')
  data = json.load(file)

  for i in data['resistores']:
    print("Testando: ", i["name"])
    Vresistor = (i['tensao'])
    Vresistormax = Vresistor + Vresistor*tolmax/100
    Vresistormin = Vresistor - Vresistor*tolmax/100

    if(Vresistormax > tensao > Vresistormin):
      nameResistor = (i['name'])
      print("Encontrado", end=" ")
      print(nameResistor)
      listaElementos.append(nameResistor)
      print(listaElementos)
      VelementoAnterior = Vresistor
      VelementomaxAnterior = Vresistormax
      VelementominAnterior = Vresistormin

  Vfonte = data["dados do circuito"][1]["value"]
  Vfontemax = Vfonte + Vfonte*tolmax/100
  Vfontemin = Vfonte - Vfonte*tolmax/100  

  if(Vfontemax > tensao > Vfontemin ):
      nameFonte = data["dados do circuito"][1]["name"]
      print("Encontrado", end=" ")
      print(nameFonte)
      listaElementos.append(nameFonte)
      print(listaElementos)
      VelementoAnterior = Vfonte
      VelementomaxAnterior = Vfontemax
      VelementominAnterior = Vfontemin

  if(len(listaElementos) == 0):
    nameResistor = "Não encontrado"
    listaElementos.append(nameResistor)
    VelementoAnterior = "Indefinido"
    VelementomaxAnterior = "Indefinido"
    VelementominAnterior = "Indefinido"

  response["elemento"] = listaElementos
  response["tensao medida"] = tensao
  response["tensao do elemento"] = VelementoAnterior
  response["tensao maxima aceitavel"] = VelementomaxAnterior
  response["tensao minima aceitavel"] = VelementominAnterior

  if (tensao == 0):
    listaElementos=[]
    listaElementos.append("Meca a tensao!")
    response["elemento"] = listaElementos
    print("Medida não realizada")

  print(json.dumps(response))
  return Response(json.dumps(response), status=200, mimetype="application/json"), zerar()

@app.route("/circuito/<id>", methods=["POST"])
def cadastrar_circuito(id):
  Rtotal = 0 #resistencia total do circuito
  Itotal = 0 #corrente total do circuito
  inputCircuito = request.get_json() #recebe o json de input circuito

  with open("data/circuitos/circuito" + id + ".json", "w") as circuitoJsonArquivo: #cria um arquivo json com o nome do circuito
    circuitoJson = {} #cria um dicionario para o json de saida
    circuitoJson["dados do circuito"] = inputCircuito["dados do circuito"] #copia os dados do circuito para o json de saida
    circuitoJson["dados do circuito"][1]["escala"] = "mV" #adiciona o valor da tensao total ao json de saida    
    circuitoJson["resistores"] = inputCircuito["resistores"] #copia os resistores para o json de saida

    circuitoJson["dados do circuito"].append({"name": "Rtotal"}) #adiciona a corrente total ao json de saida

    if(inputCircuito["dados do circuito"][0]["type"] == "Serie"): #se o circuito for em serie
      for i in range(0, len(inputCircuito["resistores"])):
        RtotalIndividual = inputCircuito["resistores"][i]["value"] #pega o valor de cada resistor
        Rtotal = Rtotal + RtotalIndividual #soma as resistencias individuais uma a uma
      circuitoJson["dados do circuito"][2]["value"] = Rtotal #adiciona o valor da resistencia total
      circuitoJson["dados do circuito"][2]["escala"] = "Ohms" #adiciona o valor da tensao total ao json de saida
  
      circuitoJson["dados do circuito"].append({"name": "Itotal"}) #adiciona a corrente total ao json de saida
      Itotal = inputCircuito["dados do circuito"][1]["value"] / Rtotal #calcula a corrente total importando a tensao e a resistencia total calculada
      circuitoJson["dados do circuito"][3]["value"] = Itotal #adiciona o valor da corrente total ao json de saida
      circuitoJson["dados do circuito"][3]["escala"] = "mA" #adiciona o valor da tensao total ao json de saida

      for i in range(0, len(inputCircuito["resistores"])):
        circuitoJson["resistores"][i]["tensao"] = inputCircuito["resistores"][i]["value"] * Itotal #calcula a tensao em cada resistor e adiciona ao json de saida
        circuitoJson["resistores"][i]["corrente"] = Itotal #adiciona a corrente em cada resistor ao json de saida

    if(inputCircuito["dados do circuito"][0]["type"] == "Paralelo"): #se o circuito for em paralelo
      for i in range(0, len(inputCircuito["resistores"])):
        RtotalIndividual = inputCircuito["resistores"][i]["value"]
        Rtotal = Rtotal + (1/RtotalIndividual)
      Rtotal = 1/Rtotal
      circuitoJson["dados do circuito"][2]["value"] = Rtotal
      circuitoJson["dados do circuito"][2]["escala"] = "Ohms" #adiciona o valor da tensao total ao json de saida
  
      for i in range(0, len(inputCircuito["resistores"])):
        circuitoJson["resistores"][i]["tensao"] = inputCircuito["dados do circuito"][1]["value"] #adiciona a tensao em cada resistor ao json de saida
        Itotalindivual = inputCircuito["dados do circuito"][1]["value"] / inputCircuito["resistores"][i]["value"] #calcula a corrente em cada resistor e adiciona ao json de saida
        circuitoJson["resistores"][i]["corrente"] = Itotalindivual #calcula a corrente em cada resistor e adiciona ao json de saida
        Itotal = Itotal + Itotalindivual #soma as correntes individuais uma a uma
      circuitoJson["dados do circuito"].append({"name": "Itotal"})
      circuitoJson["dados do circuito"][3]["value"] = Itotal #adiciona o valor da corrente total ao json de saida
      circuitoJson["dados do circuito"][3]["escala"] = "mA" #adiciona o valor da tensao total ao json de saida

    with open("data/circuitos/circuito5000.json", "w") as circuitoJsonFixo:
      json.dump(circuitoJson, circuitoJsonFixo, indent=4) #escreve o json de saida no arquivo

    json.dump(circuitoJson, circuitoJsonArquivo, indent=4) #salva o json de saida no arquivo criado

  try:
    return Response(json.dumps(circuitoJson), status=200, mimetype="application/json")
  
  except:
    return Response(json.dumps({"Erro ao cadastrar":"Envie um Json valido"}), status=400, mimetype="application/json")

app.run(host='0.0.0.0', port=80, debug=True)