/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.user;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Abhishek Kumar
 */
public class UserDao {
     public boolean add1(user use){
     boolean status=false;
     ConnectionPool cp= ConnectionPool.getInstance();
     cp.initialize();
     Connection con=cp.getConnection();
     if(con!=null){
         try
         {
            // System.out.println(use.getEmail_id());
          String sql="insert into user(email_id,password,name,phone_no,city,locality,pincode) values(?,?,?,?,?,?,?)";
         PreparedStatement smt=con.prepareStatement(sql);
          smt.setString(1, use.getEmail_id());
         smt.setString(2, use.getPassword());
         smt.setString(3,use.getName());
         smt.setString(4, use.getPhone_no());
         smt.setString(5, use.getCity());
         smt.setString(6, use.getLocality());
         smt.setInt(7,Integer.parseInt(use.getPincode()));
         
        
         if(smt.executeUpdate()>0)
             status=true;
         }
         catch(Exception e){
             System.out.println("Error :"+e.getMessage());
         }
     }
     return status;
    }
      public user isValid(String userid, String password) {
       user use = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from user where email_id=? and password=?";
                PreparedStatement smt = con.prepareStatement(sql);
               
                smt.setString(1, userid);
                smt.setString(2, password);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    use = new user();
                    use.setCity(rs.getString("city"));
                    use.setEmail_id(rs.getString("email_id"));
                    use.setLocality(rs.getString("locality"));
                    use.setName(rs.getString("name"));
                    use.setPincode(rs.getString("pincode"));
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return use;
    }  
      public user isshow(String city, String locality,String pincode) {
       user use = null;
        
                    use = new user();
                    use.setCity(city);
                 
                    use.setLocality(locality);
               
                    use.setPincode(pincode);
             

        return use;
    }  
       public user ischange(String city, String locality,String pincode) {
            boolean status=false;
        ConnectionPool cp= ConnectionPool.getInstance();
         cp.initialize();
        Connection con=cp.getConnection();
        if(con!=null){
         try
         {
            // System.oupdate vendor set vendor_name=?,email_id=?,mobile=? where vendor_id=?ut.println(use.getEmail_id());
          String sql="update user set city=?,locality=?,pincode=? where email_id=raazdevanuj@gmail.com";
         PreparedStatement smt=con.prepareStatement(sql);
          smt.setString(1, city);
         smt.setString(2, locality);
         smt.setString(3,pincode);       
        
         if(smt.executeUpdate()>0)
             status=true;
         }
         catch(Exception e){
             System.out.println("Error :"+e.getMessage());
         }
     }
        
         user use = null;
   if(status==true){
      
        ConnectionPool cp1 = ConnectionPool.getInstance();
        cp1.initialize();
        Connection con1 = cp1.getConnection();
        if (con1 != null) {
            try {
                String sql = "select * from user where email_id=raazdevanuj@gmail.com";
                PreparedStatement smt1 = con.prepareStatement(sql);
                ResultSet rd = smt1.executeQuery();
                if (rd.next()) {
                    use = new user();
                    use.setCity(rd.getString("city"));
                    use.setEmail_id(rd.getString("email_id"));
                    use.setLocality(rd.getString("locality"));
                    use.setName(rd.getString("name"));
                    use.setPincode(rd.getString("pincode"));
                }
                smt1.close();
                cp1.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

    
    }  
   return use;
}
       
}
