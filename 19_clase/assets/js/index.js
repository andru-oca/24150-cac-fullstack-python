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
  constructor({ nombre_ciudad, precio, oferta, descuento, pasajes }) {
    this.nombreCiudad = nombre_ciudad;
    this.precio = precio;
    this.oferta = oferta;
    this.descuento = descuento;
    this.pasajes = pasajes;
    this.precioNumerico = this.transformPrecio()
  }

  transformPrecio(){
    let amountWithoutSymbols = this.precio.replace(/[$ ,]/g, "");
    return parseFloat(amountWithoutSymbols);

  }

  printDisplay() {
    let container = document.getElementById("container");

    let div = document.createElement("div");

    div.classList.add("viaje");
    div.innerHTML = `
            <button class="closer"> x </button>
            <h3 class="color">${this.nombreCiudad}</h3>
            
                <p>${this.precio}</p>
                <p>${this.descuento}</p>
            
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
let password = "zag75vv1p77717zk3pbly23snparz1lexe0z778d";
// la accion de hacer un consumo desde esa api

const headers = { Authorization: `Bearer ${password}` };

const loadingData = () =>
{  
  // consume data desde la api
  fetch(URL,{headers})
    // transforma ese json en un array
    .then((res) => res.json())
    // transforma cada elemento en un objeto viaje
    .then((data) =>
      data.map((d) => new Viaje(d))
    )
    // filtra los objetos que tienen un valor menor al que dice en el input
    .then(data => {
      let valor = document.querySelector("#filtroPrecio").valueAsNumber;
      return data.filter(viaje => viaje.precioNumerico < valor )
    })
    // inyecta dentro de la pantalla con ese filtro
    .then(data => data.forEach(viaje => viaje.printDisplay()))
    .catch((error) => console.log({ error }));
}
const clearData = () => {
  let container = document.getElementById("container");
  container.innerHTML = "";
};

let btn = document.querySelector("#loadData");
btn.addEventListener("click", loadingData);

