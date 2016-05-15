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
    } else if (valor == "DNI" || valor == "Código"){
        document.getElementById("buscar").value = "";
        document.getElementById("buscar").type = "number";
        document.getElementById("buscar").readOnly = false;
        document.getElementById("buscar").required = true;
    }else {
        document.getElementById("buscar").readOnly = false;
        document.getElementById("buscar").required = true;
    }
}

function formActualizarCliente(dni, nombre, apellido, telefono, email, direccion, celular) {
    document.getElementById("dni").value = dni;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellido").value = apellido;
    document.getElementById("telefono").value = telefono;
    document.getElementById("email").value = email;
    document.getElementById("direccion").value = direccion;
    document.getElementById("celular").value = celular;
    document.getElementById("form-oculto").submit();
}