from flask import Flask, Response, request
import json

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    response = {}
    response["Cadastrar valor para tensao"] = "/tensao [POST]"
    response["Ler valor de tensao"] = "/tensao [GET]"

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

    return Response(json.dumps(response), status=200, mimetype="application/json")

app.run()