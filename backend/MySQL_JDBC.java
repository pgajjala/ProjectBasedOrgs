
import java.io.*;
import java.sql.*;
import java.util.*;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
 
//import com.opencsv.CSVReader; //yelp i need to figure this out
 

import java.lang.*;
import org.apache.ibatis.jdbc.ScriptRunner;

public class MySQL_JDBC {

   static String DB_URL = "";
   static final String USER = "projectbasedorgs";
   static final String PASS = "Pass!23";

   /**
    * stuff to do that prarthana doesn't wanna deal with right now:
    * - better exception management
    * 
    * @param args
    * @throws Exception
    */
   public static void main(String[] args) throws Exception {

      Scanner fr = new Scanner(new File("untracked.txt"));
      DB_URL = fr.nextLine();
     
      /* Open a connection*/
      try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      // Statement stmt = conn.createStatement();
      ) {
        
         /* Creates db and corresponding tables */
         ScriptRunner sr = new ScriptRunner(conn);
         Reader reader = new BufferedReader(new FileReader("backend/sql_files/tables.sql"));
         sr.runScript(reader);
         
         /*Parsing CSV (fake data) files */
         // Reader reader2 = new BufferedReader(new FileReader("backend/sql_files/parsedData.sql"));
         // sr.runScript(reader2);

         /* Query imported and read, based on what user wants to do */
         Scanner s = new Scanner(System.in);
         boolean run_again = true;
         while (run_again) {
            String querynum = printMenu();
            if (querynum.equals("7")) {
               newData(conn);
            } else {
               Reader queryreader = new BufferedReader(new FileReader("backend/sql_files/query" + querynum + ".sql"));

               sr.runScript(queryreader);
               System.out.println("End of execution");
            }
            System.out.println("New query?");
            String ans = s.nextLine();
            if (ans.substring(0,1).toUpperCase().equals("N")){
               run_again = false;
            }
         }


         
           
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   /**
    * Basic sql choice menu. Query descriptions from https://docs.google.com/document/d/1ezfMru_FpZbThiMMhfQMDb9kNVDSo7UAWfs169EKnx8/edit?usp=sharing
    * @return String representing menu choice
    */
   public static String printMenu() {
      System.out.println("Please select your query");
      System.out.println("1. I want to start a project and I have this available technology at my school (List the name of projects, project contact, and the technology they use, sorting by technology)");
      System.out.println("2. I want to start a project for my club but I only have this amount of time or this amount of money (List the name of projects and their time intervals and budget for all clubs)");
      System.out.println("3. My school doesn't have X technology, I want to know if neighboring schools have any and what organizations they use it for (List all of the universities and the technologies they use, sorting by official organization)");
      System.out.println("4. I want to start a project for my specific project based club, but I need inspiration and examples to know where to begin (List the name of all projects from a project based club, list the club name as well)");
      System.out.println("5. I am the president of my club and I would like to collaborate with other presidents from other universities (List names of all presidents from from all project based clubs, sort by project based clubs)");
      System.out.println("6. I would like to be able to travel and visit other projects nearby (List the names of all projects from all project based organizations, sort by state)");
      System.out.println("7. I would like to add data");
      Scanner s = new Scanner(System.in);
      String ans = s.nextLine();
      while (!ans.equals("1") && !ans.equals("2")&&!ans.equals("3")&& !ans.equals("4") && !ans.equals("5") && !ans.equals("6") && !ans.equals("7")){
         System.out.println("Inappropriate input, please try again!");
         ans = s.nextLine();
      }
      return ans;
   }

   /**
    * Menu for inserting new data. Can insert university, club, project, or technology.
    * @see newUni
    * @see newClub
    * @param conn sql connection
    */
   public static void newData(Connection conn) {
      System.out.println("What would you like to do?");
      System.out.println("1. Register a new university");
      System.out.println("2. Register a new club");
      System.out.println("3. Register a new project");
      System.out.println("4. Register a new technology for your project");
      Scanner s = new Scanner(System.in);
      String ans = s.nextLine();
      while (!ans.equals("1") && !ans.equals("2")&&!ans.equals("3")&& !ans.equals("4")){
         System.out.println("Inappropriate input, please try again!");
         ans = s.nextLine();
      }
      if (ans.equals("1")) {
         newUni(conn);
      } else if (ans.equals("2")) {
         newClub(conn);
      } else if (ans.equals("3")) {
         newProj(conn);
      } else if (ans.equals("4")) {
         newTech(conn);
      }
   }

   /**
    * Inserts a new university, based on user input. 
    * @param conn sql connection
    */
   public static void newUni(Connection conn) {
      Scanner s = new Scanner(System.in);
      System.out.println("University name?");
      String uniname = s.nextLine();
      while(uniname.equals(null) || uniname.equals("")) {
         System.out.println("Inappropriate input, please try again!");
         uniname = s.nextLine();
      }
      System.out.println("University city?");
      String city = s.nextLine();
      System.out.println("University state?");
      String state = s.nextLine();
      System.out.println("University website?");
      String website = s.nextLine();

      try (Statement stmt = conn.createStatement()){
         String sql = "INSERT INTO project_based_orgs.university VALUES ('" + uniname + "', '" + city + "', '" + state + "', '" + website+ "')";
         stmt.executeUpdate(sql);
         System.out.println("Inserted records into tables. ");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   /**
    * Inserts a new club, affiliated with a specific university. If that university does not exist, prints an exception
    * Specifically, inserts both into project_based_orgs.project_based_club table and project_based_orgs.registered table, 
    * as appropriate.
    * If there is an error in inserting (eg: no such corrosponding uni), then whatever insertion has worked up to error 
    * deleted. 
    * TODO: Better exception management?
    * @param conn sql connection
    */
   public static void newClub(Connection conn) {
      Scanner s = new Scanner(System.in);
      System.out.println("Club name?");
      String clubname = s.nextLine();
      while(clubname.equals(null) || clubname.equals("")) {
         System.out.println("Inappropriate input, please try again!");
         clubname = s.nextLine();
      }
      System.out.println("President name?");
      String presName = s.nextLine();
      System.out.println("Advisor name?");
      String advisorName = s.nextLine();
      System.out.println("Contact email?");
      String contactEmail = s.nextLine();
      System.out.println("University name?");
      String uniName = s.nextLine();
      try(Statement stmt = conn.createStatement()){
         String sql1 = "INSERT INTO project_based_orgs.project_based_club VALUES ('" + clubname + "', '" + presName + "', '" + advisorName + "', '" + contactEmail + "')";
         stmt.executeUpdate(sql1);
         String sql2 = "INSERT INTO project_based_orgs.registered VALUES ('" + uniName + "', '" + clubname + "')";
         stmt.executeUpdate(sql2);
         System.out.println("Inserted records into tables. ");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         try (Statement stmt = conn.createStatement()) {
            String sql1 = "DELETE FROM project_based_orgs.project_based_club WHERE club_name = '" + clubname + "'";
            stmt.executeUpdate(sql1);
            String sql2 = "DELETE FROM project_based_orgs.registered WHERE club_name = '" + clubname + "' AND university_name = '" + uniName + "'";
            stmt.executeUpdate(sql2);
         } catch (SQLException e1) {
            //TODO: handle exception
         }
      }      
   }

   /**
    * Inserts a new project, affiliated with a specific club. If that club does not exist, prints an exception
    * Specifically, inserts both into project_based_orgs.project table and project_based_orgs.works_on table, 
    * as appropriate.
    * If there is an error in inserting (eg: no such corrosponding club), then whatever insertion has worked up to error 
    * deleted. 
    * TODO: Better exception management?
    * @param conn sql connection
    */
   public static void newProj(Connection conn) {
      Scanner s = new Scanner(System.in);
      System.out.println("Project title?");
      String projtitle = s.nextLine();
      while(projtitle.equals(null) || projtitle.equals("")) {
         System.out.println("Inappropriate input, please try again!");
         projtitle = s.nextLine();
      }
      System.out.println("Project contact?");
      String projContact = s.nextLine();
      System.out.println("Project description?");
      String projDesc = s.nextLine();
      System.out.println("Budget?");
      String budget = s.nextLine();
      System.out.println("Time interval?");
      String timeInterval = s.nextLine();
      System.out.println("Club name?");
      String clubname = s.nextLine();
      try(Statement stmt = conn.createStatement()){
         String sql1 = "INSERT INTO project_based_orgs.project (project_contact, project_description, budget, time_interval, project_title) VALUES ('" + projContact + "', '" + projDesc+ "', '" + budget + "', '" + timeInterval + "', '" + projtitle + "')";
         stmt.executeUpdate(sql1);
         String sql2 = "INSERT INTO project_based_orgs.works_on VALUES ('" + projtitle + "', '" + clubname + "')";
         stmt.executeUpdate(sql2);
         System.out.println("Inserted records into tables. ");
      } catch (SQLException e) {
         e.printStackTrace();
         try (Statement stmt = conn.createStatement()) {
            String sql1 = "DELETE FROM project_based_orgs.project WHERE project_title = '" + projtitle + "'";
            stmt.executeUpdate(sql1);
            String sql2 = "DELETE FROM project_based_orgs.works_on WHERE project_title = '" + projtitle + "' AND club_name = '" + clubname + "'";
            stmt.executeUpdate(sql2);
         } catch (SQLException e1) {
            //TODO: handle exception
         }
      }      
   }


   /**
    * Inserts a new technology, affiliated with a specific project. If that project does not exist, prints an exception
    * Specifically, inserts both into project_based_orgs.technology table and project_based_orgs.utilzes table, 
    * as appropriate.
    * If there is an error in inserting (eg: no such corrosponding project), then whatever insertion has worked up to error 
    * deleted. 
    * TODO: Better exception management?
    * @param conn sql connection
    */
   public static void newTech(Connection conn) {
      Scanner s = new Scanner(System.in);
      System.out.println("Technology name?");
      String techname = s.nextLine();
      while(techname.equals(null) || techname.equals("")) {
         System.out.println("Inappropriate input, please try again!");
         techname = s.nextLine();
      }
      System.out.println("Project title?");
      String projName = s.nextLine();
      try(Statement stmt = conn.createStatement()){
         String sql1 = "INSERT INTO project_based_orgs.technology VALUES ('" + techname + "')";
         stmt.executeUpdate(sql1);
         String sql2 = "INSERT INTO project_based_orgs.utilizes VALUES ('" + projName + "', '" + techname + "')";
         stmt.executeUpdate(sql2);
         System.out.println("Inserted records into tables. ");
      } catch (SQLException e) {
         e.printStackTrace();
         try (Statement stmt = conn.createStatement()) {
            String sql1 = "DELETE FROM project_based_orgs.technology WHERE technology_name = '" + techname + "'";
            stmt.executeUpdate(sql1);
            String sql2 = "DELETE FROM project_based_orgs.utilizes WHERE project_title = '" + projName + "' AND technology_name = '" + techname + "'";
            stmt.executeUpdate(sql2);
         } catch (SQLException e1) {
            //TODO: handle exception
         }
      }      
   }
}