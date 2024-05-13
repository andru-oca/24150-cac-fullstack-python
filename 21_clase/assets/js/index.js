import { Viaje } from "./viaje.js";

// El endpoint donde buscar la dar
const URL = "https://sheetdb.io/api/v1/6m8khf1v9yw4m";
let password = "r7l62ux0i06z8bnjjovglszd63prg0savqiu6idm";
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
      let valor = document
      .querySelector("#filtroPrecio")
      .valueAsNumber   || Infinity   ;

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

