import string
from tokenize import String
from flask import Flask, Response, request
import json

app = Flask(__name__)

global tensao
tensao = 0
global state
staete = 0

@app.route("/", methods=["GET"])
def index():
    response = {}
    response["Teste de Resquisicao"] = "/ [POST]"
    response["Cadastrar valor para tensao"] = "/tensao [POST]"
    response["Ler valor de tensao"] = "/tensao [GET]"
    response["Inicia leitura de tensao"] = "/start [GET]"
    response["Para leitura de tensao"] = "/stop [GET]"
    response["Estado atual do servidor"] = "/state [GET]"

    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/", methods=["POST"])
def teste_post():
    recive = request.get_json()

    print("")
    print("Post Recebido")
    print(recive)
    
    return Response(json.dumps(recive), status=200, mimetype="application/json")

@app.route("/start", methods=["GET"])
def start():
    response = {}
    response["status"] = "on"
    state = True

    print("")
    print("Start Server")

    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/stop", methods=["GET"])
def stop():
    response = {}
    response["status"] = "off"
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

    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/tensao", methods=["POST"])
def cadastrar_tensao():
    recive = request.get_json()

    try:
        tensao=recive["tensao"]
        
        print("")
        print("Nova tensão cadastrada:", end=" ")
        print(tensao, end="")
        print("[mV]")

        response = {}
        response["Valor cadastrado para tensao"] = tensao

        return Response(json.dumps(response), status=200, mimetype="application/json")
    except Exception as e:
        print('Erro ao enviar')
        
        response = {}
        response["Mensagem"] = "Erro"

        return Response(json.dumps(response), status=400, mimetype="application/json")

@app.route("/tensao", methods=["GET"])
def ler_tensao():
    response = {}
    response["tensao"] = str(tensao)

    print("")
    print("Servidor fazendo  leitura:", end=" ")
    print(tensao, end="")
    print("[mV]")

    return Response(json.dumps(response), status=200, mimetype="application/json")

app.run(host='0.0.0.0', port=80, debug=True)