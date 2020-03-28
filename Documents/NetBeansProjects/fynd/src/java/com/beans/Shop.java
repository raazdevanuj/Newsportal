/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

/**
 *
 * @author Abhishek Kumar
 */
public class Shop {
    int shop_id,vendor_id;
    String shop_name,shop_Banner,shop_address,shop_locality,status;

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getVendor_id() {
        return vendor_id;
    }

    public void setVendor_id(int vendor_id) {
        this.vendor_id = vendor_id;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getShop_Banner() {
        return shop_Banner;
    }

    public void setShop_Banner(String shop_Banner) {
        this.shop_Banner = shop_Banner;
    }

    public String getShop_address() {
        return shop_address;
    }

    public void setShop_address(String shop_address) {
        this.shop_address = shop_address;
    }

    public String getShop_locality() {
        return shop_locality;
    }

    public void setShop_locality(String shop_locality) {
        this.shop_locality = shop_locality;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
