<%-- 
    Document   : ConsultarEmpleado
    Created on : 25-abr-2016, 14:07:26
    Author     : Alejandro Ramirez
--%>

<%@page import="co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + "";
    if (sesion.equals("null") || !sesion.equals("Administrador")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Empleado</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
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
                    <jsp:include page="nav.jsp"/>
                    <div class="row">
                        <div class="col-md-12">
                            <%
                                String mensaje = session.getAttribute("msjCE") + "";
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
                                    session.removeAttribute("msjCE");
                                }
                            %>
                            <section>
                                <div class="center-text">
                                    <h1>Consultar Empleado</h1>
                                </div>
                                <form action="/Veterinaria/ControladorEmpleado" method="post">
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
                                            <button class="center-text sombra boton-pequeno" type="submit" name="consultarEmpleado" class="fuente">Consultar</button>	        
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
                                                    <th class="center-text">Tipo</th>
                                                    <th class="center-text">Estado</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    if (session.getAttribute("arrayEmp") instanceof ArrayList) {
                                                        ArrayList<EmpleadoDTO> dtos = (ArrayList) session.getAttribute("arrayEmp");
                                                        for (int i = 0; i < dtos.size(); i++) {
                                                %>
                                                <tr>
                                                    <td class="center-text"><%=dtos.get(i).getDni()%></td>
                                                    <td class="center-text"><%=dtos.get(i).getNombre() + " " + dtos.get(i).getApellido()%></td>
                                                    <td class="center-text"><%=dtos.get(i).getTelefono()%></td>
                                                    <td class="center-text"><%=dtos.get(i).getEmail()%></td>
                                                    <td class="center-text"><%=dtos.get(i).getDireccion()%></td>
                                                    <td class="center-text"><%=dtos.get(i).getTipo()%></td>
                                                    <td class="center-text">
                                                        <%if (dtos.get(i).isHabilitado()) {%>
                                                        <a href="/Veterinaria/ControladorEmpleado?dni=<%=dtos.get(i).getDni()%>&estado=<%=dtos.get(i).isHabilitado()%>&modificarEstado=true"
                                                           data-toggle="tooltip" data-placement="top" title="Habilitado">
                                                            <span class="glyphicon glyphicon-ok asd "></span>
                                                        </a>
                                                        <% } else {%>
                                                        <a href="/Veterinaria/ControladorEmpleado?dni=<%=dtos.get(i).getDni()%>&estado=<%=dtos.get(i).isHabilitado()%>&modificarEstado=true"
                                                           data-toggle="tooltip" data-placement="top" title="Deshabilitado">
                                                            <span class="glyphicon glyphicon-remove asd "></span>
                                                            <% } %>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                        session.removeAttribute("arrayEmp");
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </center>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
