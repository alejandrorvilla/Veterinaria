/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo;

import co.edu.sena.veterinaria.modelo.dao.DAOCliente;
import co.edu.sena.veterinaria.modelo.dao.DAOEmpleado;
import co.edu.sena.veterinaria.modelo.dao.DAOExamen;
import co.edu.sena.veterinaria.modelo.dao.DAOMascota;
import co.edu.sena.veterinaria.modelo.dao.DAOServicio;
import co.edu.sena.veterinaria.modelo.dto.ClienteDTO;
import co.edu.sena.veterinaria.modelo.dto.EmpleadoDTO;
import co.edu.sena.veterinaria.modelo.dto.ExamenDTO;
import co.edu.sena.veterinaria.modelo.dto.MascotaDTO;
import co.edu.sena.veterinaria.modelo.dto.ServicioDTO;
import co.edu.sena.veterinaria.modelo.seguridad.MD5;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;

/**
 * Clase fachada.
 * @author Alejandro Ramirez
 */
public class Fachada implements Serializable{
    
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
        return dao.consultarEmpleados(columna, info);
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
    
    /**
     * Metodo que envia la peticion a DAOCliente para registrar un cliente.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona.
     * @param telefono Numero telefonico de la persona.
     * @param celular Numero de celular del cliente.
     * @return True si se registro el cliente, false si no se registro.
     * @throws Exception Si existe un error en la conexion a la base de datos.
     */
    public boolean registrarCliente(String nombre, String apellido, String email, 
            String direccion, long dni, long telefono, long celular) throws Exception{
        ClienteDTO dto = new ClienteDTO(celular, nombre, apellido, email, direccion, dni, telefono);
        DAOCliente dao = new DAOCliente();
        return dao.registrarCliente(dto);
    }
    
    /**
     * Metodo que envia la peticion a DAOCliente para consultar los clientes.
     * @param columna Columna por la que se va a buscar (dni, nom o Todos);
     * @param info Informacion que debe cumplir la columna por la que se busca.
     * @return ArrayList de EmpleadoDTO.
     * @throws java.lang.Exception Si existe un error al conectarse a la base de datos.
     */
    public ArrayList<ClienteDTO> consultarClientes(String columna, String info) throws Exception{
        DAOCliente dao = new DAOCliente();
        return dao.consultarClientes(columna, info);
    }
    
    /**
     * Metodo que envia la peticion a DAOCliente para actualizar un cliente.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona que se va actualizar.
     * @param telefono Numero telefonico de la persona.
     * @param celular Numero de celular del cliente.
     * @return True si se actualizo el cliente, false si no se actualizo.
     * @throws Exception Si existe un error en la conexion a la base de datos.
     */
    public boolean actualizarCliente(String nombre, String apellido, String email, 
            String direccion, long dni, long telefono, long celular) throws Exception{
        ClienteDTO dto = new ClienteDTO(celular, nombre, apellido, email, direccion, dni, telefono);
        DAOCliente dao = new DAOCliente();
        return dao.actualizarCliente(dto);
    }
    
    /**
     * Metodo que envia la peticion a DAOServicio para registrar un servicio.
     * @param nombre String con el nombre del servicio.
     * @param caracter String con el caracter o grupo del servicio
     * @param notas String con notas, instrucciones y/o apuntes sobre el servicio.
     * @return True si se registro el servicio, false si no se registro.
     * @throws Exception Si existe un error en la conexion a la base de datos.
     */
    public boolean registrarServicio(String nombre, String notas, String caracter) throws Exception{
        DAOServicio dao = new DAOServicio();
        return dao.registrarServicio(new ServicioDTO(nombre, caracter, notas));
    }
    
    /**
     * Metodo que envia la peticion a DAOServicio para consultar los servicios.
     * @param columna Columna por la que se va a buscar (cod, nom o Todos);
     * @param info Informacion que debe cumplir la columna por la que se busca.
     * @return ArrayList de ServicioDTO.
     * @throws java.lang.Exception Si existe un error al conectarse a la base de datos.
     */
    public ArrayList<ServicioDTO> consultarServicios(String columna, String info) throws Exception{
        DAOServicio dao = new DAOServicio();
        return dao.consultarServicios(columna, info);
    }
    
    /**
     * Metodo que llama al DAOServicio para habilitar o deshabilitar al servicio según sea el caso.
     * @param cod Codigo del servicio a modificar.
     * @param nuevoEstado Nuevo estado del servicio.
     * @return True si se modifico, false si no lo hizo.
     * @throws Exception Error al conectarse a la base de datos.
     */
    public boolean modificarEstadoServicio(int cod, boolean nuevoEstado) throws Exception {
        DAOServicio dao = new DAOServicio();
        return dao.modificarEstadoServicio(cod, nuevoEstado);
    }
    
    /**
     * Metodo que envia la peticion de registro de una mascota a DAOMascota.
     * @param nombre Nombre de la mascota.
     * @param especie Especie de la mascota.
     * @param raza Raza de la mascota.
     * @param color Color de la mascota.
     * @param tamanio Tamanio de la mascota.
     * @param sexo Sexo de la mascota.
     * @param notas Notas sobre la mascota.
     * @param pelo Tamaño del pelo de la mascota.
     * @param nacimiento Fecha de nacimiento de la mascota.
     * @param dni DNI del cliente del dueño de la mascota.
     * @return True si el procedimiento se ejecuto normalmente.
     * @throws Exception Si existe un error al conectarse a la base de datos.
     */
    public boolean registrarMascota(String nombre, String especie, String raza, String color, 
            String tamanio, String sexo, String notas, String pelo, Calendar nacimiento, long dni) throws Exception{
        MascotaDTO dto = new MascotaDTO(nombre, especie, raza, color, tamanio, 
                sexo, notas, pelo, nacimiento);
        dto.getCliente().setDni(dni);
        DAOMascota dao = new DAOMascota();
        return dao.registrarMascota(dto);
    }
    
    /**
     * Metodo que consulta las mascotas de un cliente.
     * @param dni DNI del cliente dueño de las mascotas.
     * @return ArrayList de MascotaDTO
     * @throws Exception Si existe una exception al conectarse a la base de datos.
     */
    public ArrayList<MascotaDTO> consultarMascotas(Long dni) throws Exception{
        DAOMascota dao  = new DAOMascota();
        return dao.consultarMascotas(dni);
    }
    
}
