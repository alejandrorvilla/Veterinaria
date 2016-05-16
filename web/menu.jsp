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
        <title>Menu</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico">
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <section class="container fuente">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <jsp:include page="nav.jsp"/>
                    <% if (sesion.equals("Administrador")) { %>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="menus-home center-text">
                                <div class="titulo-home">Empleados</div>
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="vinculos-home">
                                        <a href="RegistrarEmpleado.jsp">Registrar</a>
                                    </li>
                                    <li class="vinculos-home">
                                        <a href="ConsultarEmpleado.jsp">Consultar</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="menus-home center-text">
                                <div class="titulo-home">Servicios</div>
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="vinculos-home">
                                        <a href="RegistrarServicio.jsp"> Registrar</a>
                                    </li>
                                    <li class="vinculos-home">
                                        <a href="ConsultarServicio.jsp"> Consultar</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%  } %>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="menus-home center-text">
                                <div class="titulo-home">Clientes</div>
                                <ul class="nav nav-pills nav-stacked">
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
                        </div>
                        <% if (sesion.equals("Administrador")) { %>
                        <div class="col-md-6">
                            <div class="menus-home center-text">
                                <div class="titulo-home">Examenes</div>
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="vinculos-home">
                                        <a href="RegistrarExamen.jsp">Registrar</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </section>
    </body>
</html>
