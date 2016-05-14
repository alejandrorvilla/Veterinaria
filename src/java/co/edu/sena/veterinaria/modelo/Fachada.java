/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo;

import co.edu.sena.veterinaria.modelo.dao.DAOEmpleado;
import co.edu.sena.veterinaria.modelo.dao.DAOExamen;
import co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO;
import co.edu.sena.veterinaria.modelo.dto.ExamenDTO;
import co.edu.sena.veterinaria.modelo.seguridad.MD5;
import java.util.ArrayList;

/**
 * Clase fachada.
 * @author Alejandro Ramirez
 */
public class Fachada {
    
    /**
     * Metodo que llama al metodo iniciarSesion de DAOEmpleado.
     * @param usuario Integer con el DNI del empleado.
     * @param contraseña String con la contraseña del empleado.
     * @return String con el tipo de empleado que ha iniciado sesion.
     * @throws Exception Si existe un error al conectar con la base de datos. 
     */
    public String iniciarSesion(long usuario, String contraseña) throws Exception{
        DAOEmpleado dao = new DAOEmpleado();
        String pass = MD5.encriptar(contraseña);
        return dao.iniciarSesion(usuario, pass);
    }
    
    /**
     * Metodo que envia la peticion a DAOEmpleado para registrar un empleado.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona.
     * @param telefono Numero telefonico de la persona.
     * @param tipo Tipo de empleado.
     * @param pass Contraseña de acceso al sistema.
     * @return True si se registro el empleado, false si no se registro.
     * @throws Exception Si existe un error en la conexion a la base de datos.
     */
    public boolean registrarEmpleado(String nombre, String apellido, String email, 
            String direccion, long dni, long telefono, String tipo, String pass) throws Exception{
        String contraseña = MD5.encriptar(pass);
        System.out.println("pass: " + contraseña);
        DAOEmpleado dao = new DAOEmpleado();
        return dao.registrarEmpleado(new EmpleadoDTO(nombre, apellido, email, 
                direccion, dni, telefono, tipo, contraseña));
    }
    
    /**
     * Metodo que envia la peticion a DAOEmpleado para consultar los empleados.
     * @param columna Columna por la que se va a buscar (dni, nom o Todos);
     * @param info Informacion que debe cumplir la columna por la que se busca.
     * @return ArrayList de EmpleadoDTO.
     * @throws java.lang.Exception Si existe un error al conectarse a la base de datos.
     */
    public ArrayList<EmpleadoDTO> consultarEmpleado(String columna, String info) throws Exception{
        DAOEmpleado dao = new DAOEmpleado();
        return dao.consultarClientes(columna, info);
    }
    
    /**
     * Metodo que llama al DAOEmpleado para habilitar o deshabilitar al empleado según sea el caso.
     * @param dni DNI del empleado a modificar.
     * @param nuevoEstado Nuevo estado del empleado.
     * @return True si se modifico, false si no lo hizo.
     * @throws Exception Error al conectarse a la base de datos.
     */
    public boolean modificarEstadoEmpleado(long dni, boolean nuevoEstado) throws Exception {
        DAOEmpleado dao = new DAOEmpleado();
        return dao.modificarEstadoEmpleado(dni, nuevoEstado);
    }
    
    /**
     * Metodo que envia la peticion a DAOExamen para registrar un examen.
     * @param nombre Nombre del examen.
     * @param notas Descripcion del examen.
     * @return True si registra, false si no lo hace.
     * @throws Exception Error al conectarse a la base de datos.
     */
    public boolean registrarExamen(String nombre, String notas) throws Exception {
        DAOExamen dao = new DAOExamen();
        return dao.registrarExamen(new ExamenDTO(notas, nombre));
    }
    
    /**
     * Metodo que envia la peticion a DAOExamen y obtiene los examenes registrados.
     * @return ArrayList de ExamenDTO.
     * @throws Exception Si hay un error al conectarse con la base de datos.
     */
    public ArrayList<ExamenDTO> consultarExamenes() throws Exception {
        DAOExamen dao = new DAOExamen();
        return dao.consultarExamenes();
    }
}
