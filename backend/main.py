from flask import Flask, Response, request
import json

app = Flask(__name__)

global tensao
tensao = 0

global state
state = False

global tolmax
tolmax = 15

@app.route("/", methods=["GET"])
def index():
  return ler_tensao()

@app.route("/routes", methods=["GET"])
def routes():
  response = {}
  response["Cadastrar valor para tensao"] = "/tensao [POST]"
  response["Ler valor de tensao"] = "/tensao [GET]"
  response["Inicia leitura de tensao"] = "/start [GET]"
  response["Para leitura de tensao"] = "/stop [GET]"
  response["Estado atual do servidor"] = "/state [GET]"

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/start", methods=["GET"])
def start():
  response = {}
  response["status"] = "on"
  global state
  state = True

  print("")
  print("Start Server")

  return Response(json.dumps(response), status=200, mimetype="application/json")


@app.route("/stop", methods=["GET"])
def stop():
  response = {}
  response["status"] = "off"
  global state
  state = False

  print("")
  print("Stop Server")

  return Response(json.dumps(response), status=200, mimetype="application/json")


@app.route("/state", methods=["GET"])
def state():
  response = {}
  response["status"] = state

  print("")
  print("State Server", end=" ")
  print(state)

  try:
    return Response(json.dumps(response), status=200, mimetype="application/json")

  except:
    return Response(json.dumps({"status":False}), status=200, mimetype="application/json")


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
  print("Servidor fazendo  leitura:", end=" ")
  print(tensao, end="")
  print("[mV]")

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/circuito/<id>", methods=["GET"])
def retrna_medida(id):
  response = {}
  listResistor = []
  global VresistorAnterior 
  global VresistormaxAnterior 
  global VresistorminAnterior

  file = open('backend\data\circuito' + id + '.json')
  data = json.load(file)

  for i in data['resistores']:
    print(i["name"])
    Vresistor = (i['tensao'])
    Vresistormax = Vresistor + Vresistor*tolmax/100
    Vresistormin = Vresistor - Vresistor*tolmax/100

    if(Vresistormax > tensao > Vresistormin):
      nameResistor = (i['name'])
      print("Encontrado", end=" ")
      print(nameResistor)
      listResistor.append(nameResistor)
      print(listResistor)
      VresistorAnterior = Vresistor
      VresistormaxAnterior = Vresistormax
      VresistorminAnterior = Vresistormin

  if(len(listResistor) == 0):
    nameResistor = "Resistor não encontrado"
    listResistor.append(nameResistor)
    VresistorAnterior = "Indefinido"
    VresistormaxAnterior = "Indefinido"
    VresistorminAnterior = "Indefinido"

  print("resistores: ", listResistor)

  response["resistor"] = listResistor
  response["tensao medida"] = tensao
  response["tensao do resistor"] = VresistorAnterior
  response["tensao maxima aceitavel"] = VresistormaxAnterior
  response["tensao minima aceitavel"] = VresistorminAnterior

  return Response(json.dumps(response), status=200, mimetype="application/json")

app.run(host='0.0.0.0', port=80, debug=True)