/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

/**
 * Clase que sirve para transferir los datos de un empleado al DAOEmpleado.
 * @author Alejandro Ramirez
 */
public class EmpleadoDTO extends PersonaDTO{
    
    private String tipo, pass;
    private boolean habilitado;

    /**
     * Constructor de la clase que recibe los parametros de la persona y el empleado.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona.
     * @param telefono Numero telefonico de la persona.
     * @param tipo Tipo de empleado.
     * @param pass Contraseña de acceso al sistema.
     */
    public EmpleadoDTO(String nombre, String apellido, String email, String direccion,
            long dni, long telefono, String tipo, String pass) {
        super(nombre, apellido, email, direccion, dni, telefono);
        this.tipo = tipo;
        this.pass = pass;
        this.habilitado = true;
    }

    /**
     * Constructor vacio.
     */
    public EmpleadoDTO() {
    }
    
    /**
     * Metodo que obtiene el tipo de empleado.
     * @return String con el tipo de empleado.
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * Metodo que establece el tipo de empleado
     * @param tipo Boolean con el nuevo tipo de empleado.
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * Metodo que obtiene la contraseña de acceso al sistema de empleado.
     * @return String con la contraseña de acceso al sistema del empleado.
     */
    public String getPass() {
        return pass;
    }

    /**
     * Metodo que establece la cotraseña de acceso al sistema del empleado
     * @param pass String con la nueva contraseña del empleado.
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * Metodo que obtiene el estado del empleado.
     * @return True si el empleado esta habilitado para ingresar al sistema, false si no lo esta.
     */
    public boolean isHabilitado() {
        return habilitado;
    }

    /**
     * Metodo que establece el estado del empleado
     * @param habilitado Boolean con el nuevo estado del empleado.
     */
    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }
    
}
