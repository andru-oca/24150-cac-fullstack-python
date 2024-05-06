// import comentarios from "./db.json" assert { type: "json" };

class Comments {
  constructor({ id, postId, comment }) {
    this.id = id;
    this.post_id = postId;
    this.comment = comment;
  }

  #transformarTexto() {
    return this.comment.slice(0, 70) + "...";
  }

  printDisplay() {
    let ul = document.getElementById("comments");
    let li = document.createElement("li");
    let texto = `${this.id} : ${this.post_id} : ${this.#transformarTexto()}`;
    li.innerHTML = texto;
    ul.appendChild(li);
  }
}

// let objetoComentarios = comentarios.map(
//     c => new Comments(c)
// )

// objetoComentarios.forEach(
//     c => c.printDisplay()
// )

// const URL = "/assets/js/db.json";
// const URL_API = "https://jsonplaceholder.org/comments";

// fetch(URL_API)
//   .then((data) => data.json())
//   .then((data) =>
//     data.map((c) => new Comments(c)).forEach((c) => c.printDisplay())
//   )
//   .catch((e) => {
//     let ul = document.getElementById("comments");
//     let texto = ` Error: ${e}`;
//     ul.innerHTML = texto;
//   });



// MODULO OBJETO
class Viaje {
  constructor({ nombre_ciudad,precio,oferta,descuento,pasajes }) {
    this.nombreCiudad = nombre_ciudad;
    this.precio= precio;
    this.oferta = oferta;
    this.descuento = descuento;
    this.pasajes = pasajes
  }


  printDisplay() {
    let container = document.getElementById("container");

    let div = document.createElement("div");

    div.innerHTML = `
            <h3 class="color">${this.nombreCiudad}</h3>
            <ul>
                <li>${this.precio}</li>
                <li>${this.descuento}</li>
            </ul>
            <details>
                <summary> Detalles extras</summary>
                ${this.pasajes} | ${this.oferta}
            </details>    
    `;

    container.appendChild(div);
  }
}

// El endpoint donde buscar la dar
const URL = "https://sheetdb.io/api/v1/tfiz44jksqe8l";

// la accion de hacer un consumo desde esa api

fetch(URL)
.then(res => res.json())
.then(data => data.map(d => new Viaje(d)).forEach(viaje => viaje.printDisplay()))
.catch(error => console.log({error}))


