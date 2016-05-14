/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao;

import co.edu.sena.veterinaria.modelo.dao.fabrica.Conexion;
import co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 * Clase de acceso a los datos de la tabla empleado.
 *
 * @author Alejandro Ramirez
 */
public class DAOEmpleado {

    private Connection conn;

    /**
     * Metodo que ejecuta la funcion inciarSesion de la base de datos y verifica
     * si las contraseñas coinciden.
     *
     * @param usuario Integer con el DNI del empleado.
     * @param contraseña String con la contraseña del empleado.
     * @return String con el tipo de empleado que ha iniciado sesion.
     * @throws Exception Si existe un error al conectar con la base de datos.
     */
    public String iniciarSesion(long usuario, String contraseña) throws Exception {
        String tipoEmpleado = "";
        conn = Conexion.generarConexion();
        CallableStatement stmt = conn.prepareCall("{?=call iniciarSesion(?, ?)}");
        stmt.registerOutParameter(1, Types.VARCHAR);
        stmt.setLong(2, usuario);
        stmt.setString(3, contraseña);
        stmt.execute();
        String rs = stmt.getString(1);
        if (rs != null && !rs.isEmpty()) {
            tipoEmpleado = rs;
        }
        stmt.close();
        conn.close();
        return tipoEmpleado;
    }

    /**
     * Metodo que ejecuta el procedimiento registrarEmpleado de la base de
     * datos.
     *
     * @param dto Objeto que tranfiere los datos del empleado.
     * @return True si el procedimiento se ejecuto normalmente.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarEmpleado(EmpleadoDTO dto) throws Exception {
        boolean exito = true;
        conn = Conexion.generarConexion();
        CallableStatement stmt = null;
        try {
            stmt = conn.prepareCall("{call registrarEmpleado"
                    + "(?, ?, ?, ?, ?, ?, ?, ?)}");
            stmt.setLong(1, dto.getDni());
            stmt.setString(2, dto.getTipo());
            stmt.setString(3, dto.getPass());
            stmt.setString(4, dto.getNombre());
            stmt.setString(5, dto.getApellido());
            stmt.setLong(6, dto.getTelefono());
            stmt.setString(7, dto.getEmail());
            stmt.setString(8, dto.getDireccion());
            stmt.execute();
        } catch (SQLException ex) {
            exito = false;
        } finally {
            stmt.close();
            conn.close();
        }
        return exito;
    }
    
    /**
     * Metodo que se conecta a la base de datos y registra los datos de los empleados.
     * @param informacion Contenido que debe cumplir la columna por la que se
     * busca a los empleados.
     * @param columna Nombre de la columna por la que se desea buscar a los
     * empleados (nom, dni o Todos).
     * @return ArrayList de EmpleadoDTO o null si ocurre una SQLException
     * @throws java.lang.Exception Exception originada por fallo en la conexion
     * o error al consultar los empleados.
     */
    public ArrayList<EmpleadoDTO> consultarClientes(String columna, String informacion) throws Exception {
        ArrayList<EmpleadoDTO> dtos = new ArrayList<>();
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
                    + "EmpTipo, EmpHabilitado "
                    + "FROM tblpersona, tblempleado WHERE PerDni "
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
                EmpleadoDTO dto = new EmpleadoDTO();
                dto.setDni(rs.getLong(1));
                dto.setNombre(rs.getString(2));
                dto.setApellido(rs.getString(3));
                dto.setTelefono(rs.getLong(4));
                dto.setEmail(rs.getString(5));
                dto.setDireccion(rs.getString(6));
                dto.setTipo(rs.getString(7));
                String habilitado = rs.getString(8);
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
     * Metodo que habilita o deshabilita el empleado según sea el caso.
     * @param dni DNI del empleado a modificar.
     * @param nuevoEstado Nuevo estado del empleado.
     * @return True si se modifico, false si no lo hizo.
     * @throws Exception Error al conectarse a la base de datos.
     */
    public boolean modificarEstadoEmpleado(long dni, boolean nuevoEstado) throws Exception {
        boolean exito;
        conn = Conexion.generarConexion();
        PreparedStatement stmt = conn.prepareStatement("UPDATE tblempleado SET "
                + "EmpHabilitado = ? WHERE DniPersona = ?");
        if(nuevoEstado)
            stmt.setString(1, "si");
        else
            stmt.setString(1, "no");
        stmt.setLong(2, dni);
        try {
        exito = stmt.executeUpdate() > 0;
        } catch (SQLException ex){
            exito = false;
        }finally {
            stmt.close();
            conn.close();
        }
        return exito;
    }
    
}
