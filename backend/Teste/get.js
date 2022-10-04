function get(){
    event.preventDefault();
    let url = "https://arduckapi.otaviozordan.repl.co/circuito/" + document.getElementById("id").value
    let request = new XMLHttpRequest()

    request.open("GET", url, false)
    request.send(null)
    request.onload = function() {
        console.log(this.responseText)
        document.getElementById("text").innerHTML = request.responseText;
    }

    return request.responseText
}