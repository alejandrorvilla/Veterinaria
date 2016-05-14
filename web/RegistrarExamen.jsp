<%-- 
    Document   : RegistrarExamen
    Created on : 27-abr-2016, 7:22:17
    Author     : Alejandro Ramirez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Examen</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <script src="Vista/js/examen.js"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <section>
            <div class="seccion fuente">
                <div class="titulo-secciones border-panel center-text sombra">
                    <h1 >Registrar Exámen</h1>
                </div>
                <div class="seccion seccion-R-Animal border-panel sombra">
                    <form onSubmit="registrarExamen(document.forms[0]);
                            return false" id="form">
                        <div class="border-panel conjunto-registrar">
                            <table>
                                <tr>
                                    <td>
                                        <label class="text-pequeno tamano-cajas">Nombre</label>
                                    </td>
                                    <td>
                                        <input type="text" name="nombre" class="text-pequeno center-text tamano-cajas"/>
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
                                <button class="center-text sombra boton" type="submit" name="registrar" class="fuente">Registrar</button>
                            </center>
                        </div>
                    </form>
                    </section>
                    <section class="center-text container">
                        <table class="table" id="tabla">
                            <thead>
                                <tr>
                                    <th class="center-text">Código</th>
                                    <th class="center-text">Nombre</th>
                                    <th class="center-text">Notas</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </section>
                </div>
            </div>
    </body>
</html>
