/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Reporter;
import com.daos.ReporterDao;
import com.utility.FileUploader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Abhishek Kumar
 */
public class ReporterController extends HttpServlet {

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
      response.setContentType("text/html");
      String op=request.getParameter("op");
       if (op != null && op.equalsIgnoreCase("delete")) {
            int id=Integer.parseInt(request.getParameter("id"));
           // System.out.println("id :"+id);
           com.daos.ReporterDao ud=new com.daos.ReporterDao();
           com.daos.NewsDao nd=new com.daos.NewsDao();
           int k=nd.getNewsReporter(id);
             
           if(k==0&&ud.remove(id))
           {
                out.println("<script>alert('First Delete related news');</script>");
                  out.println("<script>window.location = 'admin/viewallrep.jsp';</script>");
                 
           }
           else
           {
                out.println("<script>alert('First Delete related news');</script>");
               out.println("<script>window.location = 'admin/viewallrep.jsp';</script>");
                 
           }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      response.setContentType("text/html");
      String op=request.getParameter("op");
      if(op!=null && op.equals("add")){
         boolean isMultipart=ServletFileUpload.isMultipartContent(request);
         String encodedPassword ="";
         String imagePath="";
         HttpSession session =request.getSession();
         Reporter reporter=(Reporter) session.getAttribute("reporter");
         if(isMultipart)
             imagePath=FileUploader.getUploadedPath(getServletContext(),"media/Reporter",request);
         System.out.println(imagePath);
         reporter.setImage(imagePath);
         encodedPassword=Base64.getEncoder().encodeToString(reporter.getPassword().getBytes("UTF-8"));
         reporter.setPassword(encodedPassword);
         ReporterDao rd= new ReporterDao();
         if(rd.add(reporter)){
             session.removeAttribute("reporter");
           response.sendRedirect("../login.jsp");
         }
         
      }
       if(op!=null && op.equals("update")){
         boolean isMultipart=ServletFileUpload.isMultipartContent(request);
        
         String imagePath="";
         HttpSession session =request.getSession();
         Reporter reporter=(Reporter) session.getAttribute("reporter");
         if(isMultipart)
             imagePath=FileUploader.getUploadedPath(getServletContext(),"media/Reporter",request);
         System.out.println(imagePath);
         ReporterDao rd= new ReporterDao();
         if(imagePath==""){
              if(rd.updat1(reporter)){
             out.println("<script>alert('Your Profile updated Successfully');</script>");
               out.println("<script>window.location = 'reporter/updateprofile.jsp';</script>");
         }
         else{
         reporter.setImage(imagePath);
         
         if(rd.update(reporter)){
             out.println("<script>alert('Your Profile updated Successfully');</script>");
               out.println("<script>window.location = 'reporter/updateprofile.jsp';</script>");
           
         }
         }
      }
    }

    }
  
}
