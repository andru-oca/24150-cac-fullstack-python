export class Products {
  constructor({ title, description, brand, images }) {
    this.title = title 
    this.description = description 
    this.brand = brand 
    this.images = images
    this.index = 0
  }

  loop() {
    this.index++;
    if (this.index >= this.images.length) {
      this.index = 0;
    }
    const img = this.div.querySelector('.changer');
    img.src = this.images[this.index];
    
    const button = this.div.querySelector('.close-tag');
    button.textContent = this.index + 1;
  }
  
  removeDisplay() {
    this.div.remove();
  }

  printDisplay() {
    let container = document.getElementById("container");

    this.div = document.createElement("div");

    this.div.classList.add("item");
    this.div.innerHTML = `
            <button class="close close-tag">${this.index + 1}</button>
            <h3 >${this.title}</h3>
            <p>${this.description}</p>
            <p>${this.brand}</p>
            <img src="${this.images[this.index]}" class="changer">
    `;

    container.appendChild(this.div);
    const closeButton = this.div.querySelector('.close');
    const changerClick = this.div.querySelector('.changer')
    changerClick.addEventListener('click',() => this.loop())
    closeButton.addEventListener('click', () => this.removeDisplay());
  }

}

