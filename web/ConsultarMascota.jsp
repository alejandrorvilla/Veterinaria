<%-- 
    Document   : ConsultarMascota
    Created on : 15-may-2016, 22:00:04
    Author     : Alejandro Ramírez
--%>

<%@page import="co.edu.sena.veterinaria.modelo.dto.MascotaDTO"%>
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
        <title>Consultar Mascotas</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico">
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <script src="Vista/js/javascript.js"></script>
    </head>
    <body>
        <section class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <jsp:include page="nav.jsp"/>
                        <%
                            String mensaje = session.getAttribute("msjCM") + "";
                            if (!mensaje.equals("null")) {
                                if (mensaje.contains("Error")) {
                        %>
                        <div class="alert alert-danger center-text" role="alert" arial >
                            <%=mensaje%>
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div> 
                        <% } else {%>
                        <div class="alert alert-warning center-text" role="alert" arial >
                            <%=mensaje%>
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        </div>            
                        <%      }
                                session.removeAttribute("msjCM");
                            }
                        %>
                        <div class="center-text">
                            <h1>Consultar Mascotas</h1>
                        </div>
                        <div>
                            <center>
                                <table class="table"  border="0" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="center-text">Codigo</th>
                                            <th class="center-text">Nombre</th>
                                            <th class="center-text">Especie</th>
                                            <th class="center-text">Raza</th>
                                            <th class="center-text">Sexo</th>
                                            <th class="center-text">Nacimiento</th>
                                            <th class="center-text">Tamaño</th>
                                            <th class="center-text">Color</th>
                                            <th class="center-text">Pelo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            if (session.getAttribute("arrayMascotas") instanceof ArrayList) {
                                                ArrayList<MascotaDTO> dtos = (ArrayList) session.getAttribute("arrayMascotas");
                                                for (int i = 0; i < dtos.size(); i++) {
                                        %>
                                        <tr>
                                            <td class="center-text"><%=dtos.get(i).getCodigo()%></td>
                                            <td class="center-text"><%=dtos.get(i).getNombre()%></td>
                                            <td class="center-text"><%=dtos.get(i).getEspecie()%></td>
                                            <td class="center-text"><%=dtos.get(i).getRaza()%></td>
                                            <td class="center-text"><%=dtos.get(i).getSexo()%></td>
                                            <td class="center-text"><%=dtos.get(i).getFecha()%></td>
                                            <td class="center-text"><%=dtos.get(i).getTamanio()%></td>
                                            <td class="center-text"><%=dtos.get(i).getColor()%></td>
                                            <td class="center-text"><%=dtos.get(i).getPelo()%></td>
                                            
                                        </tr>
                                        <%
                                                }
                                                session.removeAttribute("arrayMascotas");
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>