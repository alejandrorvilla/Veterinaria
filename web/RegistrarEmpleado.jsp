<%-- 
    Document   : RegistrarEmpleado
    Created on : 24-abr-2016, 19:29:10
    Author     : Alejandro Ramirez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String sesion = session.getAttribute("sesion") + ""; 
    if (sesion.equals("null")) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Empleado</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
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
                    <h1>Registrar Empleado</h1>
                </div>
                <div class="seccion seccion-R-Animal border-panel sombra">
                    <form onSubmit="registrarEmpleado(document.forms[0]); return false" id="form">
                        <div class="border-panel conjunto-registrar">
                            <table>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">DNI:</label>
                                    </td>
                                    <td>
                                        <input required type="number" id="dni" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Nombre:</label>
                                    </td>
                                    <td>
                                        <input required type="text" id="nombre" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Apellido:</label>
                                    </td>
                                    <td>
                                        <input required type="text" id="apellido" class="text-pequeno center-text tamano-cajas"/>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Contraseña:</label>
                                    </td>
                                    <td>
                                        <input type="password" id="password" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Dirección:</label>
                                    </td>
                                    <td>
                                        <input type="text" id="direccion" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Email:</label>
                                    </td>
                                    <td>
                                        <input type="email" id="email" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Teléfono:</label>
                                    </td>
                                    <td>
                                        <input type="number" id="telefono" class="text-pequeno center-text tamano-cajas"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Tipo Empleado:</label>
                                    </td>
                                    <td>
                                        <select required class="text-pequeno center-text tamano-cajas" id="tipo">
                                            <option value="">Seleccione</option>
                                            <option value="Administrador">Administrador</option>
                                            <option value="Secretario">Secretario</option>
                                            <option value="Medico">Medico</option>
                                        </select>
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
