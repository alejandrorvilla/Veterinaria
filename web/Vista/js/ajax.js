/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Metodo que envia la peticion de inicio de sesion al controlador.
 * @param {type} campo1 Campo de texto con el usuario.
 * @param {type} campo2 Campo de texto con la contraseña.
 * @returns {undefined}
 */
function iniciarSesion(campo1, campo2) {
    usuario = campo1.value;
    contra = campo2.value;
    var xhttp = new XMLHttpRequest();
    var text = "/Veterinaria/ControladorEmpleado?usuario=" + usuario + "&pass=" + contra + "&iniciarSesion=true";
    xhttp.open("POST", text, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if ((sub.indexOf("false") >= 0)) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El usuario y la contraseña no coinciden" + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.indexOf("Usuario") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El campo usuario solo recibe numeros</div>");
            }else if (sub.indexOf("Deshabilitado") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El empleado tiene restringido el acceso al sistema</div>");
            } else if (sub.indexOf("true") >= 0) {
                window.location = 'menu.jsp';

            }
        }
    }
}

/**
 * Metodo que envia la peticion de registrar un empleado al controlador.
 * @param {type} document Formulario.
 * @returns {undefined}
 */
function registrarEmpleado(document) {
    dni = document.elements[0].value;
    nombre = document.elements[1].value;
    apellido = document.elements[2].value;
    pass = document.elements[3].value;
    direccion = document.elements[4].value;
    email = document.elements[5].value;
    telefono = document.elements[6].value;
    tipo = document.elements[7].value;
    var xhttp = new XMLHttpRequest();
    var text = "/Veterinaria/ControladorEmpleado?dni=" + dni + "&pass=" + pass +
            "&nombre=" + nombre + "&apellido=" + apellido + "&email=" + email +
            "&direccion=" + direccion + "&telefono=" + telefono + "&tipo=" +
            tipo + "&registrarEmpleado=true";
    xhttp.open("POST", text, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Existe otro empleado registrado con el DNI: " + dni + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexión a la base de datos</div>");
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Empleado registrado exitosamente</div>");
                $("#form")[0].reset();
            } else if (sub.indexOf("Numero") >= 0){
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Los campos DNI y Teléfono solo reciben numeros" + "</div>");
            } else if (sub.indexOf("Deshabilitado") >= 0){
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El empleado existe, pero esta deshabilitado" + "</div>");
            }
        }
    }
}

/**
 * Metodo que envia la peticion de registrar un examen al controlador.
 * @param {type} document Formulario.
 * @returns {undefined}
 */
function registrarExamen(document) {
    nombre = document.elements[0].value;
    notas = document.elements[1].value;
    var xhttp = new XMLHttpRequest();
    var text = "/Veterinaria/ControladorExamen?nombre=" + nombre + "&notas=" 
            + notas + "&registrarExamen=true";
    xhttp.open("POST", text, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Ocurrio un error al registrar el examen"+"</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexión a la base de datos</div>");
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success center-text'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Examen registrado exitosamente</div>");
                $("#form")[0].reset();
            }
        }
    }
}
