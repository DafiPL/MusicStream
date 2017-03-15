/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author kevin
 */
public class Order {
    private int orderID;
    private String username;
    private int albumID;
     private int quantity;

    public Order(int orderID, String username, int albumID, int quantity) {
        this.orderID = orderID;
        this.username = username;
        this.albumID = albumID;
        this.quantity = quantity;
    }
     public Order( String username, int albumID, int quantity) {
        this.orderID = orderID;
        this.username = username;
        this.albumID = albumID;
        this.quantity = quantity;
    }
    
     public Order() {
        this.orderID = 2;
        this.username = "crackiso";
        this.albumID = 1;
          this.quantity = 1;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAlbumID() {
        return albumID;
    }

    public void setAlbumID(int albumID) {
        this.albumID = albumID;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 47 * hash + this.orderID;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Order other = (Order) obj;
        if (this.orderID != other.orderID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", username=" + username + ", albumID=" + albumID + ", quantity=" + quantity +'}';
    }
    
    
}
