package dbpack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbManager {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public DbManager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String dbHost = System.getenv("DB_HOST") != null ? System.getenv("DB_HOST") : "localhost";
            String dbPort = System.getenv("DB_PORT") != null ? System.getenv("DB_PORT") : "3306";
            String dbName = System.getenv("DB_NAME") != null ? System.getenv("DB_NAME") : "fmidb";
            String dbUser = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "root";
            String dbPass = System.getenv("DB_PASS") != null ? System.getenv("DB_PASS") : "root123";

            String url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName + "?useSSL=true&requireSSL=false&allowPublicKeyRetrieval=true&characterEncoding=utf-8";
            con = DriverManager.getConnection(url, dbUser, dbPass);
            
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
    }

    public boolean insertUpdateDelete(String query) {
        try {
            ps = con.prepareStatement(query);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet select(String query) {
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}