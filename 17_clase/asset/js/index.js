console.log("hola mundo")

/**
 * 
 * @id --> Se genera auto
 * @nombre
 * @description
 * @precio
*/
class Productos{
    constructor(nombre,descripcion,precio){
        this.id = crypto.randomUUID()
        this.nombre = nombre
        this.descripcion = descripcion
        this.precio = precio
        console.log(`producto creado  ${this.id}`)
    }

    displayValor(){
        return this.precio
    }
    readId(){
        return this.id
    }
    printProducto(){

        return `<li>${this.nombre} - ${this.precio}</li>`

    }
}


class ManagerPizzeria{
    constructor(nombre = "Kentucky", database = []){
        this.nombre = nombre
        this.database = database
    }

    printAllProducts(){

        let productos_text = ""
        for(let producto of this.database){
            productos_text +=  producto.printProducto()
        }
        

        return `
        <ul>
         ${productos_text}
        </ul>
        
        `
    }

    getAllProducts(){
        document.write(`<p>${this.nombre}</p>`);
        document.write(`<p>${this.database.length}</p>`);

        if (this.database.length == 0){
            document.write(`<p>No tenemos productos</p>`);
            return
        }

        for(let producto of this.database){
            producto.printProducto()
        }
    }
    getOneProduct(id){
        return this.database.find(
            producto => producto.id == id
        )
    }

    getLastProduct(){
        let len_last = this.database.length - 1
        return this.database[len_last]
    }

    insertOneProduct(producto){
        this.database.push(producto)
    }

    deleteOneProduct(id){
        this.database = this.database.filter(
            producto => producto.id != id
        )
    }

}


function main(){


    let baseDatosInicial = [
      {
        nombre: "Lettuce - Escarole",
        descripcion: "Training",
        precio: 16748.56,
      },
      {
        nombre: "Tomatoes - Cherry",
        descripcion: "Sales",
        precio: 17843.22,
      },
      {
        nombre: "Tuna - Bluefin",
        descripcion: "Marketing",
        precio: 19307.9,
      },
      {
        nombre: "Breakfast Quesadillas",
        descripcion: "Human Resources",
        precio: 13183.83,
      },
      {
        nombre: "Ice Cream Bar - Oreo Sandwich",
        descripcion: "Human Resources",
        precio: 11948.44,
      },
      {
        nombre: "Mcgillicuddy Vanilla Schnap",
        descripcion: "Sales",
        precio: 17161.76,
      },
      {
        nombre: "Rice Wine - Aji Mirin",
        descripcion: "Accounting",
        precio: 10621.12,
      },
      {
        nombre: "Pork - Side Ribs",
        descripcion: "Engineering",
        precio: 15945.72,
      },
      {
        nombre: "Wine - White, Chardonnay",
        descripcion: "Product Management",
        precio: 16596.03,
      },
      {
        nombre: "Tart Shells - Savory, 2",
        descripcion: "Product Management",
        precio: 12146.53,
      },
    ];



    let nuevosProductos = []
    nuevosProductos = baseDatosInicial.map((pJson) => new Productos(pJson.nombre ,pJson.descripcion,pJson.precio));

    console.log(nuevosProductos)
    let romana = new Productos("pizza romana","pizza romana desc",10000)
    let muzza = new Productos("Muzzarella","pizza comun",20000)
    let kentucky = new ManagerPizzeria("Kentucky")

    nuevosProductos.forEach(
        p =>
        kentucky.insertOneProduct(p)
    )


    kentucky.insertOneProduct(romana)
    kentucky.insertOneProduct(muzza);
    

    kentucky.getAllProducts() 


    let main = document.getElementById("app")

    // let li = document.createElement("li")
    // li.innerHTML = romana.printProducto()

    // main.appendChild(li)

    main.innerHTML = kentucky.printAllProducts()
}



main()






