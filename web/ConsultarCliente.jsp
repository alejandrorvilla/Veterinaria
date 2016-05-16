<%-- 
    Document   : ConsultarCliente
    Created on : 15-may-2016, 8:46:08
    Author     : Alejandro Ramírez
--%>

<%@page import="co.edu.sena.veterinaria.modelo.dto.ClienteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="Vista/css/design.css">
        <title>Consultar Clientes</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico">
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <script src="Vista/js/javascript.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <section class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <jsp:include page="nav.jsp"/>
                        <%
                            String mensaje = session.getAttribute("msjCC") + "";
                            if (!mensaje.equals("null")) {
                                if (mensaje.contains("Error")) {
                        %>
                        <div class="alert alert-danger center-text" role="alert" arial >
                            <%=mensaje%>
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div> 
                        <% } else if (mensaje.contains("Actualizo")) { %>
                        <div class="alert alert-success center-text" role="alert" arial >
                            Cliente actualizado exitosamente
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>  
                        <% } else {%>
                        <div class="alert alert-warning center-text" role="alert" arial >
                            <%=mensaje%>
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>            
                        <%      }
                                session.removeAttribute("msjCC");
                            }
                        %>
                        <div class="center-text">
                            <h1>Consultar Clientes</h1>
                        </div>
                        <form action="/Veterinaria/ControladorCliente" method="post">
                            <div class="conjunto-registrar">
                                <div class="center-text">
                                    <label for="sel" >Buscar por:</label>  
                                    <select name="sel" class="tamañoConsultar" id="sel" required onchange="capturar()" >
                                        <option value="" >Seleccione</option>
                                        <option value="Todos" >Todos</option>
                                        <option value="nom" >Nombre</option>
                                        <option value="dni">DNI</option>
                                    </select>
                                    <label for="buscar" >Información:</label> 
                                    <input type="text" name="buscar" id="buscar" class="text-pequeno center-text tamano-cajas" /> 
                                    <button class="center-text sombra boton-pequeno" type="submit" name="consultarClientes" class="fuente">Consultar</button>	        
                                </div>      
                            </div>
                        </form>
                        <div>
                            <center>
                                <table class="table"  border="0" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="center-text">DNI</th>
                                            <th class="center-text">Nombre</th>
                                            <th class="center-text">Teléfono</th>
                                            <th class="center-text">E-mail</th>
                                            <th class="center-text">Dirección</th>
                                            <th class="center-text">Celular</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (session.getAttribute("arrayClientes") instanceof ArrayList) {
                                                ArrayList<ClienteDTO> dtos = (ArrayList) session.getAttribute("arrayClientes");
                                                for (int i = 0; i < dtos.size(); i++) {
                                        %>
                                        <tr>
                                            <td class="center-text"><%=dtos.get(i).getDni()%></td>
                                            <td class="center-text"><%=dtos.get(i).getNombre() + " " + dtos.get(i).getApellido()%></td>
                                            <td class="center-text"><%=dtos.get(i).getTelefono()%></td>
                                            <td class="center-text"><%=dtos.get(i).getEmail()%></td>
                                            <td class="center-text"><%=dtos.get(i).getDireccion()%></td>
                                            <td class="center-text"><%=dtos.get(i).getCelular()%></td>
                                            <td class="center-text">
                                                <a onclick="formActualizarCliente('<%=dtos.get(i).getDni()%>',
                                                                '<%=dtos.get(i).getNombre()%>', '<%=dtos.get(i).getApellido()%>',
                                                   <%=dtos.get(i).getTelefono()%>, '<%=dtos.get(i).getEmail()%>',
                                                                '<%=dtos.get(i).getDireccion()%>', <%=dtos.get(i).getCelular()%>)" 
                                                   data-toggle="tooltip" data-placement="top" title="Actualizar Cliente"
                                                   style="cursor: pointer">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </a>
                                                <a onclick="formRegistrarMascota('<%=dtos.get(i).getDni()%>')" 
                                                   data-toggle="tooltip" data-placement="top" title="Registrar Mascota" 
                                                   style="cursor: pointer">
                                                    <span class="glyphicon glyphicon-piggy-bank"></span>
                                                </a>
                                                <a href="/Veterinaria/ControladorMascota?consultarMascota=true&dni=<%=dtos.get(i).getDni()%>"
                                                   data-toggle="tooltip" data-placement="top" title="Ver Mascotas">
                                                    <span class="glyphicon glyphicon-info-sign"></span>
                                                </a>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                                session.removeAttribute("arrayClientes");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </center>
                            <form id="form-oculto" method="post" action="ActualizarCliente.jsp">
                                <input type="hidden" name="dni" id="dni">
                                <input type="hidden" name="nombre" id="nombre">
                                <input type="hidden" name="apellido" id="apellido">
                                <input type="hidden" name="telefono" id="telefono">
                                <input type="hidden" name="email" id="email">
                                <input type="hidden" name="direccion" id="direccion">
                                <input type="hidden" name="celular" id="celular">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>