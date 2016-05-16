/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dto;

import java.io.Serializable;
import java.util.Calendar;

/**
 * Clase de transferencia de datos de un examen.
 * @author Alejandro Ramírez
 */
public class MascotaDTO implements Serializable {
    
    private int codigo;
    private String nombre, especie, raza, color, tamanio, sexo, notas, pelo;
    private Calendar nacimiento;
    private ClienteDTO cliente;

    /**
     * Constructor vacio.
     */
    public MascotaDTO() {
        cliente = new ClienteDTO();
    }

    /**
     * Constructor de la clase mascota.
     * @param nombre Nombre de la mascota.
     * @param especie Especie de la mascota.
     * @param raza Raza de la mascota.
     * @param color Color de la mascota.
     * @param tamanio Tamanio de la mascota.
     * @param sexo Sexo de la mascota.
     * @param notas Notas sobre la mascota.
     * @param pelo Tamaño del pelo de la mascota.
     * @param nacimiento Fecha de nacimiento de la mascota.
     */
    public MascotaDTO(String nombre, String especie, String raza, String color, 
            String tamanio, String sexo, String notas, String pelo, Calendar nacimiento) {
        this.nombre = nombre;
        this.especie = especie;
        this.raza = raza;
        this.color = color;
        this.tamanio = tamanio;
        this.sexo = sexo;
        this.notas = notas;
        this.pelo = pelo;
        this.nacimiento = nacimiento;
        cliente = new ClienteDTO();
    }

    public int getCodigo() {
        return codigo;
    }

    public String getFecha(){
        return String.format("%td/%tm/%tY", nacimiento, nacimiento, nacimiento);
    }
    
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTamanio() {
        return tamanio;
    }

    public void setTamanio(String tamanio) {
        this.tamanio = tamanio;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getPelo() {
        return pelo;
    }

    public void setPelo(String pelo) {
        this.pelo = pelo;
    }

    public Calendar getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(Calendar nacimiento) {
        this.nacimiento = nacimiento;
    }

    public ClienteDTO getCliente() {
        return cliente;
    }

    public void setCliente(ClienteDTO cliente) {
        this.cliente = cliente;
    }
    
}
