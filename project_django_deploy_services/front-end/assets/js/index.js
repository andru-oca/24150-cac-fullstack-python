import { Products } from "./products.js";

let productsBtn = document.getElementById("hover-spand");

const productsUrl = `https://dummyjson.com/products`;

const fetcherProducts = () => {
  fetch(productsUrl)
    .then((res) => res.json())
    .then((data) =>{
        data.products.map((p) => new Products(p))
        .forEach((p) => p.printDisplay())
    }
    )
    .catch((error) => console.log({ error }));
};

productsBtn.addEventListener("click", fetcherProducts);
