/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

import java.io.Serializable;

/**
 * Clase que sirve para transferir los datos de un empleado al DAOEmpleado.
 * @author Alejandro Ramírez
 */
public class ServicioDTO implements Serializable{
    
    private int codigo;
    private String nombre, caracter, notas;
    private boolean habilitado;
    
    /**
     * Constructor vacio.
     */
    public ServicioDTO(){}

    /**
     * Constructor de la clase.
     * @param nombre String con el nombre del servicio.
     * @param caracter String con el caracter o grupo del servicio
     * @param notas String con notas, instrucciones y/o apuntes sobre el servicio.
     */
    public ServicioDTO(String nombre, String caracter, String notas) {
        this.nombre = nombre;
        this.caracter = caracter;
        this.notas = notas;
        this.habilitado = true;
    }

    /**
     * Metodo que obtiene el codigo del servicio.
     * @return Integer con el codigo del servicio.
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * Metodo que establece el codigo del servicio.
     * @param codigo Integer con el codigo del servicio.
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * Metodo que obtiene el nombre del servicio.
     * @return String con el nombre del serivicio.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que establece el nombre del servicio.
     * @param nombre String con el nombre del servicio.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo que obtiene el caracter o grupo del servicio.
     * @return String con el caracter o grupo del serivicio.
     */
    public String getCaracter() {
        return caracter;
    }

    /**
     * Metodo que establece el caracter o grupo del servicio.
     * @param caracter String con el caracter o grupo del servicio.
     */
    public void setCaracter(String caracter) {
        this.caracter = caracter;
    }

    /**
     * Metodo que obtiene las notas, instrucciones o apuntes del servicio.
     * @return String con el nombre del serivicio.
     */
    public String getNotas() {
        return notas;
    }

    /**
     * Metodo que establece las notas, instrucciones o apuntes del servicio.
     * @param notas String con las notas, instrucciones o apuntes del servicio.
     */
    public void setNotas(String notas) {
        this.notas = notas;
    }

    /**
     * Metodo que obtiene el estado del servicio.
     * @return True si esta habilitado, false si no lo esta.
     */
    public boolean isHabilitado() {
        return habilitado;
    }

    /**
     * Metodo que establece el estado del servicio.
     * @param habilitado True si se va habilitar el servicio, false si no.
     */
    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }
    
}
