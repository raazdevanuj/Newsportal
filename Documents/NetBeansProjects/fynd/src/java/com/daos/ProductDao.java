
package com.daos;

import com.beans.Product;
import com.beans.Sub_category;
import com.beans.scp;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.commons.lang.StringEscapeUtils;


public class ProductDao {
      public boolean  add(Product product,scp sc){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
      
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "Insert into product(product_name,product_Brand,product_price,product_desc,photo)values(?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
          //  System.out.println("11111  "+news.getImage());
            smt.setString(1,StringEscapeUtils.escapeHtml(product.getProduct_name()));
            smt.setString(2,product.getProduct_Brand());
            smt.setString(3,product.getProduct_price());
            smt.setString(4,product.getProduct_desc());
            smt.setString(5,product.getPhoto());
            
            if(smt.executeUpdate()>0) {
               sql = "Select product_id from product order by product_id desc limit 1";
               smt = con.prepareCall(sql);
               ResultSet rs = smt.executeQuery();
               int product_id = 0;
               if(rs.next())
                   product_id = rs.getInt(1);
              
              
                   sql = "insert into scp (category_id,sub_category_id,product_id) values (?,?,?)";
                   smt = con.prepareStatement(sql);
                   smt.setInt(1, sc.getCategory_id());
                   smt.setInt(2, sc.getSub_category_id());
                   smt.setInt(3, product_id);
                   smt.executeUpdate();
               
               
            }
            con.commit();
            status=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
        }
       }
       
    return status;
   }
   public ArrayList<Product> getAllRecords(){
    ArrayList<Product> pd=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql="select * from product";
         PreparedStatement smt=con.prepareStatement(sql);
         ResultSet rs=smt.executeQuery();
         while(rs.next()){
             Product product=new Product();
             product.setProduct_id(rs.getInt("product_id"));
             product.setProduct_name(rs.getString("product_name"));
             product.setProduct_Brand(rs.getString("product_Brand"));
             product.setProduct_price(rs.getString("product_price"));
             product.setPhoto(rs.getString("photo"));
             product.setProduct_desc(rs.getString("product_desc"));
          
             pd.add(product);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return pd;
   } 
  public Product  getById(int id){
      Product product=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from product where product_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                product=new Product();
             product.setProduct_id(rs.getInt("product_id"));
             product.setProduct_name(rs.getString("product_name"));
             product.setProduct_Brand(rs.getString("product_Brand"));
             product.setProduct_price(rs.getString("product_price"));
             product.setPhoto(rs.getString("photo"));
             product.setProduct_desc(rs.getString("product_desc"));
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return product;
   }  
   public ArrayList<Product> getbysub(int id){
    ArrayList<Product> pd=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql = "select * from product where product_id in (select product_id from scp where sub_category_id=?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
         while(rs.next()){
             Product product=new Product();
             product.setProduct_id(rs.getInt("product_id"));
             product.setProduct_name(rs.getString("product_name"));
             product.setProduct_Brand(rs.getString("product_Brand"));
             product.setProduct_price(rs.getString("product_price"));
             product.setPhoto(rs.getString("photo"));
             product.setProduct_desc(rs.getString("product_desc"));
          
             pd.add(product);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return pd;
   } 
  public ArrayList<Product> getbyshop(int id){
    ArrayList<Product> pd=new ArrayList();
    ConnectionPool cp=ConnectionPool.getInstance();
    cp.initialize();
    Connection con=cp.getConnection();
    if(con!=null){
        try
        {
         String sql = "select * from product where product_id in (select product_id from shop_product where shop_id=?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
         while(rs.next()){
             Product product=new Product();
             product.setProduct_id(rs.getInt("product_id"));
             product.setProduct_name(rs.getString("product_name"));
             product.setProduct_Brand(rs.getString("product_Brand"));
             product.setProduct_price(rs.getString("product_price"));
             product.setPhoto(rs.getString("photo"));
             product.setProduct_desc(rs.getString("product_desc"));
          
             pd.add(product);
         }
         smt.close();
         cp.putConnection(con);
        }
        catch(Exception e)
        {
            System.out.println("Error:"+e.getMessage());
        }
    }
    return pd;
   } 
  
   public scp  getRelId(int id){
      scp sc=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from scp where product_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                sc=new scp();
             sc.setCategory_id(rs.getInt("category_id"));
             sc.setSub_category_id(rs.getInt("sub_category_id"));
             sc.setProduct_id(rs.getInt("product_id"));
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return sc;
   }  
   
     
   public boolean  update(Product product,scp sc)
   {
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "update product set product_name=?, product_Brand=?,product_price=? , product_desc=?, photo=? where product_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
           smt.setString(1,StringEscapeUtils.escapeHtml(product.getProduct_name()));
            smt.setString(2,product.getProduct_Brand());
            smt.setString(3,product.getProduct_price());
            smt.setString(4,product.getProduct_desc());
            smt.setString(5,product.getPhoto());
            smt.setInt(6, product.getProduct_id());
            
            if(smt.executeUpdate()>0) {
                sql =  "update scp set category_id=?,sub_category_id=? where product_id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1,sc.getCategory_id());
                smt.setInt(2,sc.getSub_category_id());
                smt.setInt(3,sc.getProduct_id());
                smt.executeUpdate();
               
               
            }
            con.commit();
            status=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
        }
       
       }
    return status;
   }
  public boolean  updat1(Product product,scp sc)
   {
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "update product set product_name=?, product_Brand=?,product_price=? , product_desc=? where product_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
           smt.setString(1,StringEscapeUtils.escapeHtml(product.getProduct_name()));
            smt.setString(2,product.getProduct_Brand());
            smt.setString(3,product.getProduct_price());
            smt.setString(4,product.getProduct_desc());
            smt.setInt(6, product.getProduct_id());
            
            if(smt.executeUpdate()>0) {
                sql =  "update scp set category_id=?,sub_category_id=? where product_id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1,sc.getCategory_id());
                smt.setInt(2,sc.getSub_category_id());
                smt.setInt(3,sc.getProduct_id());
                smt.executeUpdate();
               
               
            }
            con.commit();
            status=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
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
                    String sql = "Delete from scp where product_id=?";
                    smt = con.prepareStatement(sql);
                    smt.setInt(1, id);
            

                if (smt.executeUpdate() > 0) {
                 sql = "Delete from product where product_id=?";
                 smt = con.prepareStatement(sql);
                smt.setInt(1, id);    
                   
                
                    if (smt.executeUpdate() > 0) { status = true;}
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
 public boolean removebyid(int id) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                 PreparedStatement smt= null;
                    String sql = "Delete from shop_product where product_id=?";
                    smt = con.prepareStatement(sql);
                    smt.setInt(1, id);
                   
                
                    if (smt.executeUpdate() > 0) { status = true;}
                
//                 }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return status;
    } 
}
