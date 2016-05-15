/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.controlador;

import co.edu.sena.veterinaria.modelo.Fachada;
import co.edu.sena.veterinaria.modelo.dto.ServicioDTO;
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
public class ControladorServicio extends HttpServlet {

     /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String nombre = request.getParameter("nombre");
        String notas = request.getParameter("notas");
        String caracter = request.getParameter("caracter");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            boolean exito = fachada.registrarServicio(nombre, notas, caracter);
            out.print(exito);
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
    protected void consultarServicios(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String columna = request.getParameter("sel");
        String informacion = request.getParameter("buscar");
        if(!columna.equals("Todos")) {
            if(informacion.trim().isEmpty()){
                request.getSession().setAttribute("msjCS", "El campo información es obligatorio");
                response.sendRedirect("/Veterinaria/ConsultarServicio.jsp");
                return;
            }
        }
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            ArrayList<ServicioDTO> dtos = fachada.consultarServicios(columna, informacion);
            if(dtos.size() > 0)
                request.getSession().setAttribute("arrayServicios", dtos);
            else
                request.getSession().setAttribute("msjCS", "No se encontró ningún servicio");
        } catch (Exception ex) {
            request.getSession().setAttribute("msjCS", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarServicio.jsp");
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
            int codigo = Integer.parseInt(request.getParameter("cod"));
            String habilitado = request.getParameter("estado");
            boolean estado = !habilitado.equals("true");
            Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
            if(fachada.modificarEstadoServicio(codigo, estado)) {
                if(estado)
                    request.getSession().setAttribute("msjCS", "Servicio con el Código: " +
                            codigo + " fue habilitado");
                else
                    request.getSession().setAttribute("msjCS", "Servicio con el Código: " +
                            codigo + " fue deshabilitado");
            }else {
                request.getSession().setAttribute("msjCS", "Error con el Código del servicio");
            }
        } catch (NumberFormatException ex) {
            request.getSession().setAttribute("msjCS", "Error con el Código del servicio");
        } catch (Exception ex){
            ex.printStackTrace();
            request.getSession().setAttribute("msjCS", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarServicio.jsp");
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
        if (request.getParameter("modificarEstado") != null)
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
        if (request.getParameter("registrarServicio") != null)
            registrarServicio(request, response);
        else if (request.getParameter("consultarServicio") != null)
            consultarServicios(request, response);
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
