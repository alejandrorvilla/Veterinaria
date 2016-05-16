<%-- 
    Document   : nav
    Created on : 23-abr-2016, 12:03:01
    Author     : Alejandro Ramirez
--%>
<%  String sesion = session.getAttribute("sesion") + "";
%>
<div class="arriba fuente">
    <a href="/Veterinaria/ControladorEmpleado?cerrarSesion=true"><h4>Salir</h4></a></div>
<div class="row">
    <div class="page-header">
        <img src="Vista/imagenes/baner.png" class="img-responsive"/>
    </div>
</div>
<nav class="navbar navbar-default"  role="navigation">
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                <div class="navbar-header" style="color: white">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
                            data-target="#navegacion" aria-expanded="false">
                        <span class="sr-only">Desplegar/Ocultar Menu</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navegacion">
                    <ul class="nav navbar-nav" style="color: white">
                        <li><a href="menu.jsp" >Menu</a></li>
                            <% if (sesion.equals("Administrador")) { %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Empleados
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="RegistrarEmpleado.jsp">Registrar Empleado</a></li>
                                <li><a href="ConsultarEmpleado.jsp">Consultar Empleados</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Servicios
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="RegistrarServicio.jsp">Registrar Servicio</a></li>
                                <li><a href="ConsultarServicio.jsp">Consultar Servicios</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Examenes
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="RegistrarExamen.jsp">Registrar Examen</a></li>
                            </ul>
                        </li>
                        <% } %>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Clientes
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <% if (sesion.equals("Administrador") || sesion.equals("Secretario")) { %>
                                <li><a href="RegistrarClientes.jsp">Registrar Cliente</a></li>
                                    <% }%>
                                <li><a href="ConsultarCliente.jsp">Consultar Clientes</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                </div>
            </div>
        </div>
    </div>
</nav>