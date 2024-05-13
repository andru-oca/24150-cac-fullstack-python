const apiUrl = 'https://sheetdb.io/api/v1/jmh3aoaoz5wsa'

document
.getElementById("containerForm")
.addEventListener("submit", function(event) {
    event.preventDefault();
    const formData = new FormData(this);
    fetch(apiUrl, {
        method: "POST",
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Network response was not ok");
        }
        return response.text();
    })
    .then(data => {
        console.log(data);
        alert("Formulario enviado con éxito");
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Error al enviar el formulario");
    });
});