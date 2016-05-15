<%-- 
    Document   : index
    Created on : 23-abr-2016, 11:35:06
    Author     : Alejandro Ramirez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + "";
    if (!sesion.equals("null")) {
        response.sendRedirect("menu.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Veterinaria</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/index.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="cuadro #bdc3c7">
            <section class="center-text">
                <h2 class="fuente center-text">Consultorio Veterinario<br>Mundo Animal Extremo</h2>
                <img src="Vista/imagenes/foto.jpg" height="200" width="200">
                <div class="interno">
                    <form onSubmit="iniciarSesion(document.getElementById('usuario'), 
                                document.getElementById('contraseña'));return false">
                        <input required class="center-text" type="number" id="usuario" placeholder="Usuario" class="fuente"/>
                        <input required class="center-text" type="password" id="contraseña" placeholder= "Contraseña" class="fuente"/>
                       <button class="center-text fuente">Iniciar Sesión</button>
                    </form>
                </div>
            </section>
        </div>	
    </body>
</html>
