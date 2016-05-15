<%-- 
    Document   : RegistrarClientes
    Created on : 14-may-2016, 20:43:41
    Author     : Alejandro Ramírez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + "";
    if (sesion.equals("null") || sesion.equals("Medico")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="utf-8">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <title>Registrar Cliente</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>	
        <section>
            <div class="seccion fuente">
                <div class="titulo-secciones border-panel center-text sombra">
                    <h1 >Registrar cliente</h1>
                </div>
                <div class="seccion seccion-R-Animal border-panel sombra">
                    <form onSubmit="registrarCliente(document.forms[0]);
                        return false" id="form">
                        <div class="border-panel conjunto-registrar">
                            <table>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">DNI:</label>
                                    </td>
                                    <td>
                                        <input required type="number"  name="dni" maxlength="4" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Nombres:</label>
                                    </td>
                                    <td>
                                        <input required type="text" name="nombre" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Apellidos:</label>
                                    </td>
                                    <td>
                                        <input required type="text" name="apellido" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Celular:</label>
                                    </td>
                                    <td>
                                        <input type="number" name="celular" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Dirección:</label>
                                    </td>
                                    <td>
                                        <input type="text" name="direccion" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Email:</label>
                                    </td>
                                    <td>
                                        <input type="email" name="email" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Teléfono:</label>
                                    </td>
                                    <td>
                                        <input type="number" name="telefono" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                            </table>                 
                        </div>
                        <div>
                            <center>
                                <button class="center-text sombra boton fuente">Registrar</button>
                            </center>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </body>
</html>