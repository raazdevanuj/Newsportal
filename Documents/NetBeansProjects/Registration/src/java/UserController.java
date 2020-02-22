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
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UserController extends HttpServlet {

 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String op = request.getParameter("op");
        
        if (op!=null && op.equalsIgnoreCase("delete")){
            Connection con =null;
            PreparedStatement smt=null;
            int id = Integer.parseInt(request.getParameter("id"));
            
              try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            String sql = "delete from user where id=?";
            smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select

            int n = smt.executeUpdate();
            
            smt.close();
            con.close();
            if (n>0)
                 response.sendRedirect("view.jsp");
                //out.println("Data Inserted to table ...");
               
            
        }
       catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
        } 

    }
         if(op!=null && op.equalsIgnoreCase("varify")){
             String userid=request.getParameter("userid");
             if(userid==null || userid.equals("") ){
                 out.println("<b> please fillout the userid</b>");
                 return;
         }
              Connection con =null;
            PreparedStatement smt=null;
           try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            String sql = "select * from user where userId=?";
            smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select
            ResultSet rs = smt.executeQuery();
            if(rs.next()){
                out.println("<font color='red' size='4' face='corbel'>Sorry! this userid is not available</font>");
            }
            else{
                out.println("<font color='blue' size='4' face='corbel'> Congrats! this userid is available!</font>");
            }
            smt.close();
            con.close();
             
            
        }catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
        
        } 
         }
 }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        
        PrintWriter out=response.getWriter();
       response.setContentType("text/html");
       String op=request.getParameter("op");
       if(op!=null &&op.equalsIgnoreCase("Add")){
       String name=request.getParameter("name");
        String fname=request.getParameter("fname");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String hobbies[]=request.getParameterValues("hobbies");
         String userid=request.getParameter("userid");
          String password=request.getParameter("password");
         String hbs="";
      //   out.println("<h1>Welcome "+name+"</h1>");
       // out.println("<hr>Name :"+name+"</br> Fname"+fname+"</br> dob :"+dob+"</br> gender :"+gender);
        for(String s:hobbies){
            out.println("</br>hobbies :"+s);
             hbs +=  s + ",";
        }
        hbs=hbs.substring(0,hbs.length()-1);
        /*
      Enumeration form=request.getParameterNames();
      while(form.hasMoreElements()){
          String name=(String) form.nextElement();
          String value[]=request.getParameterValues(name);
          out.println(name+":");
          for(String s:value)
          {
              out.println(s+"</br>");
          }
      }*/
        
        
        //JDBC Code
        Connection con=null;
        PreparedStatement smt=null;
        try
        {
            
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            String sql = "Insert into user(name,fname,gender,dob,hobbies,userId,password) values(?,?,?,?,?,?,?)";
            smt = con.prepareStatement(sql);
           smt.setString(1,name);
           smt.setString(2, fname);
           smt.setString(3, gender);
           smt.setString(4, dob);
           smt.setString(5,hbs);
           smt.setString(6,userid);
           smt.setString(7,password);
           int n=smt.executeUpdate();
           smt.close(); con.close();
          if(n>0)
              response.sendRedirect("view.jsp");
              //out.println("\nData inserted into table");
          else
              out.println("\nData not inserted");
        }
        catch(Exception e)
        {
            System.out.println("Error "+e.getMessage());
        }
    }

  

     if (op!=null && op.equalsIgnoreCase("update")){
        int id = Integer.parseInt(request.getParameter("id"));
        
        Connection con =null;
        PreparedStatement smt = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            String sql = "update user set name=?,fname=?,dob=?,gender=?,hobbies=? where id=?";
        String name = request.getParameter("name");
        String fname =request.getParameter("fname");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String hobbies[] = request.getParameterValues("hobbies");
        String hbs="";
        
        for (String h : hobbies)
               hbs +=  h + ",";
          hbs=hbs.substring(0,hbs.length()-1);
            
            
            smt = con.prepareStatement(sql);
            smt.setString(1, name);
            smt.setString(2, fname);
            smt.setString(3, dob);
            smt.setString(4, gender);
            smt.setString(5, hbs);
            smt.setInt(6, id);
            
            //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select

            int n = smt.executeUpdate();
            
            smt.close();
            con.close();
            if (n>0)
                //out.println("Data Inserted to table ...");
                response.sendRedirect("view.jsp");
            
        }catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
        
        }
        
     }
    
    }
}
