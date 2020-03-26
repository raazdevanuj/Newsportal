/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Sub_category;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Abhishek Kumar
 */
public class Sub_CategoryDao {
      public boolean add(Sub_category sub_category){
       boolean status=false;
       ConnectionPool cp=ConnectionPool.getInstance();
       cp.initialize();
       Connection con=cp.getConnection();
       if(con!=null){
           try{
             String sql="insert into sub_category(sub_category_name,photo,category_id)values(?,?,?)";
             PreparedStatement smt=con.prepareStatement(sql);
             smt.setString(1,sub_category.getSub_category_name());
             smt.setString(2,sub_category.getPhoto());
             smt.setInt(3, sub_category.getCategory_id());
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
   public ArrayList<Sub_category> getAllRecords(){
    ArrayList<Sub_category> sub=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql="select * from sub_category";
         PreparedStatement smt=con.prepareStatement(sql);
         ResultSet rs=smt.executeQuery();
         while(rs.next()){
             Sub_category sub_category=new Sub_category();
            sub_category.setSub_category_id(rs.getInt("sub_category_id"));
            sub_category.setSub_category_name(rs.getString("sub_category_name"));
            sub_category.setPhoto(rs.getString("photo"));
            sub_category.setCategory_id(rs.getInt("category_id"));
             sub.add(sub_category);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return sub;
   }
   public ArrayList<Sub_category> getAllRecordsId(int id){
    ArrayList<Sub_category> sub=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql="select * from sub_category where category_id=?";
         PreparedStatement smt=con.prepareStatement(sql);
         smt.setInt(1, id);
         ResultSet rs=smt.executeQuery();
         while(rs.next()){
             Sub_category sub_category=new Sub_category();
            sub_category.setSub_category_id(rs.getInt("sub_category_id"));
            sub_category.setSub_category_name(rs.getString("sub_category_name"));
            sub_category.setPhoto(rs.getString("photo"));
            sub_category.setCategory_id(rs.getInt("category_id"));
             sub.add(sub_category);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return sub;
   }
   public boolean update(Sub_category sub_category)
   {
       boolean status=false;
       ConnectionPool cp=ConnectionPool.getInstance();
       cp.initialize();
       Connection con=cp.getConnection();
       if(con!=null){
           try{
              String sql="update sub_category set sub_category_name=?,photo=?,category_id=? where sub_category_id=?";
                 PreparedStatement smt = con.prepareStatement(sql);
                 smt.setString(1,sub_category.getSub_category_name());
                 smt.setString(2,sub_category.getPhoto());
                 smt.setInt(3,sub_category.getCategory_id());
                 smt.setInt(4,sub_category.getSub_category_id());
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
   
     public boolean updat1(Sub_category sub_category)
   {
       boolean status=false;
       ConnectionPool cp=ConnectionPool.getInstance();
       cp.initialize();
       Connection con=cp.getConnection();
       if(con!=null){
           try{
              String sql="update sub_category set sub_category_name=?,category_id=? where sub_category_id=?";
                 PreparedStatement smt = con.prepareStatement(sql);
                 smt.setString(1,sub_category.getSub_category_name());
                  smt.setInt(2,sub_category.getCategory_id());
                 smt.setInt(3,sub_category.getSub_category_id());
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
//                String sql="select count(*) from sub_category where category_id=?";
//                    smt = con.prepareStatement(sql);
//                 smt.setInt(1, id);
//                 ResultSet rs = smt.executeQuery();
//                 rs.next();
//                 int k=rs.getInt(1);

//               if(k==0){
               String sql = "Delete from Sub_category where sub_category_id=?";
                 smt = con.prepareStatement(sql);
                smt.setInt(1, id);

                if (smt.executeUpdate() > 0) {
                    status = true;
                }
//                 }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return status;
    } 
   public Sub_category  getById(int id){
      Sub_category sub_category=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from Sub_category where sub_category_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                sub_category=new Sub_category();
                sub_category.setSub_category_id(rs.getInt("sub_category_id"));
            sub_category.setSub_category_name(rs.getString("sub_category_name"));
            sub_category.setPhoto(rs.getString("photo"));
            sub_category.setCategory_id(rs.getInt("category_id"));
            
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return sub_category;
   }
 
}
