<%-- 
    Document   : Menu
    Created on : 23-abr-2016, 11:40:12
    Author     : Alejandro Ramirez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + "";
    if (sesion.equals("null")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <link rel="stylesheet" href="Vista/css/design.css">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <title>Menu</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <section>
            <div class="fuente centrar-menu">
                <% if (sesion.equals("Administrador")) { %>
                    <div class="menus-home center-text">
                        <div class="titulo-home">Empleados</div>
                        <ul>
                            <li class="vinculos-home">
                                <a href="RegistrarEmpleado.jsp">Registrar</a>
                            </li>
                            <li class="vinculos-home">
                                <a href="ConsultarEmpleado.jsp">Consultar</a>
                            </li>
                        </ul>
                    </div>
                    <div class="menus-home center-text">
                        <div class="titulo-home">Servicios</div>
                        <ul>
                            <li class="vinculos-home">
                                <a href="RegistrarServicio.jsp"> Registrar</a>
                            </li>
                            <li class="vinculos-home">
                                <a href="ConsultarServicio.jsp"> Consultar</a>
                            </li>
                        </ul>
                    </div>
                <%  } %>
                    <div class="menus-home center-text">
                        <div class="titulo-home">Clientes</div>
                        <ul>
                            <% if (sesion.equals("Administrador") || sesion.equals("Secretario")) { %>
                            <li class="vinculos-home">
                                <a href="RegistrarClientes.jsp"> Registrar</a>
                            </li>
                            <% } %>
                            <li class="vinculos-home">
                                <a href="ConsultarCliente.jsp"> Consultar</a>
                            </li>
                        </ul>
                    </div>
                    <% if (sesion.equals("Administrador")) { %>
                    <div class="menus-home center-text">
                        <div class="titulo-home">Examenes</div>
                        <ul>
                            <li class="vinculos-home">
                                <a href="RegistrarExamen.jsp">Registrar</a>
                            </li>
                        </ul>
                    </div>
                <% }%>
            </div>
        </section>
    </body>
</html>
