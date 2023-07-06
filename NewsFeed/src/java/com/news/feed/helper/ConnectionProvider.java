
package com.news.feed.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection()
    {
        try{
            if(con==null){
        // Initialize all the information regarding
        // Database Connection
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql:// localhost:3306/";
        // Database name to access
        String dbName = "newsfeed";
        String dbUsername = "root";
        String dbPassword = "root";
  
        Class.forName(dbDriver);
        con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUsername, 
                                                     dbPassword);
            }
        }
        catch(Exception e){
        e.printStackTrace();
        }
        return con;
    }
    
}
