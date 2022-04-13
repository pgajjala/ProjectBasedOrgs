import java.io.FileReader;
import java.sql.*;
import java.util.*;
// import java.io.*;
// import org.apache.ibatis.jdbc.ScriptRunner;
public class MySQL_JDBC {

   static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/?user=projectbasedorgs";
   static final String USER = "projectbasedorgs";
   static final String PASS = "Pass!23";

   public static void main(String[] args) {
      // Open a connection
      try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         Statement stmt = conn.createStatement();
      ) {		      
         String sql = "CREATE DATABASE STUDENTS";
         stmt.executeUpdate(sql);
         System.out.println("Database created successfully...");   	  
      } catch (SQLException e) {
         e.printStackTrace();
      } 
   }
}