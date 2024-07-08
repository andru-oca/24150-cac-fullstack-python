const HOST = "localhost" 
const PORT = 8000

const form = document.getElementById("crear_pelicula_form")
const btn = document.getElementById("btn-post")

const URL_API_BASE = `http://${HOST}:${PORT}/api/pelicula/`

btn.addEventListener(
    "click", (e) => {
        e.preventDefault()
        fetch(URL_API_BASE,{
            method: 'POST',
            body: new FormData(form)
        }).then(res => console.log(res))
        .catch(error => console.log({error}))
    }
)

class Pelicula{
    constructor({fecha_release,genero,id,nombre,duracion}){
        this.duracion = duracion
        this.fecha_release = fecha_release
        this.genero = genero
        this.id = id
        this.nombre = nombre
        this.url = URL_API_BASE
        
    }

    createDiv(){
        this.div = document.createElement("div")

        this.div.innerHTML =  `
            <div id="${this.id}">
                <h4>${this.nombre}</h4>
                <hr>
                <ul>
                    <li>duracion: ${this.duracion}</li>
                    <li>genero: ${this.genero}</li>
                    <li>fecha de estreno: ${this.fecha_release}</li>
                </ul>
            </div>
        `

        let btn = document.createElement("button")
        btn.innerText = `Borrar Peli ${this.nombre}`
        btn.addEventListener("click", ()=>{
            fetch(`${this.url}${this.id}/`,{method:"DELETE"})
            .then(this.removeDisplay())
            .catch(error => console.log({error}))
        })
        this.div.appendChild(btn)
        return this.div

    }
  
    removeDisplay() {
        this.div.remove();
    }



}


const btnGet = document.getElementById("btn-get")
btnGet.addEventListener(
    "click", () => {
        fetch(URL_API_BASE)
        .then(res => res.json())
        .then(data =>{
            let container = document.getElementById("peliculas")
            data.map(p =>  new Pelicula(p))
            .forEach(p => container.appendChild(p.createDiv()))
        } 
        )
        .catch(error => console.log({error}))
    }
)