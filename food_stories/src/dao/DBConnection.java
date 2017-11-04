package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection conn;
    public static Connection getConnection() {
        if (conn == null) {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            try {
                conn = DriverManager.getConnection(
                        "jdbc:postgresql://localhost:5432/food_stories",
                        "postgres",
                        "password"
                );
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

}