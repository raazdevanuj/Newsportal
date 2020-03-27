/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Vendor;
import com.pool.ConnectionPool;
import java.sql.*;
import java.util.Base64;


public class VendorDao {
    public boolean add(Vendor vendor){
     boolean status=false;
     ConnectionPool cp= ConnectionPool.getInstance();
     cp.initialize();
     Connection con=cp.getConnection();
     if(con!=null){
         try
         {
          String sql="insert into vendor(vendor_name,email_id,password,mobile,photo,status,userid) values(?,?,?,?,?,?,?)";
         PreparedStatement smt=con.prepareStatement(sql);
         smt.setString(1,vendor.getVendor_name());
         smt.setString(2, vendor.getEmail_id());
         smt.setString(3, vendor.getPassword());
         smt.setString(4,vendor.getMobile());
         smt.setString(5, vendor.getPhoto());
         smt.setString(6, vendor.getStatus());
         smt.setString(7, vendor.getUserid());
         if(smt.executeUpdate()>0)
             status=true;
         }
         catch(Exception e){
             System.out.println("Error :"+e.getMessage());
         }
     }
     return status;
    }
   public Vendor isValid(String userid, String password) {
        Vendor vendor = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from vendor where userid=? and password=? and status='approved'";
                PreparedStatement smt = con.prepareStatement(sql);
                String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
                smt.setString(1, userid);
                smt.setString(2, encodedPassword);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    vendor = new Vendor();
                    vendor.setVendor_id(rs.getInt("Vendor_id"));
                    vendor.setMobile(rs.getString("mobile"));
                    vendor.setVendor_name(rs.getString("Vendor_name"));
                    vendor.setEmail_id(rs.getString("email_id"));
                    vendor.setPhoto(rs.getString("photo"));
                    vendor.setStatus(rs.getString("status"));
                    vendor.setUserid(rs.getString("userid"));
                    vendor.setPassword(rs.getString("password"));
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return vendor;
    }  
    public boolean update(Vendor vendor) {
       boolean status =false;
        ConnectionPool cp= ConnectionPool.getInstance();
     cp.initialize();
     Connection con=cp.getConnection();
     if(con!=null){
         try
         {
          String sql="update vendor set vendor_name=?,email_id=?,mobile=?,photo=? where vendor_id=?";
         PreparedStatement smt=con.prepareStatement(sql);
         smt.setString(1,vendor.getVendor_name());
         smt.setString(2, vendor.getEmail_id());
          smt.setString(3,vendor.getMobile());
         smt.setString(4, vendor.getPhoto());
         smt.setInt(5, vendor.getVendor_id());
        
         if(smt.executeUpdate()>0)
             status=true;
         }
         catch(Exception e){
             System.out.println("Error :"+e.getMessage());
         }
     }
     return status;
    }  
    public Vendor getByid(int id) {
        Vendor vendor = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from vendor where vendor_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1,id);
    
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    vendor = new Vendor();
                    vendor.setVendor_id(rs.getInt("Vendor_id"));
                    vendor.setMobile(rs.getString("mobile"));
                    vendor.setVendor_name(rs.getString("Vendor_name"));
                    vendor.setEmail_id(rs.getString("email_id"));
                    vendor.setPhoto(rs.getString("photo"));
                    vendor.setStatus(rs.getString("status"));
                    vendor.setUserid(rs.getString("userid"));
                    vendor.setPassword(rs.getString("password"));
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return vendor;
    }
    
     public String getphotoid(int id) {
      String s="";
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select photo from vendor where vendor_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1,id);
    
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                  s=rs.getString("photo");
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return s;
    } 
      public String getnameid(int id) {
      String s="";
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select vendor_name from vendor where vendor_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1,id);
    
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                  s=rs.getString("vendor_name");
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return s;
    }  
}

