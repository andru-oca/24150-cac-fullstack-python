export class Viaje {

  constructor({ nombre_ciudad, precio, oferta, descuento, pasajes }) {
    this.nombreCiudad = nombre_ciudad;
    this.precio = precio;
    this.oferta = oferta;
    this.descuento = descuento;
    this.pasajes = pasajes;
    this.precioNumerico = this.#transformPrecio();
  }

  #transformPrecio() {
    let amountWithoutSymbols = this.precio.replace(/[$ ,]/g, "");
    return parseFloat(amountWithoutSymbols);
  }

  removeDisplay() {
    this.div.remove();
  }

  printDisplay() {
    let container = document.getElementById("container");
    this.div = document.createElement("div");
    this.div.classList.add("viaje");
    this.div.innerHTML = `
            <button class="closer" id="close"> x </button>
            <h3 class="color">${this.nombreCiudad}</h3>
            
                <p>${this.precio}</p>
                <p>${this.descuento}</p>
            
            <details>
                <summary> Detalles extras</summary>
                ${this.pasajes} | ${this.oferta}
            </details>    
    `;

    container.appendChild(this.div);
    
    const closeButton = this.div.querySelector(".closer");
    closeButton.addEventListener("click", () => this.removeDisplay());
  }
}
