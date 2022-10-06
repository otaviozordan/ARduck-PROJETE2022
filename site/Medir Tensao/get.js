function fazGet(url) {
    let request = new XMLHttpRequest()
    request.open("GET", url, false)
    request.send()
    return request.responseText
}

function get(){
    event.preventDefault();
    let url = "https://arduckapi.otaviozordan.repl.co/circuito/" + document.getElementById("id").value
    let data = fazGet(url)
    console.log(data)
    document.getElementById("demo").innerHTML = JSON.stringify((data), null, 4);
    alert(JSON.stringify(JSON.parse(data, null, 4)))
}
