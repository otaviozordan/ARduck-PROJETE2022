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
        document.getElementById("response").innerHTML = JSON.stringify(JSON.parse(this.responseText, undefined, 4));
        alert("Circuito cadastrado com sucesso!")
        alert(JSON.stringify(JSON.parse(this.responseText, undefined, 4)))
    }

    return request.responseText
}

function cadastrarCircuito() {
    event.preventDefault();
    let url = "https://arduckapi.otaviozordan.repl.co/circuito/" + document.getElementById("id").value
    let typeCircuit = document.getElementById("type").value
    let Vtotal = document.getElementById("Vtotal").value
    let R1 = document.getElementById("R1").value
    let R2 = document.getElementById("R2").value
    let R3 = document.getElementById("R3").value
    let R4 = document.getElementById("R4").value
    let R5 = document.getElementById("R5").value
    let tolerance = document.getElementById("tolerancia").value

    console.log("Id:")
    console.log(id)
    console.log("Tipo:")
    console.log(typeCircuit)
    console.log("Tensão fonte:")
    console.log(Vtotal)
    console.log("Resistores:")
    console.log(R1)
    console.log(R2)
    console.log(R3)
    console.log(R4)
    console.log(R5)

    if(document.getElementById("id").value == 1){
        alert("Circuito Especial! Este é um id destinado a Demo-PROJETE 2022 onde se mede a tensão em referencia ao GND!")
        if((document.getElementById("R3") != 0)||document.getElementById("R3") != 0){
            alert("Este circuito somente comporta 3 resistores")

            R4 = 0
            R5 = 0
            console.log("Id:")
            console.log(id)
            console.log("Tipo:")
            console.log(typeCircuit)
            console.log("Tensão fonte:")
            console.log(Vtotal)
            console.log("Resistores:")
            console.log(R1)
            console.log(R2)
            console.log(R3)
            console.log(R4)
            console.log(R5)
        }
    }

    body = {
        "dados do circuito": [
            {
                "name": "Tipo",
                "type": typeCircuit
            },
            {
                "name": "Vtotal (Vcc)",
                "value": parseInt(Vtotal, 10)
            }
        ],
        "resistores": [
            {
                "id": 1,
                "name": "R1",
                "value": parseInt(R1, 10),
                "tolerance": parseInt(tolerance, 10) 
            },
            {
                "id": 2,
                "name": "R2",
                "value": parseInt(R2, 10),
                "tolerance": parseInt(tolerance, 10)
            },
            {
                "id": 3,
                "name": "R3",
                "value": parseInt(R3, 10),
                "tolerance": parseInt(tolerance, 10)
            },
            {
                "id": 4,
                "name": "R4",
                "value": parseInt(R4, 10),
                "tolerance": parseInt(tolerance, 10),
                "tensao":0
            },
            {
                "id": 5,
                "name": "R5",
                "value": parseInt(R5, 10),
                "tolerance": parseInt(tolerance, 10),
                "tensao":0
            }
        ]
    }

    fazPost(url, body)
    get();
}

function fazGet(url) {
    let request = new XMLHttpRequest()
    request.open("GET", url, false)
    request.send()
    return request.responseText
}

function get(){
    let url = "https://arduckapi.otaviozordan.repl.co/start/" + document.getElementById("id").value
    let data = fazGet(url)
    console.log("Start: ", data["circuito"])
}
