package com.controllers;



import com.beans.News;
import com.daos.NewsDao;
import com.daos.ReporterDao;
import com.utility.FileUploader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class NewsController extends HttpServlet {

    
  

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         String op=request.getParameter("op");
          if(op!=null && op.equalsIgnoreCase("cat")){
         int cour_id = Integer.parseInt(request.getParameter("cid"));
        
                                String output = " <tr>\n" +
"                  <td>Title</td>\n" +
"                  <td>Uploaded By </td>\n" +
"                  <td>Uploaded On</td>\n" +
"                  <td>Status</td>\n" +
"                  <td>View and Change Status</td>\n" +
"              </tr>";
                         
                                  NewsDao nd = new NewsDao();
              ArrayList<News> newsList = nd.getNewsByCategory(cour_id);
              ReporterDao rd = new ReporterDao();
              for(News news : newsList){
               output+="<tr>\n" +
"                  <td>"+news.getTitle()+"</td>\n" +
"                  <td>"+rd.getById(news.getReporter_id()).getName()+"</td>\n" +
"                  <td>"+news.getUploaded_on()+"</td>\n" +
"                  <td>"+news.getStatus()+"</td>\n" +
"                  <td><a href=\"showDetailNews.jsp?newsid="+news.getId()+"\" class=\"btn btn-success\">View and Change Status</a></td>\n" +
"              </tr>";
              }
                               out.println(output); 
                                 
                               
          }
           if(op!=null && op.equalsIgnoreCase("repo")){
         int cour_id = Integer.parseInt(request.getParameter("rid"));
        
               String output = " <tr>\n" +
"                  <td>Title</td>\n" +
"                  <td>Uploaded By </td>\n" +
"                  <td>Uploaded On</td>\n" +
"                  <td>Status</td>\n" +
"                  <td>View and Change Status</td>\n" +
"              </tr>";
                         
                                  NewsDao nd = new NewsDao();
              ArrayList<News> newsList = nd.getNewsByReporter(cour_id);
              ReporterDao rd = new ReporterDao();
              for(News news : newsList){
               output+="<tr>\n" +
"                  <td>"+news.getTitle()+"</td>\n" +
"                  <td>"+rd.getById(news.getReporter_id()).getName()+"</td>\n" +
"                  <td>"+news.getUploaded_on()+"</td>\n" +
"                  <td>"+news.getStatus()+"</td>\n" +
"                  <td><a href=\"showDetailNews.jsp?newsid="+news.getId()+"\" class=\"btn btn-success\">View and Change Status</a></td>\n" +
"              </tr>";
              }
                               out.println(output); 
                                 
                               
          }
           
        if(op!=null && op.equalsIgnoreCase("filter")){
         int rid = Integer.parseInt(request.getParameter("rid"));
          int cid = Integer.parseInt(request.getParameter("cid"));
               String output = " <tr>\n" +
"                  <td>Title</td>\n" +
"                  <td>Uploaded By </td>\n" +
"                  <td>Uploaded On</td>\n" +
"                  <td>Status</td>\n" +
"                  <td>View and Change Status</td>\n" +
"              </tr>";
                         
              NewsDao nd = new NewsDao();
              ArrayList<News> newsList = nd.getNewsfilter(rid,cid);
              ReporterDao rd = new ReporterDao();
              for(News news : newsList){
               output+="<tr>\n" +
"                  <td>"+news.getTitle()+"</td>\n" +
"                  <td>"+rd.getById(news.getReporter_id()).getName()+"</td>\n" +
"                  <td>"+news.getUploaded_on()+"</td>\n" +
"                  <td>"+news.getStatus()+"</td>\n" +
"                  <td><a href=\"showDetailNews.jsp?newsid="+news.getId()+"\" class=\"btn btn-success\">View and Change Status</a></td>\n" +
"              </tr>";
              }
                               out.println(output); 
                                 
                               
          }    
    }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       response.setContentType("text/html");
       String op=request.getParameter("op");
       
       if(op!=null && op.equalsIgnoreCase("add")){
           HttpSession session = request.getSession();
           News news = (News)session.getAttribute("news");
           String catids[] = (String[])session.getAttribute("catids");
           String imagePath="";
           imagePath = FileUploader.getUploadedPath(getServletContext(), "media/news", request);
           System.out.println("image "+imagePath);
           news.setImage(imagePath);
           NewsDao nd = new NewsDao();
           if(nd.add(news, catids)){
               session.removeAttribute("news");
               session.removeAttribute("catids");
               out.println("<script>alert('News added Successfully');</script>");
               out.println("<script>window.location = 'reporter/dashboard.jsp';</script>");
                
           }
       }
       if(op!=null && op.equalsIgnoreCase("update")){
           HttpSession session = request.getSession();
           News news = (News)session.getAttribute("newz");
           String catids[] = (String[])session.getAttribute("catids");
           String imagePath="";
           imagePath = FileUploader.getUploadedPath(getServletContext(), "media/news", request);
           NewsDao nd = new NewsDao();
           if(imagePath=="")
           {
               if(nd.updat1(news, catids)){
               session.removeAttribute("news");
               session.removeAttribute("catids");
               out.println("<script>alert('News updated Successfully');</script>");
               out.println("<script>window.location = 'reporter/updateNews.jsp';</script>");
                
           }
           }
           else{
           news.setImage(imagePath);
           
           if(nd.update(news, catids)){
               session.removeAttribute("news");
               session.removeAttribute("catids");
               out.println("<script>alert('News updated Successfully');</script>");
               out.println("<script>window.location = 'reporter/updateNews.jsp';</script>");
                
           }
           }
       }
    }
    

   
}
