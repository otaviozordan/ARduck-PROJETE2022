from flask import Flask, Response, request
import json
import os

from sqlalchemy import null

app = Flask(__name__)

os.system("python3 ")


#declara variavel para tensão medida
global tensao
tensao = 0

#status da medição
global state

#tolerancia do circuito de medição (%)
global tolmax
tolmax = 15

def zerar():
  global tensao
  tensao = 0

@app.route("/", methods=["GET"])
def index():
  return ler_tensao()

@app.route("/routes", methods=["GET"])
def routes():
  response = {}
  response["Inicia leitura de tensao na missão"] = "/start/<id> [GET]"
  response["Estado da missão"] = "/state [GET]"
  response["Indentifica medida no circuito"] = "/circuito/<id> [GET]"
  response["Para missão"] = "/stop [GET]"
  response["Cadastrar valor para tensao"] = "/tensao [POST]"
  response["Ler valor de tensao"] = "/tensao [GET]"


  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/start/<id>", methods=["GET"])
def start(id):

  response = {}
  response["status"] = "on"
  response["Circuito"] = id
  global state
  state = id

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
  print("Cliente lendo tensão:", end=" ")
  print(tensao, end="")
  print("[mV]")

  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/circuito", methods=["GET"])
def lista_circuitos():
  response = {}
  response["Erro, informe: "] = "/circuito/<id>"
  return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/circuito/<id>", methods=["GET"])
def retrna_medida(id):
  response = {}
  listaElementos = []
  global VresistorAnterior 
  global VresistormaxAnterior 
  global VresistorminAnterior

  file = open('backend\data\circuito' + id + '.json')
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
    listaElementos.append("Meça a tensão!")
    response["elemento"] = listaElementos
    print("Medida não realizada")

  print(json.dumps(response))
  return Response(json.dumps(response), status=200, mimetype="application/json"), zerar()

app.run(host='0.0.0.0', port=80, debug=True)