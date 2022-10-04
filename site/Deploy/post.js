/**
 * Post.js - Faz o post para o backend
 * Author: Otávio Zordan < Github: @otaviozordan > < Linkedin: https://www.linkedin.com/in/otavio-zordan/ > < Instagram: @otaviozordan >
 * Date: 2022-10-04
 * Description: Script para cadastrar novo circuito na API Flask
**/

function fazPost(url, body) {
    console.log("Body=", body)
    let request = new XMLHttpRequest()
    request.open("POST", url, true)
    request.setRequestHeader("Content-type", "application/json")
    request.send(JSON.stringify(body))

    request.onload = function() {
        console.log(this.responseText)
    }

    return request.responseText
}

function cadastrarCircuito() {
    event.preventDefault();
    let url = "https://arduckapi.otaviozordan.repl.co/circuito/" + document.getElementById("id").value
    //let url = "http://192.168.0.105:80/circuito/" + document.getElementById("id").value
    let typeCircuit = document.getElementById("type").value
    let Vtotal = document.getElementById("Vtotal").value
    let R1 = document.getElementById("R1").value
    let R2 = document.getElementById("R2").value
    let R3 = document.getElementById("R3").value
    let R4 = document.getElementById("R4").value
    let R5 = document.getElementById("R5").value
    let tolerance = document.getElementById("tolerancia").value

    console.log(id)
    console.log(typeCircuit)
    console.log(Vtotal)
    console.log(R1)
    console.log(R2)
    console.log(R3)
    console.log(R4)
    console.log(R5)

    body = {
        "dados do circuito": [
            {
                "name": "Tipo",
                "type": typeCircuit
            },
            {
                "name": "Vtotal (Vcc)",
                "value": Vtotal
            }
        ],
        "resistores": [
            {
                "id": 1,
                "name": "R1",
                "value": R1,
                "tolerance": tolerance
            },
            {
                "id": 2,
                "name": "R2",
                "value": R2,
                "tolerance": tolerance
            },
            {
                "id": 3,
                "name": "R3",
                "value": R3,
                "tolerance": tolerance
            },
            {
                "id": 4,
                "name": "R4",
                "value": R4,
                "tolerance": tolerance
            },
            {
                "id": 5,
                "name": "R5",
                "value": R5,
                "tolerance": tolerance
            }
        ]
    }

    fazPost(url, body)
}