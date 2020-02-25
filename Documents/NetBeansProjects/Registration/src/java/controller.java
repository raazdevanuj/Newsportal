/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Abhishek Kumar
 */
public class controller extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  //      processRequest(request, response);
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         String op=request.getParameter("op");
          if(op!=null && op.equalsIgnoreCase("add")){
        String id=request.getParameter("id");
         String option="<option>Select City</option>";
          Connection con =null;
            PreparedStatement smt=null;
           try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/training","root","root");
            String sql = "select * from city where sid=?";
            smt = con.prepareStatement(sql);
            smt.setString(1,id);
            ResultSet rs = smt.executeQuery();
           while(rs.next())
                        {
                    option+="<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>";
                        }
            smt.close();
            con.close();
            
            out.println(option);
            
        }catch(Exception e){
            System.out.println("Error : + "+ e.getMessage());
        
        } 
       }    
        if(op!=null && op.equalsIgnoreCase("table")){
        int n =Integer.parseInt(request.getParameter("n"));
        for(int i=1;i<=10;i++)
            out.println("<br/>" + (n*i));    
        }
    
    if (op!=null && op.equalsIgnoreCase("sqr") ){
         int n =Integer.parseInt(request.getParameter("n"));
         out.println(n*n);
    }
     String friends[] ={"amit","suresh","mukesh","ganesh","mohan","sohan","ramakant","anit",
            "babita","monika"};
    if (op!=null && op.equalsIgnoreCase("search")){
        String name = request.getParameter("name");
        for (String s : friends)
            if (s.contains(name))
                out.println("<option value=\""+ s +"\"></option>");
    }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }


}
