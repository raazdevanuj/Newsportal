/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
/**
 *
 * @author Abhishek Kumar
 */
public class controller1 extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
       response.setContentType("text/html");
       String subject= request.getParameter("sub");
       String course[]= request.getParameterValues("course");
        Connection con=null;
        PreparedStatement smt=null,smt1=null,smt2=null;int n = 0;
        try
        {
            
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
          String sql = "Insert into subject(subject) values(?)";
          smt = con.prepareStatement(sql);
           smt.setString(1,subject);
           smt.executeUpdate();
    
           String sql1="SELECT sub_id FROM subject where subject=?";
            smt1 = con.prepareStatement(sql1);
                smt1.setString(1,subject);
                     ResultSet rs = smt1.executeQuery();
                     rs.next();
                     int k=rs.getInt(1);         
         for(String s:course)
         {
             smt2=null;
             int z=Integer.parseInt(s);
             String sql2="insert into csr(sub_id,cour_id) values(?,?)";
             smt2=con.prepareStatement(sql2);
             smt2.setInt(1, k);
             smt2.setInt(2, z);
             n=smt2.executeUpdate();
         }

           con.close();
          if(k>0)
              out.println("\nData inserted into table");
          else
              out.println("\nData not inserted");
        }
        catch(Exception e)
        {
            System.out.println("Error "+e.getMessage());
        }
    }

  

}
