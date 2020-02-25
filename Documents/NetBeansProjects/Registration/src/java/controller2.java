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
import java.sql.*;

/**
 *
 * @author Abhishek Kumar
 */
public class controller2 extends HttpServlet {

   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         String op=request.getParameter("op");
          if(op!=null && op.equalsIgnoreCase("course")){
         int cour_id = Integer.parseInt(request.getParameter("cour_id"));
          Connection con = null;
                            PreparedStatement smt = null;
                            try { 
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "root");
                                String sql = " select * from subject where sub_id in (select sub_id from csr where cour_id=?)";
                                smt = con.prepareStatement(sql);
                                smt.setInt(1, cour_id);
                                
                                ResultSet rs = smt.executeQuery();
                                String output = "<tr class=\"text-light bg-dark\"><td value='-1'>Subject </td></tr>";
                                while (rs.next()) { 
                                    output += "<tr><td value='"+rs.getString(1)+"'>"+ rs.getString(2) +"</td></tr>";
                                }
                               out.println(output); 
                                 
                                con.close();
                                smt.close();

                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
          }
          if(op!=null && op.equalsIgnoreCase("subject")){
         int sub = Integer.parseInt(request.getParameter("sub_id"));
          Connection con = null;
                            PreparedStatement smt = null;
                            try { 
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "root");
                                String sql = " select * from course where cour_id in (select cour_id from csr where sub_id=?)";
                                smt = con.prepareStatement(sql);
                                smt.setInt(1, sub);
                                
                                ResultSet rs = smt.executeQuery();
                                String output = "<tr class=\"text-light bg-dark\"><td value='-1'>Subject </td></tr>";
                                while (rs.next()) { 
                                    output += "<tr><td value='"+rs.getString(1)+"'>"+ rs.getString(2) +"</td></tr>";
                                }
                               out.println(output); 
                                 
                                con.close();
                                smt.close();

                            } catch (Exception e) {
                                System.out.println("Error " + e.getMessage());
                            }
          }
          

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


}
