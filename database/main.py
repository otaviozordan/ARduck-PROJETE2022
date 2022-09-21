from flask import Flask, Response, request
import json

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    response = {}
    response["Teste de Resquisição"] = "/ [POST]"
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
    print("")

    return Response(json.dumps(recive), status=200, mimetype="application/json")

@app.route("/start", methods=["GET"])
def start():
    response = {}
    response["status"] = "on"
    global state
    state = True

    print("")
    print("Start Server")
    print("")

    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/stop", methods=["GET"])
def stop():
    response = {}
    response["status"] = "off"
    global state
    state = False

    print("")
    print("Stop Server")
    print("")


    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/state", methods=["GET"])
def state():
    response = {}
    response["status"] = state

    print("")
    print("State Server", end=" ")
    print(state)
    print("")


    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/tensao", methods=["POST"])
def cadastrar_tensao():
    recive = request.get_json()

    try:
        global tensao
        tensao=recive["tensao"]
        
        print("")
        print("Nova tensão cadastrada:", end=" ")
        print(tensao, end="")
        print("[mV]")

        response = {}
        response["Valor cadastrado para tensão"] = tensao

        return Response(json.dumps(response), status=200, mimetype="application/json")
    except Exception as e:
        print('Erro ao enviar')
        
        response = {}
        response["Mensagem"] = "Erro"

        return Response(json.dumps(response), status=400, mimetype="application/json")

@app.route("/tensao", methods=["GET"])
def ler_tensao():
    response = {}
    response["tensao"] = tensao

    print("")
    print("Servidor fazendo  leitura:", end=" ")
    print(tensao, end="")
    print("[mV]")

    return Response(json.dumps(response), status=200, mimetype="application/json")

app.run(port=80, debug=True)