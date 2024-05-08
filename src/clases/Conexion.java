/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pc1
 */
public class Conexion {
     private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/ventas";
    private static final String USER = "root";
    private static final String PWD = "";

    static {
        try {
            Class.forName(CONTROLADOR);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el controlador");
        }
    }

    public Connection Conectar() {
        Connection cnx = null;

        try {
            cnx = DriverManager.getConnection(URL, USER, PWD);
            //System.out.println("Conexion exitosa");
        } catch (SQLException e) {
            //System.out.println("Error en la conexion");
        }
        return cnx;
    }
    public static void main(String[] args) {
        Conexion conexion =new Conexion();
        conexion.Conectar();
    }
    
}
