<%-- 
    Document   : RegistrarMascota
    Created on : 15-may-2016, 17:40:03
    Author     : Alejandro Ramírez
--%>

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
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="Vista/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/design.css">
        <link rel="shortcut ico" href="Vista/imagenes/favicon.ico"/>
        <script src="Vista/js/ajax.js"></script>
        <script src="Vista/js/jquery-1.12.3.min.js" ></script>
        <script src="Vista/bootstrap/js/bootstrap.min.js"></script>
        <script src="Vista/js/javascript.js"></script>
        <title>Registrar Mascota</title>
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
                                    <h1>Registrar Mascota</h1>
                                </div>
                                <div id="alerta"></div>
                                <div class="seccion seccion-R-Animal border-panel sombra">
                                    <form onSubmit="registrarMascota(document.forms[0]);
                                            return false" id="form">
                                        <div class="border-panel conjunto-registrar">
                                            <table class="tablaMascota">
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Cliente:</label>
                                                    </td>
                                                    <td>
                                                        <input readOnly required type="number" name="dni" value="<%=request.getParameter("dni")%>"
                                                               class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Nombre:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="text" class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Especie:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text"  name="especie"  class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Raza:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="raza" class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Sexo:</label>
                                                    </td>
                                                    <td>
                                                        <select class="text-pequeno center-text tamano-cajas" name="sexo" onChange="combo(this, 'theinput')">
                                                            <option value="Hembra">Hembra</option>
                                                            <option value="Macho">Macho</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Notas:</label>
                                                    </td>
                                                    <td>
                                                        <textarea name="notas" cols="20" rows="4" class="text-pequeno center-text tamano-cajas"></textarea>
                                                    </td>
                                                </tr>
                                            </table>                 
                                            <table class="tablaMascota">
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Nacimiento:</label>
                                                    </td>
                                                    <td>
                                                        <input type="date" name="nacimiento" class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Color:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="color" class="text-pequeno center-text tamano-cajas"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Tamaño:</label>
                                                    </td>
                                                    <td>
                                                        <select class="text-pequeno center-text tamano-cajas" name="sexo" onChange="combo(this, 'theinput')">
                                                            <option value="Pequeño">Pequeno</option>
                                                            <option value="Mediano">Mediano</option>
                                                            <option value="Grande">Grande</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-pequeno tamano-cajas">Pelo:</label>
                                                    </td>
                                                    <td>
                                                        <select class="text-pequeno center-text tamano-cajas" name="sexo" onChange="combo(this, 'theinput')">
                                                            <option value="Corto">Corto</option>
                                                            <option value="Mediano">Mediano</option>
                                                            <option value="Largo">Largo</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                            <center>
                                                <button class="center-text sombra boton fuente">Registrar</button>
                                            </center>
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
