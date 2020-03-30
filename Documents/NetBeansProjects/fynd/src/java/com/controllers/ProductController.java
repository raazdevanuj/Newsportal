/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Product;
import com.beans.Sub_category;
import com.beans.scp;
import com.daos.ProductDao;
import com.daos.Sub_CategoryDao;
import com.utility.FileUploader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ProductController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         String op=request.getParameter("op");
          if(op!=null && op.equalsIgnoreCase("sub")){
          int id=Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            scp sc= (scp) session.getAttribute("sc");
         String option="<option value='"+-1+"'>Select Sub_Category Name</option>";
         Sub_CategoryDao sd= new Sub_CategoryDao();
         ArrayList<Sub_category> scat=sd.getAllRecordsId(id); 
         for(Sub_category sub:scat){
             option+="<option value='"+sub.getSub_category_id()+"'>"+sub.getSub_category_name()+"</option>";
         }
         out.println(option);
          }
         if (op != null && op.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
          ProductDao cd=new ProductDao();
            if (cd.remove(id)) {
                out.println("<script>alert('Deletion Successed!');</script>");
                out.println("<script>window.location = 'admin/viewProduct.jsp';</script>");
            } else {
                out.println("<script>alert('Deletion Failed! Must have any dependecency');</script>");
                out.println("<script>window.location = 'admin/viewProduct.jsp';</script>");
            }
        }
         if (op != null && op.equals("del")) {
            int id = Integer.parseInt(request.getParameter("id"));
          ProductDao cd=new ProductDao();
            if (cd.removebyid(id)) {
                out.println("<script>alert('Deletion Successed!');</script>");
                out.println("<script>window.location = 'vendor/viewproduct.jsp';</script>");
            } else {
                out.println("<script>alert('Deletion Failed!');</script>");
                out.println("<script>window.location = 'vendor/viewproduct.jsp';</script>");
            }
        }
         
          if (op != null && op.equals("prod")) {
            int id = Integer.parseInt(request.getParameter("id"));
          ProductDao cd=new ProductDao();
          ArrayList<Product> p=cd.getbysub(id);
          String output="<tr><td><div class='card'>All Products</div></tr>";
          boolean flag=true;
          for(Product ro:p){
               if(flag)
                  output+="<tr>";
                  
                  output+="<td class='text-center'><div class='card'><button class=\"btn btn-cyan\" disabled>\n" +
"                                                     <input type=\"checkbox\" class=\"largerCheckbox\" name='prodd' value="+ro.getProduct_id()+">"+ro.getProduct_name()+"</input>\n" +
"                                                     <br>"+ro.getProduct_Brand()+"<br> MRP :"+ro.getProduct_price()+"<br>"+ro.getProduct_desc()+"<img src='../"+ro.getPhoto()+"' style='width:150px; height: 150px'/>\n" +
"                                                     </button></div></td>";
                  
                  if(!flag) output+="</tr>";
                  flag=!flag;
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
        if (op != null && op.equals("Add")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath = "";
            HttpSession session = request.getSession();
            Product product =(Product) session.getAttribute("product");
            scp sc=(scp) session.getAttribute("sc");
           
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/product", request);
            }
            product.setPhoto(imagePath);
           ProductDao sd= new ProductDao();
            if (sd.add(product,sc)) {
                session.removeAttribute("product");
                session.removeAttribute("sc");

                out.println("<script>alert('Product Added Successfully');</script>");
                out.println("<script>window.location='admin/viewProduct.jsp';</script>");
            }

        }   
         if (op != null && op.equals("update")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath = "";
            HttpSession session = request.getSession();
            Product prod =(Product) session.getAttribute("prod");
            scp scd=(scp) session.getAttribute("scd");
           
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/product", request);
            }
            ProductDao sd= new ProductDao();
            if(imagePath==""){
              if (sd.updat1(prod, scd)) {
                session.removeAttribute("prod");
                session.removeAttribute("scd");

                out.println("<script>alert('Product Updated Successfully');</script>");
                out.println("<script>window.location='admin/viewProduct.jsp';</script>");
            }  
            }
            else
            {
            prod.setPhoto(imagePath);
           
            if (sd.update(prod, scd)) {
                session.removeAttribute("prod");
                session.removeAttribute("scd");

                out.println("<script>alert('Product Updated Successfully');</script>");
                out.println("<script>window.location='admin/viewProduct.jsp';</script>");
            }
        }  
         }
          if(op!=null&&op.equals("prod")){
            String shop=request.getParameter("shop");
            String cat=request.getParameter("cat");
            String sub[]=request.getParameterValues("prodd");
            Sub_CategoryDao sd=new Sub_CategoryDao();
            if(sd.addshopprod(shop,cat,sub))
            {
                out.println("<script>alert('Product Successfully Added');</script>");
                    out.println("<script>window.location='vendor/viewproduct.jsp';</script>"); 
            }
            
        }
    }   
}
