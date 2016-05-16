/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao;

import co.edu.sena.veterinaria.modelo.dao.fabrica.Conexion;
import co.edu.sena.veterinaria.modelo.dto.ClienteDTO;
import co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO;
import co.edu.sena.veterinaria.modelo.dto.MascotaDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;

/**
 * Clase de acceso a los datos de la tabla mascota.
 * @author Alejandro Ramírez
 */
public class DAOMascota {
    
    private Connection conn;

    /**
     * Metodo que ejecuta el procedimiento registrarMascota de la base de
     * datos.
     * @param dto Objeto que tranfiere los datos de mascota.
     * @return True si el procedimiento se ejecuto normalmente.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarMascota(MascotaDTO dto) throws Exception {
        boolean exito = true;
        conn = Conexion.generarConexion();
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call registrarMascota"
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            stmt.setLong(1, dto.getCliente().getDni());
            stmt.setString(2, dto.getNombre());
            stmt.setString(3, dto.getEspecie());
            stmt.setString(4, dto.getRaza());
            stmt.setString(5, dto.getSexo());
            stmt.setDate(6, new Date(dto.getNacimiento().getTimeInMillis()));
            stmt.setString(7, dto.getTamanio());
            stmt.setString(8, dto.getColor());
            stmt.setString(9, dto.getPelo());
            stmt.setString(10, dto.getNotas());
            stmt.execute();
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
     * Metodo que se conecta a la base de datos y consulta los datos de las mascotas de un cliente.
     * @param dni Dni del cliente dueño de las mascotas.
     * @return ArrayList de MascotaDTO o null si ocurre una SQLException
     * @throws java.lang.Exception Exception originada por fallo en la conexion
     * o error al consultar las mascotas.
     */
    public ArrayList<MascotaDTO> consultarMascotas(Long dni) throws Exception {
        ArrayList<MascotaDTO> dtos = new ArrayList<>();
        conn = Conexion.generarConexion();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM tblmascota WHERE DniCliente = ?");
            stmt.setLong(1, dni);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                MascotaDTO dto = new MascotaDTO();
                dto.setCodigo(rs.getInt(1));
                ClienteDTO cliente = new ClienteDTO();
                cliente.setDni(rs.getLong(2));
                dto.setCliente(cliente);
                dto.setNombre(rs.getString(3));
                dto.setEspecie(rs.getString(4));
                dto.setRaza(rs.getString(5));
                dto.setSexo(rs.getString(6));
                Calendar c = Calendar.getInstance();
                c.setTime(rs.getDate(7));
                dto.setNacimiento(c);
                dto.setTamanio(rs.getString(8));
                dto.setColor(rs.getString(9));
                dto.setPelo(rs.getString(10));
                dto.setNotas(rs.getString(11));
                dtos.add(dto);
            }
            stmt.close();
            rs.close();
            conn.close();
        }
        return dtos;
    }
  
}
