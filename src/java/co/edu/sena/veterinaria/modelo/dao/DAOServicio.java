/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao;

import co.edu.sena.veterinaria.modelo.dao.fabrica.Conexion;
import co.edu.sena.veterinaria.modelo.dto.ServicioDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Clase de acceso a los datos de la tabla servicio de la base de datos.
 * @author Alejandro Ramirez
 */
public class DAOServicio {
    
    private Connection conn;
    
    /**
     * Metodo envia la peticion para ejecutar el procedimiento regitrarServicio
     * en la base de datos.
     * @param dto ServicioDTO con los datos.
     * @return True si registro, false si no lo hizo.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarServicio(ServicioDTO dto) throws Exception {
        boolean exito = true;
        conn = Conexion.generarConexion();
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call registrarServicio(?, ?, ?)}");
            stmt.setString(1, dto.getNombre());
            stmt.setString(2, dto.getCaracter());
            stmt.setString(3, dto.getNotas());
            stmt.execute();
        } catch (SQLException ex) {
            exito = false;
        } finally {
            if (stmt != null && conn != null) {
                stmt.close();
                conn.close();
            }
        }
        return exito;
    }
    
     /**
     * Metodo que se conecta a la base de datos y consulta los datos de los servicios.
     * @param informacion Contenido que debe cumplir la columna por la que se
     * busca a los servicios.
     * @param columna Nombre de la columna por la que se desea buscar a los
     * servicios (nom, cod o Todos).
     * @return ArrayList de ServicioDTO o null si ocurre una SQLException
     * @throws java.lang.Exception Exception originada por fallo en la conexion
     * o error al consultar los servicios.
     */
    public ArrayList<ServicioDTO> consultarServicios(String columna, String informacion) throws Exception {
        ArrayList<ServicioDTO> dtos = new ArrayList<>();
        conn = Conexion.generarConexion();
        String sql = "";
        if (columna.equals("nom")) 
            sql = " WHERE SerNombre LIKE ? OR "
                    + "SerNombre LIKE ? OR "
                    + "SerNombre LIKE ? OR "
                    + "SerNombre LIKE ?";
        else if (columna.equals("cod"))
            sql = " WHERE SerCodigo = ? ";
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("SELECT SerCodigo, "
                    + "SerNombre, SerCaracter, SerNotas, SerHabilitado "
                    + "FROM tblservicio" + sql);
            if (columna.equals("cod")) {
                stmt.setString(1, informacion);
            } else if (columna.equals("nom")) {
                stmt.setString(1, informacion);
                stmt.setString(2, "%" + informacion);
                stmt.setString(3, informacion + "%");
                stmt.setString(4, "%" + informacion + "%");
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ServicioDTO dto = new ServicioDTO();
                dto.setCodigo(rs.getInt(1));
                dto.setNombre(rs.getString(2));
                dto.setCaracter(rs.getString(3));
                dto.setNotas(rs.getString(4));
                String habilitado = rs.getString(5);
                if(habilitado.equals("si"))
                    dto.setHabilitado(true);
                else
                    dto.setHabilitado(false);
                dtos.add(dto);
            }
            stmt.close();
            rs.close();
            conn.close();
        }
        return dtos;
    }
    
    /**
     * Metodo que habilita o deshabilita el servicio según sea el caso.
     * @param cod Codigo del servicio a modificar.
     * @param nuevoEstado Nuevo estado del servicio.
     * @return True si se modifico, false si no lo hizo.
     * @throws Exception Error al conectarse a la base de datos.
     */
    public boolean modificarEstadoServicio(int cod, boolean nuevoEstado) throws Exception {
        boolean exito;
        conn = Conexion.generarConexion();
        PreparedStatement stmt = conn.prepareStatement("UPDATE tblservicio SET "
                + "SerHabilitado = ? WHERE SerCodigo = ?");
        if(nuevoEstado)
            stmt.setString(1, "si");
        else
            stmt.setString(1, "no");
        stmt.setInt(2, cod);
        try {
        exito = stmt.executeUpdate() > 0;
        } catch (SQLException ex){
            exito = false;
        }finally {
            if(stmt != null && conn != null){
                stmt.close();
                conn.close();
            }
        }
        return exito;
    }
}
