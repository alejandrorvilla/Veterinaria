/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

import java.io.Serializable;

/**
 * Clase padre de empleado y cliente.
 * @author Alejandro Ramirez
 */
public class PersonaDTO implements Serializable{
    
    private String nombre, apellido, email, direccion;
    private long dni, telefono;

    /**
     * Constructo que recibe todos los atributos del objeto.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona.
     * @param telefono Numero telefonico de la persona.
     */
    public PersonaDTO(String nombre, String apellido, String email, String direccion,
            long dni, long telefono) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.direccion = direccion;
        this.dni = dni;
        this.telefono = telefono;
    }

    /**
     * Constructor vacio.
     */
    public PersonaDTO() {
    }

    /**
     * Metodo que obtiene el nombre de la persona.
     * @return String con el nombre de la persona. 
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que establece el nombre de la persona.
     * @param nombre Long con el nuevo nombre de la persona.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo que obtiene el apellido de la persona.
     * @return String con el apellido de la persona. 
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Metodo que establece el apellido telefonico de la persona.
     * @param apellido Long con el nuevo apellido de la persona.
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * Metodo que obtiene el correo electronico de la persona.
     * @return String con el correo electronico de la persona. 
     */
    public String getEmail() {
        return email;
    }

    /**
     * Metodo que establece el correo electronico de la persona.
     * @param email Long con el nuevo correo electronico de la persona.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Metodo que obtiene la direccion de residencia de la persona.
     * @return String con la direccion de residencia de la persona. 
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * Metodo que establece la direccion de residencia de la persona.
     * @param direccion Long con la nueva direccion de residencia de la persona.
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    /**
     * Metodo que obtiene el documento nacional de identificacion de la persona.
     * @return Long con el documento nacional de identificacion de la persona. 
     */
    public long getDni() {
        return dni;
    }

    /**
     * Metodo que establece el numero telefonico de la persona.
     * @param dni Long con el nuevo documento nacional de identificacion de la persona.
     */
    public void setDni(long dni) {
        this.dni = dni;
    }

    /**
     * Metodo que obtiene el numero telefonico de la persona.
     * @return Long con el numero telefonico de la persona. 
     */
    public long getTelefono() {
        return telefono;
    }

    /**
     * Metodo que establece el numero telefonico de la persona.
     * @param telefono Long con el nuevo numero telefonico de la persona.
     */
    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }
            
}