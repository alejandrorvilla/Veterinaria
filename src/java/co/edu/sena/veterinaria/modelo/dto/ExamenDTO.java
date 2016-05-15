/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

import java.io.Serializable;

/**
 * Clase de transferencia de datos de un examen.
 * @author Alejandro Ramirez
 */
public class ExamenDTO implements Serializable{
    
    private int codigo;
    private String notas, nombre;

    /**
     * Constructor de la clase.
     * @param notas String con una descripcion del examen.
     * @param nombre String con el nombre del examen.
     */
    public ExamenDTO(String notas, String nombre) {
        this.notas = notas;
        this.nombre = nombre;
    }

    
    /**
     * Constructor de la clase.
     */
    public ExamenDTO() {
    }

    /**
     * Metodo que obtiene el codigo del examen.
     * @return Integer con el codigo del examen.
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * Metodo que establece el nombre del examen.
     * @param codigo Integer con el codigo del examen.
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * Metodo que obtiene las notas del examen.
     * @return String con las notas del examen.
     */
    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    /**
     * Metodo que obtiene el nombre del examen.
     * @return String con el nombre del examen.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que establece el nombre.
     * @param nombre String con el nombre.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
}
