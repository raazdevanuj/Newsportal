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
import java.util.ArrayList;
import org.apache.commons.lang.*;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import  org.apache.commons.lang.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
           boolean isMultipart=ServletFileUpload.isMultipartContent(request);
           String name="",fname="",dob="",gender="",userid="",password="";
           String hobbies[]=null,photo="",imagepath="",hbs="",encoded="";
          List<String> checkboxlist = new ArrayList();
           if(!isMultipart){
         name =StringEscapeUtils.escapeHtml(request.getParameter("name"));
         fname =StringEscapeUtils.escapeHtml(request.getParameter("fname"));
         dob=request.getParameter("dob");
         gender=request.getParameter("gender");
         hobbies=request.getParameterValues("hobbies");
         userid=request.getParameter("userid");
         password=request.getParameter("password");
         hbs="";
      //   out.println("<h1>Welcome "+name+"</h1>");
       // out.println("<hr>Name :"+name+"</br> Fname"+fname+"</br> dob :"+dob+"</br> gender :"+gender);
        for(String s:hobbies){
          //  out.println("</br>hobbies :"+s);
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
        
           }
           else{
              FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.getMessage();
                } 
           
        //JDBC Code
        Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("name"))  
                            name = fieldValue;
                        else if (fieldName.equals("fname"))  
                            fname = fieldValue;
                         else if (fieldName.equals("dob"))  
                            dob = fieldValue;
                       
                        else if(fieldName.equals("userid")) 
                            userid = fieldValue;
                        else if (fieldName.equals("password"))
                            password = fieldValue;
                        else if(fieldName.equals("gender"))
                            gender=fieldValue;
                        else if (fieldName.equals("hobbies"))
                            checkboxlist.add(fieldValue);
                        
                    } else {
                        try {
                            photo = item.getName();
                            System.out.println(photo);
                            imagepath = "media/user/" + photo ;
                            File savedFile = new File(getServletContext().getRealPath("/") + imagepath);
                            item.write(savedFile);
                        } catch (Exception e) {
                            out.println("Error  " + e.getMessage());
                        }
                    }
                    
                    hbs="";
                    for(String s : checkboxlist)
                        hbs += s +",";
                }
            }

                //=============================================//
               

                //JDBC Code 
                Connection con = null;
                PreparedStatement smt = null;
                encoded = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "root");
                    String sql = "Insert into user(name,fname,dob,gender,hobbies,userid,password,photo) values(?,?,?,?,?,?,?,?)";
                    smt = con.prepareStatement(sql);
                    smt.setString(1, name);
                    smt.setString(2, fname);
                    smt.setString(3, dob);
                    smt.setString(4, gender);
                    smt.setString(5, hbs);
                    smt.setString(6, userid);
                    smt.setString(7, encoded);
                    smt.setString(8, imagepath);
                    //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select

                    int n = smt.executeUpdate();

                    smt.close();
                    con.close();
                    if (n > 0) //out.println("Data Inserted to table ...");
                    {
                        response.sendRedirect("view.jsp");
                    }

                } catch (Exception e) {
                    System.out.println("Error : + " + e.getMessage());
                    if (e.getMessage().contains("Duplicate")) {
                        out.println("<font color='red' size='5' face='corbel'> the Userid you entered is not available</font>");
                        out.println("<hr/>");
                        RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                        rd.include(request, response);
                    }

                }
            }

  

     if (op!=null && op.equalsIgnoreCase("update")){
          boolean isMultipart=ServletFileUpload.isMultipartContent(request);
         String name="",fname="",dob="",gender=""; int id=0,flag=0;
          String hobbies[]=null,photo="",imagepath="",hbs="",ph="";
           List<String> checkboxlist = new ArrayList();
           if(!isMultipart){
      
               name = request.getParameter("name");
        fname =request.getParameter("fname");
        dob = request.getParameter("dob");
        gender = request.getParameter("gender");
        hobbies = request.getParameterValues("hobbies");
         hbs="";
        
           }
           else
           {
               FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.getMessage();
                } 
           
        //JDBC Code
        Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("name"))  
                            name = fieldValue;
                        else if (fieldName.equals("fname"))  
                            fname = fieldValue;
                         else if (fieldName.equals("dob"))  
                            dob = fieldValue;                   
                        else if(fieldName.equals("gender"))
                            gender=fieldValue;
                        else if (fieldName.equals("hobbies"))
                            checkboxlist.add(fieldValue);
                        
                    } else {
                        try {
                            photo = item.getName();
                               if(photo=="")
                                   flag=1;
                           
                            imagepath = "media/user/" + photo ;
                            File savedFile = new File(getServletContext().getRealPath("/") + imagepath);
                            item.write(savedFile);
                        } catch (Exception e) {
                            out.println("Error  " + e.getMessage());
                        }
                    }
                    
                    hbs="";
                    for(String s : checkboxlist)
                        hbs += s +",";
                } 
           }
             id = Integer.parseInt(request.getParameter("id"));
           System.out.println(flag);
            Connection con =null;
        PreparedStatement smt = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            if(flag==1)
            {
             String sql = "update user set name=?,fname=?,dob=?,gender=?,hobbies=? where id=?";

            smt = con.prepareStatement(sql);
            smt.setString(1, name);
            smt.setString(2, fname);
            smt.setString(3, dob);
            smt.setString(4, gender);
            smt.setString(5, hbs);
            smt.setInt(6, id);
            }
            else{
           String sql = "update user set name=?,fname=?,dob=?,gender=?,hobbies=?,photo=? where id=?";

            smt = con.prepareStatement(sql);
            smt.setString(1, name);
            smt.setString(2, fname);
            smt.setString(3, dob);
            smt.setString(4, gender);
            smt.setString(5, hbs);
            smt.setString(6,imagepath);
            smt.setInt(7, id);
            }
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
    
     if(op!=null && op.equalsIgnoreCase("login")){
         String userid=request.getParameter("userid");
         String password=request.getParameter("password");
         Connection con=null;
         PreparedStatement smt=null;
         String encodedpas= Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
          try
            {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
                String sql="select * from user where userId=? and password=?";
                smt=con.prepareStatement(sql);
                smt.setString(1,userid);
                smt.setString(2,encodedpas);
                ResultSet rs= smt.executeQuery();
                if(rs.next()){
                    response.sendRedirect("welcome.jsp?name="+rs.getString("name"));
                }
                else
                {
                    response.sendRedirect("login.jsp?msg=Invaild Userid or Password");
                   con.close();
                   smt.close();
                }
            }
          catch(Exception e)
          {
              System.out.println("Error"+e.getMessage());
          }
    }
     
    }
}
