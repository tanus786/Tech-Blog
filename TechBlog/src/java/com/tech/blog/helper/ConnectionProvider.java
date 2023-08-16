package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://containers-us-west-85.railway.app:6796/railway", "root", "wE7aOifWJDLHOoXXIjNk");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
