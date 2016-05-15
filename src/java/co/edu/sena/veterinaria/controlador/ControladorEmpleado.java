/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.controlador;

import co.edu.sena.veterinaria.modelo.Fachada;
import co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alejandro Ramirez
 */
public class ControladorEmpleado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String usuarioSt = request.getParameter("usuario");
        String contraseña = request.getParameter("pass");
        try {
            long usuario = Long.parseLong(usuarioSt);
            Fachada fachada = new Fachada();
            request.getSession().setAttribute("fachada", fachada);
            String tipo = fachada.iniciarSesion(usuario, contraseña);
            if(!tipo.isEmpty()) {
                String[] datos = tipo.split("-");
                if(datos[1].equals("si")) {
                    out.print(true);
                    request.getSession().setAttribute("sesion", datos[0]);
                } else 
                    out.print("Deshabilitado");
            } else 
                out.print(false);
        } catch(NumberFormatException ex){
            out.print("Usuario");
        } catch(Exception ex){
            out.print("Error");
        }
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().invalidate();
        response.sendRedirect("/Veterinaria/index.jsp");
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dniSt = request.getParameter("dni");
        String pass = request.getParameter("pass");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String telSt = request.getParameter("telefono");
        String tipo = request.getParameter("tipo");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            long dni = Long.parseLong(dniSt);
            long telefono = Long.parseLong(telSt);
            boolean exito = fachada.registrarEmpleado(nombre, apellido, email, 
                    direccion, dni, telefono, tipo, pass);
            out.print(exito);
        } catch(NumberFormatException ex){
            out.print("Numero");
        } catch(Exception ex){
            out.print("Error");
        }
    }
    
     /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void consultarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String columna = request.getParameter("sel");
        String informacion = request.getParameter("buscar");
        if(!columna.equals("Todos")) {
            if(informacion.trim().isEmpty()){
                request.getSession().setAttribute("msjCE", "El campo información es obligatorio");
                response.sendRedirect("/Veterinaria/ConsultarEmpleado.jsp");
                return;
            }
        }
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            ArrayList<EmpleadoDTO> dtos = fachada.consultarEmpleado(columna, informacion);
            if(dtos.size() > 0)
                request.getSession().setAttribute("arrayEmp", dtos);
            else
                request.getSession().setAttribute("msjCE", "No se encontró ningún empleado");
        } catch (Exception ex) {
            request.getSession().setAttribute("msjCE", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarEmpleado.jsp");
        }
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void modificarEstado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            long dni = Long.parseLong(request.getParameter("dni"));
            String habilitado = request.getParameter("estado");
            boolean estado = !habilitado.equals("true");
            Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
            if(fachada.modificarEstadoEmpleado(dni, estado)) {
                if(estado)
                    request.getSession().setAttribute("msjCE", "Empleado con la DNI: " + dni + " fue habilitado");
                else
                    request.getSession().setAttribute("msjCE", "Empleado con la DNI: " + dni + " fue deshabilitado");
            }else {
                request.getSession().setAttribute("msjCE", "Error con la DNI del empleado");
            }
        } catch (NumberFormatException ex) {
            request.getSession().setAttribute("msjCE", "Error con la DNI del empleado");
        } catch (Exception ex){
            request.getSession().setAttribute("msjCE", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarEmpleado.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("cerrarSesion") != null)
            cerrarSesion(request, response);
        else if (request.getParameter("modificarEstado") != null)
            modificarEstado(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("iniciarSesion") != null)
            iniciarSesion(request, response);
        else if (request.getParameter("registrarEmpleado") != null)
            registrarEmpleado(request, response);
        else if (request.getParameter("consultarEmpleado") != null)
            consultarEmpleado(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
