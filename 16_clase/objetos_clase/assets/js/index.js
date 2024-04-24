import { DiosesDeLaMuerte } from "./modules/diosDeLaMuerte.js";

const seth    = new DiosesDeLaMuerte("seth", true, 100, ["bernardo", "andru"]);
const krishna = new DiosesDeLaMuerte("krishna", false, -100);
const kuthulu = new DiosesDeLaMuerte("kuthulhu", true, 500, ["verner", "wagner"]);

kuthulu.reino = "El infierno Lovecrafteano"



document
.getElementById("sethTrigger")
.addEventListener("click", () => seth.displayFantasmas())
