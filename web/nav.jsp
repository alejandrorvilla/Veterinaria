<%-- 
    Document   : nav
    Created on : 23-abr-2016, 12:03:01
    Author     : Alejandro Ramirez
--%>
<%  String sesion = session.getAttribute("sesion") + "";
%>
<div class="arriba fuente">
    <a href="/Veterinaria/ControladorEmpleado?cerrarSesion=true"><h4>Salir</h4></a></div>
<div class="banner">   
</div>
<div class="Menu sombra">
    <ul class="navegador">
        <li class="fuente"><a href="menu.jsp">Menu</a></li>
        <% if(sesion.equals("Administrador")){ %>
        <li class="fuente"><a >Empleados</a>
            <ul>
                <li><a href="RegistrarEmpleado.jsp">Registrar</a></li>
                <li><a href="ConsultarEmpleado.jsp">Consultar</a></li>
            </ul>
        </li>
        <li class="fuente"><a >Servicios</a>
            <ul>
                <li><a href="RegistrarServicio.jsp">Registrar</a></li>               
                <li><a href="ConsultarServicio.jsp">Consultar</a></li>
            </ul>
        </li>
        <li class="fuente"><a >Examenes</a>
            <ul>
                <li><a href="RegistrarExamen.jsp">Registrar</a></li>              
            </ul>
        </li>
        <% } %>
        <li class="fuente"><a>Clientes</a>
            <ul>
                <% if(sesion.equals("Administrador") || sesion.equals("Secretario")) { %>
                <li><a href="RegistrarClientes.jsp">Registrar</a></li>
                <% } %>
                <li><a href="ConsultarCliente.jsp">Consultar</a></li>
            </ul>
        </li>
    </ul>	
</div>
