import java.io.*;
import java.sql.*;
import java.util.*;
import java.lang.*;
import org.apache.ibatis.jdbc.ScriptRunner;
public class MySQL_JDBC {

   static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/";
   static final String USER = "projectbasedorgs";
   static final String PASS = "Pass!23";

   /**
    * stuff to do that prarthana doesn't wanna deal with right now:
    *  - better exception management
    * @param args
    * @throws Exception
    */
   public static void main(String[] args) throws Exception{
      // Open a connection
      try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         Statement stmt = conn.createStatement();
      ) {		      
         ScriptRunner sr = new ScriptRunner(conn);
         Reader reader = new BufferedReader(new FileReader("backend/sql_files/tables.sql"));
         sr.runScript(reader);
         System.out.println("Executed successfully");   	  
      } catch (SQLException e) {
         e.printStackTrace();
      } 
   }
}