/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.controlador;

import co.edu.sena.veterinaria.modelo.Fachada;
import co.edu.sena.veterinaria.modelo.dto.MascotaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alejandro Ramirez
 */
public class ControladorMascota extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarMascota(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dniSt = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        String sexo = request.getParameter("sexo");
        String nacimientoSt = request.getParameter("nacimiento");
        String tamanio = request.getParameter("tamanio");
        String color = request.getParameter("color");
        String pelo = request.getParameter("pelo");
        String notas = request.getParameter("notas");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(nacimientoSt);
            Calendar nacimiento = Calendar.getInstance();
            nacimiento.setTime(date);
            long dni = Long.parseLong(dniSt);
            boolean exito = fachada.registrarMascota(nombre, especie, raza, color, 
                    tamanio, sexo, notas, pelo, nacimiento, dni);
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
    protected void consultarMascota(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String dniSt = request.getParameter("dni");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        try {
            Long dni = Long.parseLong(dniSt);
            ArrayList<MascotaDTO> dtos = fachada.consultarMascotas(dni);
            if(dtos.size() > 0)
                request.getSession().setAttribute("arrayMascotas", dtos);
            else
                request.getSession().setAttribute("msjCM", "No se encontró ningúna mascota");
        } catch (Exception ex) {
            request.getSession().setAttribute("msjCM", "Error en la conexión a la base de datos");
        } finally {
            response.sendRedirect("/Veterinaria/ConsultarMascota.jsp");
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
        if (request.getParameter("consultarMascota") != null)
            consultarMascota(request, response);
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
        if(request.getParameter("registrarMascota") != null)
            registrarMascota(request, response);
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
