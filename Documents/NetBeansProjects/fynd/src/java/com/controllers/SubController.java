/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Sub_category;
import com.daos.ShopDao;
import com.daos.Sub_CategoryDao;
import com.utility.FileUploader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class SubController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op != null && op.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Sub_CategoryDao cd = new Sub_CategoryDao();
            if (cd.remove(id)) {
                out.println("<script>alert('Deletion Successed!');</script>");
                out.println("<script>window.location = 'admin/viewsubcat.jsp';</script>");
            } else {
                out.println("<script>alert('Deletion Failed! Must have any dependecency');</script>");
                out.println("<script>window.location = 'admin/viewsubcat.jsp';</script>");
            }
        }
         if(op!=null && op.equals("cat")){
             int id=Integer.parseInt(request.getParameter("id"));
              Sub_CategoryDao cd = new Sub_CategoryDao();
              ArrayList<Sub_category> sut=cd.getAllRecordsId(id);
              String output="";
              boolean flag=true;
              for(Sub_category sc:sut){
                  if(flag)
                  output+="<tr>";
                  
                  output+="<td class='text-center'><div class='card'><button  class=\"btn btn-cyan\" disabled>\n" +
"                                                     <input type=\"checkbox\" class=\"largerCheckbox\" name='subcat' value="+sc.getSub_category_id()+">"+sc.getSub_category_name()+"</input>\n" +
"                                                     <img src='../"+sc.getPhoto()+"' style='width:150px; height: 150px'/>\n" +
"                                                     </button></div></td>";
                  
                  if(!flag) output+="</tr>";
                  flag=!flag;
              }
              out.println(output);
        
    }
          if(op!=null && op.equals("sub")){
             int id=Integer.parseInt(request.getParameter("id"));
             ShopDao cd=new ShopDao();
             
              ArrayList<Sub_category> sut=cd.getAllSubbySub(id);
              String output="<option value='-1'>Select Sub Category</option>";
             
              for(Sub_category sc:sut){
              
              output+="<option value="+sc.getSub_category_id()+">"+sc.getSub_category_name()+"</option>";
              }
              out.println(output);
          }

    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if (op != null && op.equals("add")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath = "";
            HttpSession session = request.getSession();
            Sub_category sub_category = (Sub_category) session.getAttribute("sub_category");
            if (sub_category.getCategory_id() == -1) {
                out.println("<script>alert('Please Select Category');</script>");
                out.println("<script>window.location='admin/addsubCategory.jsp';</script>");
            }
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/subcat", request);
            }
            sub_category.setPhoto(imagePath);
            Sub_CategoryDao sd = new Sub_CategoryDao();
            if (sd.add(sub_category)) {
                session.removeAttribute("sub_category");

                out.println("<script>alert('Sub_Category Added Successfully');</script>");
                out.println("<script>window.location='admin/viewsubcat.jsp';</script>");
            }

        }
        if (op != null && op.equals("update")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath = "";
            HttpSession session = request.getSession();
            Sub_category sub_categ = (Sub_category) session.getAttribute("sub_categ");
            if (sub_categ.getCategory_id() == -1) {
                out.println("<script>alert('Please Select Category');</script>");
                out.println("<script>window.location='admin/viewcatsub.jsp';</script>");
            }
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/subcat", request);
            }

            Sub_CategoryDao sd = new Sub_CategoryDao();
            if (imagePath == "") {
                if (sd.updat1(sub_categ)) {
                    session.removeAttribute("sub_categ");

                    out.println("<script>alert('Sub_Category updated Successfully');</script>");
                    out.println("<script>window.location='admin/viewsubcat.jsp';</script>");
                }
            }
            else {
                sub_categ.setPhoto(imagePath);

                if (sd.update(sub_categ)) {
                    session.removeAttribute("sub_categ");

                    out.println("<script>alert('Sub_Category updated Successfully');</script>");
                    out.println("<script>window.location='admin/viewsubcat.jsp';</script>");
                }

            }
        }
        if(op!=null&&op.equals("subadd")){
            String shop[]=request.getParameterValues("shop");
            String sub[]=request.getParameterValues("subcat");
            Sub_CategoryDao sd=new Sub_CategoryDao();
            if(sd.addshopsub(shop, sub))
            {
                out.println("<script>alert('Sub_Category Successfully Added');</script>");
                    out.println("<script>window.location='vendor/viewsubcat.jsp';</script>"); 
            }
            
        }

    }

}
