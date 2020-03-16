/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Enquiry;
import com.beans.Subscriber;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Abhishek Kumar
 */
public class EnquiryDao {
     public boolean add(Enquiry en) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
            try {
                String sql = "Insert into enquiry(name, email,contact,message) values(?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, en.getName());
                smt.setString(2, en.getEmail());
                smt.setString(3, en.getContact());
                smt.setString(4, en.getMessage());
                smt.executeUpdate();
                status = true;
                cp.putConnection(con);
                smt.close();
                //cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return status;
    }
     
       public ArrayList<Enquiry>  getAllRecords(){
    
       ArrayList<Enquiry> newss =new ArrayList<Enquiry>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from Enquiry";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                Enquiry  enquiry =new Enquiry();
               enquiry.setId(rs.getInt("id"));
               enquiry.setName(rs.getString("name"));
               enquiry.setEmail(rs.getString("email"));
               enquiry.setContact(rs.getString("contact"));
               enquiry.setMessage(rs.getString("message"));
                newss.add(enquiry);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error sss :"+e.getMessage());
        }
       }
       
    return newss;
   }
}
