/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

import java.io.Serializable;

/**
 * Clase que sirve para transferir los datos de un cliente.
 * @author Alejandro Ramírez
 */
public class ClienteDTO extends PersonaDTO implements Serializable{
    
    private long celular;

    /**
     * 
     * @param celular Numero de celular del cliente.
     * Constructor de la clase que recibe los parametros de la persona y el empleado.
     * @param nombre Nombre de la persona.
     * @param apellido Apellido de la persona.
     * @param email Correo electronico de la persona.
     * @param direccion Direccion de residencia de la persona.
     * @param dni Documento nacional de identificacion de la persona.
     * @param telefono Numero telefonico de la persona. 
     */
    public ClienteDTO(long celular, String nombre, String apellido, String email, 
            String direccion, long dni, long telefono) {
        super(nombre, apellido, email, direccion, dni, telefono);
        this.celular = celular;
    }

    /**
     * Constructor vacio del cliente.
     */
    public ClienteDTO(){}
    
    /**
     * Metodo que obtiene el numero de celular del cliente.
     * @return Long con el numero de celular del cliente.
     */
    public long getCelular() {
        return celular;
    }

    /**
     * Metodo que establece el numero de celular del cliente.
     * @param celular Long con el numero de celular del cliente.
     */
    public void setCelular(long celular) {
        this.celular = celular;
    }
    
}
