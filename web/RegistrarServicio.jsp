<%-- 
    Document   : RegistrarServicio
    Created on : 15-may-2016, 11:05:33
    Author     : Alejandro Ramírez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + "";
    if (sesion.equals("null") || !sesion.equals("Administrador")) {
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
        <title>Registrar Servicio</title>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <section>
            <div class="seccion fuente">
                <div class="titulo-secciones border-panel center-text sombra">
                    <h1 >Registrar Servicio</h1>
                </div>
                <div class="seccion seccion-R-Animal border-panel sombra">
                    <form onSubmit="registrarServicio(document.forms[0]);
                        return false" id="form">
                        <div class="border-panel conjunto-registrar">
                            <table>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Nombre</label>
                                    </td>
                                    <td>
                                        <input required type="text" name="nombre" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Carácter</label>
                                    </td>
                                    <td>
                                        <select required class="text-pequeno center-text tamano-cajas" name="templeado" onChange="combo(this, 'theinput')">
                                            <option value="">Seleccione</option>
                                            <option value="Cirugía">Cirugía</option>
                                            <option value="Higiene">Higiene</option>
                                            <option value="Vacunación">Vacunación</option>
                                            <option value="Otros">Otros</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Notas</label>
                                    </td>
                                    <td>
                                        <textarea class="text-pequeno center-text tamano-cajas"></textarea>
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