/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Shop;
import com.daos.ShopDao;
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
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
