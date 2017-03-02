/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Order;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface OrderDaoInterface {
    public int editAllOrderDetailsById(int id, String Textvalue, double NumericValue, int choice);
    public ArrayList<Order> searchForOrder(String title);
    public ArrayList<Order> getAllOrders();
    public int deleteOrder(int id);
    public Order getOrderById(int orderID);
    public int addOrder(Order o);
    public ArrayList<Order> selectAllOrdersByUser(String username);
    
}
