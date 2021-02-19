package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AbstractDao implements GenericDao {

    static final String url = "jdbc:mysql://127.0.0.1:3306/demo";
    static final String user = "root";
    static final String password = "123123";

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }



}
