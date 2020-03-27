/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Vendor;
import com.daos.VendorDao;
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
public class VendorController extends HttpServlet {

   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     PrintWriter out=response.getWriter();
     String op=request.getParameter("op");
     if(op!=null && op.equals("add")){
         boolean isMultipart=ServletFileUpload.isMultipartContent(request);
         String encodedpass="";
         String imagePath="";
         HttpSession session=request.getSession();
         Vendor vendor=(Vendor) session.getAttribute("vendor");
         if(isMultipart)
             imagePath=FileUploader.getUploadedPath(getServletContext(), "media/vendor", request);
         vendor.setPhoto(imagePath);
         encodedpass=Base64.getEncoder().encodeToString(vendor.getPassword().getBytes("UTF-8"));
         vendor.setPassword(encodedpass);
         VendorDao vd= new VendorDao();
         if(vd.add(vendor)){
             session.removeAttribute("vendor");
             out.println("<script>alert('Vendor Registration Completed!  Please Login')</script>");
             out.println("<script>window.location='index.jsp'</script>");
         }
         
         
     }
     if(op!=null && op.equals("update")){
         boolean isMultipart=ServletFileUpload.isMultipartContent(request);
         String imagePath="";
         HttpSession session=request.getSession();
         Vendor vendor=(Vendor) session.getAttribute("vend");
         if(isMultipart)
             imagePath=FileUploader.getUploadedPath(getServletContext(), "media/vendor", request);
         vendor.setPhoto(imagePath);        
         VendorDao vd= new VendorDao();
         if(vd.update(vendor)){
             out.println("<script>alert('Vendor Updated Completed!')</script>");
              out.println("<script>window.location='shop/dashboard.jsp'</script>");
         }
        
     }
     
    }
}
