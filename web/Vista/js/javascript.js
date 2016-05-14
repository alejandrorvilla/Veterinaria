/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function capturar() {
    var posicion = document.getElementById("sel").options.selectedIndex;
    var valor = document.getElementById("sel").options[posicion].text;
    
    if (valor == "Todos") {
        document.getElementById("buscar").readOnly = true;
        document.getElementById("buscar").required = false;
        document.getElementById("buscar").value = "";
    } else if (valor == "DNI"){
        document.getElementById("buscar").value = "";
        document.getElementById("buscar").type = "number";
        document.getElementById("buscar").readOnly = false;
        document.getElementById("buscar").required = true;
    }else {
        document.getElementById("buscar").readOnly = false;
        document.getElementById("buscar").required = true;
    }
}
