/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Album;
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
public class AlbumDaoTest {
    
    public AlbumDaoTest() {
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
     * Test of addAlbum method, of class AlbumDao.
     */
    @Test
    public void testAddAlbum() {
        System.out.println("addAlbum");
        Album a = null;
        AlbumDao instance = null;
        int expResult = 0;
        int result = instance.addAlbum(a);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAlbumById method, of class AlbumDao.
     */
    @Test
    public void testGetAlbumById() {
        System.out.println("getAlbumById");
        int albumID = 0;
        AlbumDao instance = null;
        Album expResult = null;
        Album result = instance.getAlbumById(albumID);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteAlbum method, of class AlbumDao.
     */
    @Test
    public void testDeleteAlbum() {
        System.out.println("deleteAlbum");
        int id = 0;
        AlbumDao instance = null;
        int expResult = 0;
        int result = instance.deleteAlbum(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllAlbums method, of class AlbumDao.
     */
    @Test
    public void testGetAllAlbums() {
        System.out.println("getAllAlbums");
        AlbumDao instance = null;
        ArrayList<Album> expResult = null;
        ArrayList<Album> result = instance.getAllAlbums();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of searchForAlbum method, of class AlbumDao.
     */
    @Test
    public void testSearchForAlbum() {
        System.out.println("searchForAlbum");
        String title = "";
        AlbumDao instance = null;
        ArrayList<Album> expResult = null;
        ArrayList<Album> result = instance.searchForAlbum(title);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of editAllAlbumDetailsById method, of class AlbumDao.
     */
    @Test
    public void testEditAllAlbumDetailsById() {
        System.out.println("editAllAlbumDetailsById");
        int id = 0;
        String Textvalue = "";
        double NumericValue = 0.0;
        int choice = 0;
        AlbumDao instance = null;
        int expResult = 0;
        int result = instance.editAllAlbumDetailsById(id, Textvalue, NumericValue, choice);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateQuantity method, of class AlbumDao.
     */
    @Test
    public void testUpdateQuantity() {
        System.out.println("updateQuantity");
        int amountInStock = 0;
        int quantity = 0;
        int id = 0;
        AlbumDao instance = null;
        int expResult = 0;
        int result = instance.updateQuantity(amountInStock, quantity, id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
