/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.daos.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Abhishek Kumar
 */
public class CategoryController extends HttpServlet {

   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out= response.getWriter();
        response.setContentType("text/html");
        String op=request.getParameter("op");
        if(op!=null&& op.equals("delete"))
        {
            int id=Integer.parseInt(request.getParameter("id"));
            CategoryDao cd= new CategoryDao();
            if(cd.remove(id)){
                out.println("<script>alert('Deletion Successed!');</script>");
                  out.println("<script>window.location = 'admin/viewCategory.jsp';</script>");
            }
            else
            {
                 out.println("<script>alert('Deletion Failed! Must have any dependecency');</script>");
                  out.println("<script>window.location = 'admin/viewCategory.jsp';</script>");
            }
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
