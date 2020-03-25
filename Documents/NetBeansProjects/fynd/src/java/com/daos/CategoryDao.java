/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Category;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Abhishek Kumar
 */
public class CategoryDao {
   public boolean add(Category category){
       boolean status=false;
       ConnectionPool cp=ConnectionPool.getInstance();
       cp.initialize();
       Connection con=cp.getConnection();
       if(con!=null){
           try{
             String sql="insert into category(category_name)values(?)";
             PreparedStatement smt=con.prepareStatement(sql);
             smt.setString(1, category.getCategory_name());
             if(smt.executeUpdate()>0)
                 status=true;
             
                 smt.close();
               cp.putConnection(con);
           }
           catch(Exception e)
           {
             System.out.println("Error :"+e.getMessage());
               
           }
       }
       return status;
   }
   public ArrayList<Category> getAllRecords(){
    ArrayList<Category> cat=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql="select * from category";
         PreparedStatement smt=con.prepareStatement(sql);
         ResultSet rs=smt.executeQuery();
         while(rs.next()){
             Category category=new Category();
             category.setCategory_id(rs.getInt("category_id"));
             category.setCategory_name(rs.getString("category_name"));
             cat.add(category);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return cat;
   }
   
   public boolean update(Category category)
   {
       boolean status=false;
       ConnectionPool cp=ConnectionPool.getInstance();
       cp.initialize();
       Connection con=cp.getConnection();
       if(con!=null){
           try{
              String sql="update category set category_name=? where category_id=?";
                 PreparedStatement smt = con.prepareStatement(sql);
                 smt.setString(1,category.getCategory_name());
                 smt.setInt(2,category.getCategory_id());
                   if (smt.executeUpdate() > 0) {
                    status = true;
                }
                smt.close();
                cp.putConnection(con);
           }
           catch(Exception e)
           {
               System.out.println("Error :"+e.getMessage());
           }
       }
       
     return status;
   }
   
   public boolean remove(int id) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                 PreparedStatement smt= null; 
                String sql="select count(*) from sub_category where category_id=?";
                    smt = con.prepareStatement(sql);
                 smt.setInt(1, id);
                 ResultSet rs = smt.executeQuery();
                 rs.next();
                 int k=rs.getInt(1);
                 if(k==0){
                sql = "Delete from category where category_id=?";
                 smt = con.prepareStatement(sql);
                smt.setInt(1, id);

                if (smt.executeUpdate() > 0) {
                    status = true;
                }
                 }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return status;
    } 
   public Category  getById(int id){
      Category category=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from category where category_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                category =new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return category;
   }
   
}
