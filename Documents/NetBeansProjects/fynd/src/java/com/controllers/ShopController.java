/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Category;
import com.beans.Shop;
import com.beans.Sub_category;
import com.daos.CategoryDao;
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
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        if(op!=null && op.equals("shop")){
            int id=Integer.parseInt(request.getParameter("id"));
        String output="<tr><td>Sub Category Id</td><td>Sub Category Name</td><td>Category Name</td><td>Photo</td></tr>";
        Sub_CategoryDao sf=new Sub_CategoryDao();
        CategoryDao cd=new CategoryDao();
        ArrayList<Sub_category> sdd=sf.getAllRecordsShopId(id);
        for(Sub_category sd:sdd){
            Category cat=cd.getById(sd.getCategory_id());
            output+=" <tr>\n" +
"                      <td>"+sd.getSub_category_id()+"</td>\n" +
"                      <td>"+sd.getSub_category_name()+"</td>\n" +
"                      <td>"+cat.getCategory_name()+"</td>\n" +
"                      <td><img src=\"../"+sd.getPhoto()+"\" style=\"width:150px; height: 150px;\"/></td></tr>";
        }
        out.println(output);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String op = request.getParameter("op");
        

        if (op != null && op.equals("add")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            String imagePath = "";
            HttpSession session = request.getSession();
            Shop shope = (Shop) session.getAttribute("shope");
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/shop", request);
            }

            shope.setShop_Banner(imagePath);
            ShopDao sd = new ShopDao();

            if (sd.add(shope)) {
                session.removeAttribute("shope");
                out.println("<script>alert('Shop Successfully  Added!')</script>");
                out.println("<script>window.location='vendor/viewshop.jsp'</script>");
            }

        }
        if (op != null && op.equals("update")) {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            String imagePath = "";
            HttpSession session = request.getSession();
            Shop shop = (Shop) session.getAttribute("shop");
            if (isMultipart) {
                imagePath = FileUploader.getUploadedPath(getServletContext(), "media/shop", request);
            }
            ShopDao sd = new ShopDao();
            if (imagePath == "") {
                if (sd.updat1(shop)) {
                    session.removeAttribute("shop");
                    out.println("<script>alert('Shop Details Updated Successfully!')</script>");
                    out.println("<script>window.location='vendor/viewshop.jsp'</script>");
                }
            } else {
                shop.setShop_Banner(imagePath);

                if (sd.update(shop)) {
                    session.removeAttribute("shop");
                    out.println("<script>alert('Shop Details Updated Successfully!')</script>");
                    out.println("<script>window.location='vendor/viewshop.jsp'</script>");
                }
            }
        }
         if (op != null && op.equals("Address")) {
           
            HttpSession session = request.getSession();
            Shop shopee = (Shop) session.getAttribute("shopee");
            
            ShopDao sd = new ShopDao();
           
                if (sd.updat1(shopee)) {
                    session.removeAttribute("shopee");
                    out.println("<script>alert('Shop Details Updated Successfully!')</script>");
                    out.println("<script>window.location='vendor/viewshop.jsp'</script>");
                }
           
            
        }
    }
}
