/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.sena.veterinaria.modelo.dao.fabrica;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Clase que sirve para crear conexiones a la base de datos.
 * @author Alejandro Ramirez
 */
public class Conexion {
    
    private static final String DRIVER = "org.gjt.mm.mysql.Driver";
    private static final String DATABASE_URL = "jdbc:mysql://localhost/vetsena";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    /**
     * Metodo que genera la conexion a la base de datos.
     * @return Connection a traves del cual se puede acceder a la base de datos.
     * @throws java.lang.Exception Exception originada por fallo en la conexion.
     */
    public static Connection generarConexion() throws Exception{
        Connection conexion;
        Class.forName(DRIVER).newInstance();
        conexion = DriverManager.getConnection(DATABASE_URL, USER, PASSWORD);
        return conexion;
    }
}
