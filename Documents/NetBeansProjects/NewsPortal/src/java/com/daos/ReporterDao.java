/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.daos;

import com.beans.Reporter;
import com.pool.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhishek Kumar
 */
public class ReporterDao {

    public boolean add(Reporter reporter) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "Insert into reporter(name,contact,email,userid,password,image,gender,status,address,dob)values(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, reporter.getName());
                smt.setString(2, reporter.getContact());
                smt.setString(3, reporter.getEmail());
                smt.setString(4, reporter.getUserid());
                smt.setString(5, reporter.getPassword());
                smt.setString(6, reporter.getImage());
                smt.setString(7, reporter.getGender());
                smt.setString(8, reporter.getStatus());
                smt.setString(9, reporter.getAddress());
                smt.setString(10, reporter.getDob());
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
                String sql = "Delete from reporter where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);

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

    public Reporter getById(int id) {
        Reporter reporter = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from reporter where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    reporter = new Reporter();
                    reporter.setId(rs.getInt("id"));
                    reporter.setName(rs.getString("name"));
                    reporter.setContact(rs.getString("contact"));
                    reporter.setEmail(rs.getString("email"));
                    reporter.setUserid(rs.getString("userid"));
                    reporter.setPassword(rs.getString("password"));
                    reporter.setImage(rs.getString("image"));
                    reporter.setGender(rs.getString("gender"));
                    reporter.setStatus(rs.getString("status"));
                    reporter.setAddress(rs.getString("address"));
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return reporter;
    }

    public ArrayList<Reporter> getAllRecords() {
        
        ArrayList<Reporter> users = new ArrayList();
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        
        if (con != null) {
            try {
                String sql = "select * from reporter";
                PreparedStatement smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Reporter reporter = new Reporter();
                    reporter.setId(rs.getInt("id"));
                    reporter.setName(rs.getString("name"));
                    reporter.setContact(rs.getString("contact"));
                    reporter.setEmail(rs.getString("email"));
                    reporter.setUserid(rs.getString("userid"));
                    reporter.setPassword(rs.getString("password"));
                    reporter.setImage(rs.getString("image"));
                    reporter.setGender(rs.getString("gender"));
                    reporter.setStatus(rs.getString("status"));
                    reporter.setAddress(rs.getString("address"));
                    users.add(reporter);
                }
                
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return users;
    }

    public ArrayList<Reporter> getRecordByLimit(int start, int end) {

        ArrayList<Reporter> users = new ArrayList<Reporter>();
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from user limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Reporter reporter = new Reporter();
                    reporter.setId(rs.getInt("id"));
                    reporter.setName(rs.getString("name"));
                    reporter.setContact(rs.getString("contact"));
                    reporter.setEmail(rs.getString("email"));
                    reporter.setUserid(rs.getString("userid"));
                    reporter.setPassword(rs.getString("password"));
                    reporter.setImage(rs.getString("image"));
                    reporter.setGender(rs.getString("gender"));
                    reporter.setStatus(rs.getString("status"));
                    reporter.setAddress(rs.getString("address"));
                    users.add(reporter);
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return users;
    }

    public int getRecordsCount() {

        int total = 0;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select count(*) from reporter";
                PreparedStatement smt = con.prepareStatement(sql);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return total;
    }

    public boolean update(Reporter reporter) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "update reporter set name=?,contact=?,email=?,image=?,gender=?,address=? where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, reporter.getName());
                smt.setString(2, reporter.getContact());
                smt.setString(3, reporter.getEmail());
                smt.setString(4, reporter.getImage());
                smt.setString(5, reporter.getGender());
                smt.setString(6, reporter.getAddress());
                smt.setInt(7, reporter.getId());
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
 public boolean updat1(Reporter reporter) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "update reporter set name=?,contact=?,email=?,gender=?,address=? where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, reporter.getName());
                smt.setString(2, reporter.getContact());
                smt.setString(3, reporter.getEmail());
                smt.setString(4, reporter.getGender());
                smt.setString(5, reporter.getAddress());
                smt.setInt(6, reporter.getId());
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
public boolean updat2(String encoded,int id) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "update reporter set password=? where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, encoded);
                smt.setInt(2,id);
                
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

    public boolean isContactExist(String contact) {

        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from reporter where contact=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, contact);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
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

    public boolean isUseridExist(String userid) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from reporter where userid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, userid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
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

    public boolean isEmailExist(String email) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from reporter where contact=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, email);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
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

    public Reporter isValid(String userid, String password) {
        Reporter reporter = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from reporter where userid=? and password=? and status='approved'";
                PreparedStatement smt = con.prepareStatement(sql);
                String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
                smt.setString(1, userid);
                smt.setString(2, encodedPassword);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    reporter = new Reporter();
                    reporter.setId(rs.getInt("id"));
                    reporter.setName(rs.getString("name"));
                    reporter.setDob(rs.getString("dob"));
                    reporter.setGender(rs.getString("gender"));
                    reporter.setUserid(rs.getString("userid"));
                    reporter.setPassword(rs.getString("password"));
                    reporter.setImage(rs.getString("image"));
                    reporter.setContact(rs.getString("contact"));
                    reporter.setEmail(rs.getString("email"));
                    reporter.setStatus(rs.getString("status"));
                    reporter.setAddress(rs.getString("address"));
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return reporter;
    }
}
