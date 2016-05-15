<%-- 
    Document   : ConsultarServicio
    Created on : 15-may-2016, 11:28:48
    Author     : Alejandro Ramírez
--%>

<%@page import="co.edu.sena.veterinaria.modelo.dto.ServicioDTO"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Consultar Servicio</title>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script type="text/javascript" src="Vista/js/ajax.js"></script>
        <script type="text/javascript" src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script type="text/javascript" src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="Vista/js/javascript.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>		
        <%
            String mensaje = session.getAttribute("msjCS") + "";
            if (!mensaje.equals("null")) {
                if (mensaje.contains("Error")) {
        %>
        <div class="alert alert-danger center-text" role="alert" arial >
            <%=mensaje%>
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        </div>
        <%
            } else if (mensaje.contains("habilitado")) {%>
        <div class="alert alert-success center-text" role="alert" arial >
            <%=mensaje%>
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        </div>             
        <% } else {%>
        <div class="alert alert-warning center-text" role="alert" arial >
            <%=mensaje%>
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        </div>            
        <%      }
                session.removeAttribute("msjCS");
            }
        %>
        <section>
            <div class="center-text">
                <h1>Consultar Servicio</h1>
            </div>
            <form action="/Veterinaria/ControladorServicio" method="post">
                <div class="conjunto-registrar">
                    <div class="center-text">
                        <label for="sel" >Buscar por:</label>  
                        <select name="sel" class="tamañoConsultar" id="sel" required onchange="capturar()" >
                            <option value="" >Seleccione</option>
                            <option value="Todos" >Todos</option>
                            <option value="nom" >Nombre</option>
                            <option value="cod">Código</option>
                        </select>
                        <label for="buscar" >Información:</label> 
                        <input type="text" name="buscar" id="buscar" class="text-pequeno center-text tamano-cajas" /> 
                        <button class="center-text sombra boton-pequeno" type="submit" name="consultarServicio" class="fuente">Consultar</button>	        
                    </div>      
                </div>
            </form>
            <div>
                <center class="container">
                    <table class="table"  border="0" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="center-text">Código</th>
                                <th class="center-text">Nombre</th>
                                <th class="center-text">Carácter</th>
                                <th class="center-text">Notas</th>
                                <th class="center-text">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (session.getAttribute("arrayServicios") instanceof ArrayList) {
                                    ArrayList<ServicioDTO> dtos = (ArrayList) session.getAttribute("arrayServicios");
                                    for (int i = 0; i < dtos.size(); i++) {
                            %>
                            <tr>
                                <td class="center-text"><%=dtos.get(i).getCodigo()%></td>
                                <td class="center-text"><%=dtos.get(i).getNombre()%></td>
                                <td class="center-text"><%=dtos.get(i).getCaracter()%></td>
                                <td class="center-text"><%=dtos.get(i).getNotas()%></td>
                                <td class="center-text">
                                    <%if (dtos.get(i).isHabilitado()) { %>
                                    <a href="/Veterinaria/ControladorServicio?cod=<%=dtos.get(i).getCodigo()%>&estado=<%=dtos.get(i).isHabilitado()%>&modificarEstado=true"
                                       data-toggle="tooltip" data-placement="top" title="Habilitado">
                                        <span class="glyphicon glyphicon-ok asd "></span>
                                    </a>
                                    <% } else { %>
                                    <a href="/Veterinaria/ControladorServicio?cod=<%=dtos.get(i).getCodigo()%>&estado=<%=dtos.get(i).isHabilitado()%>&modificarEstado=true"
                                       data-toggle="tooltip" data-placement="top" title="Deshabilitado">
                                        <span class="glyphicon glyphicon-remove asd "></span>
                                    </a>
                                    <% } %>
                                    
                                </td>
                            </tr>
                            <%
                                    }
                                    session.removeAttribute("arrayServicios");
                                }
                            %>
                        </tbody>
                    </table>
                </center>
            </div>
        </section>
    </body>
</html>
