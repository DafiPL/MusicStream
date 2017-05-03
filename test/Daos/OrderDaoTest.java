/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Order;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author kevin
 */
public class OrderDaoTest {
            private final String testDB = "testdb";

    public OrderDaoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of addOrder method, of class OrderDao.
     */
    @Test
    public void testAddOrder() {
        System.out.println("addOrder");
        Order o = new Order();
        OrderDao instance = new OrderDao(testDB);
        o.setAlbumID(2);
        o.setPrice(45);
        o.setQuantity(3);
        o.setUsername("dafi");
        Order expResult = new Order(36, "dafi", 2, 3, 45);
        instance.addOrder(o);
        Order result = instance.getOrderById(36);
        assertEquals(expResult, result);
    }

    /**
     * Test of getOrderById method, of class OrderDao.
     */
    @Test
    public void testGetOrderById() {
        System.out.println("getOrderById");
        int orderID = 26;
        OrderDao instance = new OrderDao(testDB);
        Order expResult = new Order(26, "dafi", 4, 2, 60);
        Order result = instance.getOrderById(orderID);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of deleteOrder method, of class OrderDao.
     */
    @Test
    public void testDeleteOrder() {
        System.out.println("deleteOrder");
        int id = 32;
        OrderDao instance = new OrderDao(testDB);
        Order expResult = null;
        instance.deleteOrder(id);
        Order result = instance.getOrderById(id);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of getAllOrders method, of class OrderDao.
     */
    @Test
    public void testGetAllOrders() {
        System.out.println("getAllOrders");
        OrderDao instance = new OrderDao(testDB);
        ArrayList<Order> expResult = instance.getAllOrders();
        ArrayList<Order> result = instance.getAllOrders();
        assertEquals(expResult, result);
        
    }

    /**
     * Test of searchForOrder method, of class OrderDao.
     */
    @Test
    public void testSearchForOrder() {
        System.out.println("searchForOrder");
        String title = "admin";
        Order o = new Order();
        OrderDao instance = new OrderDao(testDB);
        ArrayList<Order> expResult = new ArrayList<Order>();
        o.setOrderID(26);
        o.setAlbumID(4);
        o.setPrice(60);
        o.setQuantity(2);
        o.setUsername("admin");
        expResult.add(o);
        ArrayList<Order> result = instance.searchForOrder(title);
        assertEquals(expResult, result);
    }

    /**
     * Test of editAllOrderDetailsById method, of class OrderDao.
     */
    @Test
    public void testEditAllOrderDetailsById() {
        System.out.println("editAllOrderDetailsById");
        int id = 27;
        String Textvalue = "bob";
        double NumericValue = 0.0;
        int choice = 1;
        OrderDao instance = new OrderDao(testDB);
        Order o = new Order();
        ArrayList<Order> expResult = new ArrayList<Order>();
        o.setOrderID(27);
        o.setAlbumID(4);
        o.setPrice(60);
        o.setQuantity(2);
        o.setUsername("bob");
        expResult.add(o);
        instance.editAllOrderDetailsById(id, Textvalue, NumericValue, choice);
        ArrayList<Order> result = instance.selectAllOrdersByUser("bob");
        assertEquals(expResult, result);
       
    }

    /**
     * Test of selectAllOrdersByUser method, of class OrderDao.
     */
    @Test
    public void testSelectAllOrdersByUser() {
        System.out.println("selectAllOrdersByUser");
        String username = "admin";
        OrderDao instance = new OrderDao(testDB);
        int expResult = 1;
        ArrayList<Order> result = instance.selectAllOrdersByUser(username);
        assertEquals(expResult, result.size());
    }
    
}
