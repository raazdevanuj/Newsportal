/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Category;
import com.beans.Shop;
import com.beans.Sub_category;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ShopDao {

    public boolean add(Shop shop) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "insert into shop(shop_name,shop_address,shop_city,shop_locality,shop_Banner,vendor_id) values(?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, shop.getShop_name());
                smt.setString(2, shop.getShop_address());
                smt.setString(3, shop.getShop_city());
                smt.setString(4, shop.getShop_locality());
                smt.setString(5, shop.getShop_Banner());
                smt.setInt(6, shop.getVendor_id());
                if (smt.executeUpdate() > 0) {
                    status = true;
                }

                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());

            }
        }
        return status;
    }

    public ArrayList<Shop> getAllRecords() {
        ArrayList<Shop> cat = new ArrayList();
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from shop";
                PreparedStatement smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Shop shop = new Shop();
                    shop.setShop_name(rs.getString("shop_name"));
                    shop.setShop_address(rs.getString("shop_address"));
                    shop.setShop_Banner(rs.getString("shop_Banner"));
                    shop.setShop_city(rs.getString("shop_city"));
                    shop.setShop_locality(rs.getString("shop_locality"));
                    shop.setShop_id(rs.getInt("shop_id"));
                    shop.setVendor_id(rs.getInt("vendor_id"));
                    cat.add(shop);
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        return cat;
    }

    public ArrayList<Shop> getAllRecordsbyid(int id) {
        ArrayList<Shop> cat = new ArrayList();
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from shop where vendor_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Shop shop = new Shop();
                    shop.setShop_name(rs.getString("shop_name"));
                    shop.setShop_address(rs.getString("shop_address"));
                    shop.setShop_Banner(rs.getString("shop_Banner"));
                    shop.setShop_city(rs.getString("shop_city"));
                    shop.setShop_locality(rs.getString("shop_locality"));
                    shop.setShop_id(rs.getInt("shop_id"));
                    shop.setVendor_id(rs.getInt("vendor_id"));
                    cat.add(shop);
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        return cat;
    }
    public ArrayList<Sub_category> getAllSubbySub(int id) {
        ArrayList<Sub_category> cat = new ArrayList();
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from sub_category where sub_category_id in (select sub_category_id from sub_category_shop where shop_id=?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Sub_category sub=new Sub_category();
                   sub.setSub_category_name(rs.getString("sub_category_name"));
                   sub.setPhoto(rs.getString("photo"));
                   sub.setSub_category_id(rs.getInt("sub_category_id"));
                    
                    cat.add(sub);
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        return cat;
    }
public Shop getbyid(int id) {
       Shop shop =null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from shop where shop_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    shop = new Shop();
                    shop.setShop_name(rs.getString("shop_name"));
                    shop.setShop_address(rs.getString("shop_address"));
                    shop.setShop_Banner(rs.getString("shop_Banner"));
                    shop.setShop_city(rs.getString("shop_city"));
                    shop.setShop_locality(rs.getString("shop_locality"));
                    shop.setShop_id(rs.getInt("shop_id"));
                    shop.setVendor_id(rs.getInt("vendor_id"));
                    
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        return shop;
    }

    public boolean updat1(Shop shop) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "update shop set shop_name=?,shop_address=?,shop_city=?,shop_locality=? where shop_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, shop.getShop_name());
                smt.setString(2, shop.getShop_address());
                smt.setString(3, shop.getShop_city());
                smt.setString(4, shop.getShop_locality());
                smt.setInt(5, shop.getShop_id());
                if (smt.executeUpdate() > 0) {
                    status = true;
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return status;
    }
public boolean update(Shop shop) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "update shop set shop_name=?,shop_address=?,shop_city=?,shop_locality=?,shop_Banner=? where shop_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, shop.getShop_name());
                smt.setString(2, shop.getShop_address());
                smt.setString(3, shop.getShop_city());
                smt.setString(4, shop.getShop_locality());
                smt.setString(5, shop.getShop_Banner());
                smt.setInt(6, shop.getShop_id());
                if (smt.executeUpdate() > 0) {
                    status = true;
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
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
                PreparedStatement smt = null;
                String sql = "select count(*) from sub_category_shop where shop_id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                rs.next();
                int k = rs.getInt(1);
                if (k == 0) {
                    sql = "Delete from shop where shop_id=?";
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
}
