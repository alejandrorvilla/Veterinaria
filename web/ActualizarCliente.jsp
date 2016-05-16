<%-- 
    Document   : ActualizarCliente
    Created on : 15-may-2016, 12:31:06
    Author     : Alejandro Ramírez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8");
    String sesion = session.getAttribute("sesion") + "";
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
        <title>Actualizar Cliente</title>
    </head>
    <body>
        <section class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <jsp:include page="nav.jsp"/>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="seccion fuente">
                                <div class="titulo-secciones border-panel center-text sombra">
                                    <h1 >Actualizar cliente</h1>
                                </div>
                                <div class="seccion seccion-R-Animal border-panel sombra">
                                    <form onSubmit="actualizarCliente(document.forms[0]);
                                    return false" id="form">
                                        <div class="border-panel conjunto-registrar">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">DNI:</label>
                                                    </td>
                                                    <td>
                                                        <input readOnly required type="number" value="<%=request.getParameter("dni")%>"
                                                               name="dni" maxlength="4" class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Nombres:</label>
                                                    </td>
                                                    <td>
                                                        <input required type="text" name="nombre" value="<%=request.getParameter("nombre")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Apellidos:</label>
                                                    </td>
                                                    <td>
                                                        <input required type="text" name="apellido" value="<%=request.getParameter("apellido")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Celular:</label>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="celular" value="<%=request.getParameter("celular")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Dirección:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="direccion" value="<%=request.getParameter("direccion")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Email:</label>
                                                    </td>
                                                    <td>
                                                        <input type="email" name="email" value="<%=request.getParameter("email")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Teléfono:</label>
                                                    </td>
                                                    <td>
                                                        <input type="number" name="telefono" value="<%=request.getParameter("telefono")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                            </table>                 
                                        </div>
                                        <div>
                                            <center>
                                                <button class="center-text sombra boton fuente">Actualizar</button>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>