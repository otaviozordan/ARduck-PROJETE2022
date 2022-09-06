from urllib import response
from flask import Flask, Response, request
import json

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    response = {}
    response["Cadastrar valor para tensão"] = "/tensao [POST]"
    response["Modelo:"] = "{\"tensao\" = \"value\" }"

    return Response(json.dumps(response), status=200, mimetype="application/json")

@app.route("/tensao", methods=["POST"])
def cadastrar_tensao():
    body = request.get_json()

    try:
        tensao=body["tensao"]
        
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

app.run()