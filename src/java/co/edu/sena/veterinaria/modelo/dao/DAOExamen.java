/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao;

import co.edu.sena.veterinaria.modelo.dao.fabrica.Conexion;
import co.edu.sena.veterinaria.modelo.dto.ExamenDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Clase de acceso a los datos de la tabla empleado de la base de datos.
 * @author Alejandro Ramirez
 */
public class DAOExamen {
    
    private Connection conn;

    /**
     * Constructor de la clase.
     */
    public DAOExamen() {
    }

    /**
     * Metodo envia la peticion para ejecutar el procedimiento registrarExamen en la base de datos.
     * @param dto ExamenDTO con los datos.
     * @return True si registro, false si no lo hizo.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarExamen(ExamenDTO dto) throws Exception {
        boolean exito;
        conn = Conexion.generarConexion();
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call registrarExamen(?, ?)}");
            stmt.setString(1, dto.getNombre());
            stmt.setString(2, dto.getNotas());
            exito = stmt.execute();
        } catch (SQLException ex) {
            exito = false;
        } finally {
            if(stmt != null && conn != null){
                stmt.close();
                conn.close();
            }
        }
        return exito;
    }
    
    /**
     * Metodo que obtiene de la base de datos todos los examenes registrados.
     * @return ArrayList de ExamenDTO.
     * @throws java.lang.Exception Si existe un error al conectarse a la base de datos.
     */
    public ArrayList<ExamenDTO> consultarExamenes() throws Exception{
        ArrayList<ExamenDTO> dtos = new ArrayList<>();
        conn = Conexion.generarConexion();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tblexamen");
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            ExamenDTO dto = new ExamenDTO();
            dto.setCodigo(rs.getInt(1));
            dto.setNombre(rs.getString(2));
            dto.setNotas(rs.getString(3));
            dtos.add(dto);
        }
        stmt.close();
        conn.close();
        return dtos;
    }
            
}
