package com.daos;

import com.beans.News;
import com.beans.Subscriber;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.pool.ConnectionPool;
import java.util.ArrayList;

public class SubscriberDao {

    public boolean add(Subscriber sub) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
            try {
                String sql = "Insert into subscriber(name, email) values(?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, sub.getName());
                smt.setString(2, sub.getEmail());
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

      public ArrayList<Subscriber>  getAllRecords(){
    
       ArrayList<Subscriber> newss =new ArrayList<Subscriber>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from Subscriber";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                Subscriber  subscriber =new Subscriber();
               subscriber.setId(rs.getInt("id"));
               subscriber.setName(rs.getString("name"));
               subscriber.setEmail(rs.getString("email"));
                newss.add(subscriber);
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
