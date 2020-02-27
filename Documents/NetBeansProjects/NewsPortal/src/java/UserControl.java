/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;

/**
 *
 * @author Abhishek Kumar
 */
public class UserControl extends HttpServlet {

   
   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
         PrintWriter out=response.getWriter();
       response.setContentType("text/html");
       String op=request.getParameter("op");
       if(op!=null &&op.equalsIgnoreCase("Add")){
           boolean isMultipart=ServletFileUpload.isMultipartContent(request);
           String name="",email="",phone="",userid="",password="";
           String photo="",imagepath="",encoded="";
         
           if(!isMultipart){
         name =StringEscapeUtils.escapeHtml(request.getParameter("name"));
        
        email=request.getParameter("email");
         phone=request.getParameter("phone");
       
         userid=request.getParameter("userid");
         password=request.getParameter("password");
         
      //   out.println("<h1>Welcome "+name+"</h1>");
       // out.println("<hr>Name :"+name+"</br> Fname"+fname+"</br> dob :"+dob+"</br> gender :"+gender);
//        for(String s:hobbies){
//          //  out.println("</br>hobbies :"+s);
//             hbs +=  s + ",";
//        }
//        hbs=hbs.substring(0,hbs.length()-1);
//        /*
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
                        else if (fieldName.equals("email"))  
                            email = fieldValue;
                         else if (fieldName.equals("phone"))  
                            phone = fieldValue;
                        else if(fieldName.equals("userid")) 
                            userid = fieldValue;
                        else if (fieldName.equals("password"))
                            password = fieldValue;
                       
                        
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
                    
                   
                }
            }

                Connection con = null;
                PreparedStatement smt = null;
                encoded = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training", "root", "root");
                    String sql = "Insert into reporter (name,email,contact,userid,password,photo) values(?,?,?,?,?,?)";
                    smt = con.prepareStatement(sql);
                    smt.setString(1, name);
                    smt.setString(2, email);
                    smt.setString(3, phone);
                    smt.setString(4, userid);
                    smt.setString(5, encoded);
                    smt.setString(6, imagepath);
                    //execute the command : executeUpdate()-for insert,update and delete or executeQuery()-for select

                    int n = smt.executeUpdate();

                    smt.close();
                    con.close();
                    if (n > 0) 
                   // out.println("Data Inserted to table ...");
                    {
                        response.sendRedirect("login.jsp");
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
                String sql="select * from reporter where userid=? and password=?";
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
