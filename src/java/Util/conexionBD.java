package Util;

import java.sql.*;

public class conexionBD {

    public static Connection getConexionBD() {

        Connection cn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost/trekentrepatas2", "root", "");
            System.out.println("Se Conecto !!!!");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No Se Conecto !!!!");
        }
        return cn;

    }

    public static void main(String[] args) {
        getConexionBD();
    }
}
