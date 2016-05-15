/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.controlador;

import co.edu.sena.veterinaria.modelo.Fachada;
import co.edu.sena.veterinaria.modelo.dto.ClienteDTO;
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
public class ControladorCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dniSt = request.getParameter("dni");
        String celularSt = request.getParameter("celular");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String telSt = request.getParameter("telefono");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            Long celular = Long.parseLong(celularSt);
            long dni = Long.parseLong(dniSt);
            long telefono = Long.parseLong(telSt);
            boolean exito = fachada.registrarCliente(nombre, apellido, email, 
                    direccion, dni, telefono, celular);
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
    protected void consultarClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String columna = request.getParameter("sel");
        String informacion = request.getParameter("buscar");
        if(!columna.equals("Todos")) {
            if(informacion.trim().isEmpty()){
                request.getSession().setAttribute("msjCC", "El campo información es obligatorio");
                response.sendRedirect("/Veterinaria/ConsultarCliente.jsp");
                return;
            }
        }
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            ArrayList<ClienteDTO> dtos = fachada.consultarClientes(columna, informacion);
            if(dtos.size() > 0)
                request.getSession().setAttribute("arrayClientes", dtos);
            else
                request.getSession().setAttribute("msjCC", "No se encontró ningún cliente");
        } catch (Exception ex) {
            ex.printStackTrace();
            request.getSession().setAttribute("msjCC", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarCliente.jsp");
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
    protected void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dniSt = request.getParameter("dni");
        String celularSt = request.getParameter("celular");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String telSt = request.getParameter("telefono");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            Long celular = Long.parseLong(celularSt);
            long dni = Long.parseLong(dniSt);
            long telefono = Long.parseLong(telSt);
            if(fachada.actualizarCliente(nombre, apellido, email, 
                    direccion, dni, telefono, celular))
                request.getSession().setAttribute("msjCC", "Actualizo");
            else
                out.print(false);
        } catch(NumberFormatException ex){
            out.print("Numero");
        } catch(Exception ex){
            ex.printStackTrace();
            out.print("Error");
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
        if (request.getParameter("registrarCliente") != null)
            registrarCliente(request, response);
        else if (request.getParameter("consultarClientes") != null)
            consultarClientes(request, response);
        else if (request.getParameter("actualizarCliente") != null)
            actualizarCliente(request, response);
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
