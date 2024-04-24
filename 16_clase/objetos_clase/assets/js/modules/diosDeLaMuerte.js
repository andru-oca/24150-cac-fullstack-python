/**
 * Constructor de la clase DiosesDeLaMuerte.
 *
 * @param {string} name - El nombre del dios de la muerte.
 * @param {string} status - El estado del dios de la muerte.
 * @param {string} power - El poder del dios de la muerte.
 * @param {Array} fantasmas - La lista de fantasmas asociados al dios de la muerte.
 */
export class DiosesDeLaMuerte {
  reino = "Tartaro";

  constructor(name, status, power, fantasmas = []) {
    this.name = name;
    this.status = status;
    this.power = power;
    this.fantasmas = fantasmas;
  }

  agregarFantasma(fantasma) {
    this.fantasmas.push(fantasma);
    console.info("Se agregó un fantasma");
  }

  borrarFantasma(fantasma) {
    const index = this.fantasmas.indexOf(fantasma);
    if (index > -1) {
      this.fantasmas.splice(index, 1);
      console.info("Se borró un fantasma");
    } else {
      console.error("El fantasma no existe en la lista");
    }
  }

  displayFantasmas() {
    document.write(`<h2>Los fantasmas de ${this.name}</h2>`);
    document.write(`<h3>Su reino es el: ${this.reino}</h3>`);
    document.write("<ul>");
    for (const fantasma of this.fantasmas) {
      document.write(`<li>Fantasma: ${fantasma}</li>`);
    }
    document.write("</ul>");
  }
}
