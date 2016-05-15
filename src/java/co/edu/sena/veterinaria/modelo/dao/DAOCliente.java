/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao;

import co.edu.sena.veterinaria.modelo.dao.fabrica.Conexion;
import co.edu.sena.veterinaria.modelo.dto.ClienteDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Clase de acceso a los datos de la tabla empleado.
 * @author Alejandro Ramirez
 */
public class DAOCliente {
    
    private Connection conn;
    
    /**
     * Constructor de la case.
     */
    public DAOCliente() {}
    
    /**
     * Metodo que ejecuta el procedimiento registrarCliente de la base de
     * datos.
     *
     * @param dto Objeto que tranfiere los datos del cliente.
     * @return True si el procedimiento se ejecuto normalmente.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarCliente(ClienteDTO dto) throws Exception {
        boolean exito = true;
        conn = Conexion.generarConexion();
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call registrarCliente"
                    + "(?, ?, ?, ?, ?, ?, ?)}");
            stmt.setLong(1, dto.getDni());
            stmt.setString(2, dto.getNombre());
            stmt.setString(3, dto.getApellido());
            stmt.setLong(4, dto.getTelefono());
            stmt.setString(5, dto.getDireccion());
            stmt.setString(6, dto.getEmail());
            stmt.setString(7, dto.getCelular() + "");
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
     * Metodo que se conecta a la base de datos y registra los datos de los clientes.
     * @param informacion Contenido que debe cumplir la columna por la que se
     * busca a los clientes.
     * @param columna Nombre de la columna por la que se desea buscar a los
     * clientes (nom, dni o Todos).
     * @return ArrayList de ClienteDTO o null si ocurre una SQLException
     * @throws java.lang.Exception Exception originada por fallo en la conexion
     * o error al consultar los cliente.
     */
    public ArrayList<ClienteDTO> consultarClientes(String columna, String informacion) throws Exception {
        ArrayList<ClienteDTO> dtos = new ArrayList<>();
        conn = Conexion.generarConexion();
        String sql = "";
        if (columna.equals("nom")) 
            sql = " AND CONCAT(PerNombres, ' ', PerApellidos) LIKE ? OR "
                    + "CONCAT(PerNombres, ' ', PerApellidos) LIKE ? OR "
                    + "CONCAT(PerNombres, ' ', PerApellidos) LIKE ? OR "
                    + "CONCAT(PerNombres, ' ', PerApellidos) LIKE ?";
        else if (columna.equals("dni"))
            sql = " AND DniPersona = ? ";
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("SELECT tblpersona.*, "
                    + "CLCelular "
                    + "FROM tblpersona, tblcliente WHERE PerDni "
                    + "= DniPersona" + sql);
            if (columna.equals("dni")) {
                stmt.setString(1, informacion);
            } else if (columna.equals("nom")) {
                stmt.setString(1, informacion);
                stmt.setString(2, "%" + informacion);
                stmt.setString(3, informacion + "%");
                stmt.setString(4, "%" + informacion + "%");
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ClienteDTO dto = new ClienteDTO();
                dto.setDni(rs.getLong(1));
                dto.setNombre(rs.getString(2));
                dto.setApellido(rs.getString(3));
                dto.setTelefono(rs.getLong(4));
                dto.setEmail(rs.getString(5));
                dto.setDireccion(rs.getString(6));
                dto.setCelular(rs.getLong(7));
                dtos.add(dto);
            }
            stmt.close();
            rs.close();
            conn.close();
        }
        return dtos;
    }
    
    /**
     * Metodo que actualiza los datos de un cliente en la base de
     * datos.
     * @param dto Objeto que tranfiere los datos del cliente.
     * @return True si se actualizo el cliente.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean actualizarCliente(ClienteDTO dto) throws Exception{
        boolean exito;
        conn = Conexion.generarConexion();
        PreparedStatement stmt = conn.prepareStatement("UPDATE tblpersona SET PerNombres = ?,"
                + " PerApellidos = ?, PerTelefono = ?, PerDireccion = ?, PerEmail = ? WHERE "
                + "PerDni = ?");
        stmt.setString(1, dto.getNombre());
        stmt.setString(2, dto.getApellido());
        stmt.setLong(3, dto.getTelefono());
        stmt.setString(4, dto.getDireccion());
        stmt.setString(5, dto.getEmail());
        stmt.setLong(6, dto.getDni());
        exito = stmt.executeUpdate() > 0;
        if(exito) {
            stmt = conn.prepareStatement("UPDATE tblcliente SET CLCelular = ?" +
                    " WHERE DniPersona = ?");
            stmt.setString(1, dto.getCelular() + "");
            stmt.setLong(2, dto.getDni());
            exito = stmt.executeUpdate() > 0;
        }
        if(stmt != null && conn != null){
                stmt.close();
                conn.close();
        }
        return exito;
    }
    
}
