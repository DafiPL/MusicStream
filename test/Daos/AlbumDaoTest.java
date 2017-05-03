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

    private final String testDB = "testdb";

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
        AlbumDao instance = new AlbumDao(testDB);
        Album a = new Album();
        a.setAlbumID(1);
        a.setGenreID(1);
        a.setArtistID(1);
        a.setAlbumName("Motion");
        a.setAlbumPrice(1);
        a.setAmountInStock(1);
        a.setAlbumFormat("dsfg");
        a.setReleaseDate("dfgn");
        a.setAlbumImage("dgbnfghnm");

        int expResult = 1;
        int result = instance.addAlbum(a);
        assertEquals(expResult, result);
    }

    /**
     * Test of getAlbumById method, of class AlbumDao.
     */
    @Test
    public void testGetAlbumById() {
        System.out.println("getAlbumById");
        int albumID = 1;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = new Album(1, 1, 1, "To Pimp A Butterfly", 111, -11, "Vinyl", "2015", "./images/albumPic/kendrick-to-pimp-butterfly.jpg");
        Album result = instance.getAlbumById(albumID);
        assertEquals(expResult, result);

    }
    
    @Test
    public void testGetAlbumByIdNotNull() {
        System.out.println("getAlbumById");
        int albumID = 1;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = new Album(1, 1, 1, "To Pimp A Butterfly", 111, -11, "Vinyl", "2015", "./images/albumPic/kendrick-to-pimp-butterfly.jpg");
        Album result = instance.getAlbumById(albumID);
        assertNotNull(result);

    }

    /**
     * Test of deleteAlbum method, of class AlbumDao.
     */
    @Test
    public void testDeleteAlbum() {
        System.out.println("deleteAlbum");

        int id = 13;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = null;
        instance.deleteAlbum(id);
        Album result = instance.getAlbumById(id);
        assertEquals(expResult, result);

    }

    @Test
    public void testDeleteAlbumIsNull() {
        System.out.println("deleteAlbum");

        int id = 13;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = null;
        instance.deleteAlbum(id);
        Album result = instance.getAlbumById(id);
        assertNull(result);

    }
    /**
     * Test of getAllAlbums method, of class AlbumDao.
     */
    

    @Test
    public void testGetAllAlbumsBySize() {
        System.out.println("getAllAlbums");
        AlbumDao instance = new AlbumDao(testDB);
        int expResult = 20;
        ArrayList<Album> result = instance.getAllAlbums();
        assertEquals(expResult, result.size());

    }
    
    @Test
    public void testGetAllAlbumsBySizeNotNull() {
        System.out.println("getAllAlbums");
        AlbumDao instance = new AlbumDao(testDB);
        int expResult = 20;
        ArrayList<Album> result = instance.getAllAlbums();
        assertNotNull( result.size());

    }

    /**
     * Test of searchForAlbum method, of class AlbumDao.
     */
    @Test
    public void testSearchForAlbum() {
        System.out.println("searchForAlbum");

        String title = "Maad City";
        AlbumDao instance = new AlbumDao(testDB);
        ArrayList<Album> expResult = instance.searchForAlbum(title);
        ArrayList<Album> result = instance.searchForAlbum(title);
        assertEquals(expResult, result);

    }
    
    @Test
    public void testSearchForAlbumNotNull() {
        System.out.println("searchForAlbum");

        String title = "Maad City";
        AlbumDao instance = new AlbumDao(testDB);
        ArrayList<Album> expResult = instance.searchForAlbum(title);
        ArrayList<Album> result = instance.searchForAlbum(title);
        assertNotNull( result);

    }

    @Test
    public void testSearchForAlbumBySize() {
        System.out.println("searchForAlbum");

        String title = "Maad City";
        AlbumDao instance = new AlbumDao(testDB);
        int expResult = 1;
        ArrayList<Album> result = instance.searchForAlbum(title);
        assertEquals(expResult, result.size());

    }
    
    @Test
    public void testSearchForAlbumBySizeNotNull() {
        System.out.println("searchForAlbum");

        String title = "Maad City";
        AlbumDao instance = new AlbumDao(testDB);
        int expResult = 1;
        ArrayList<Album> result = instance.searchForAlbum(title);
        assertNotNull( result.size());

    }

    /**
     * Test of editAllAlbumDetailsById method, of class AlbumDao.
     */
    @Test
    public void testEditAllAlbumDetailsById() {
        System.out.println("editAllAlbumDetailsById");
        int id = 6;
        String Textvalue = "Maad City";
        double NumericValue = 4;
        int choice = 3;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = new Album(6, 2, 4, "Greatest Hits", 91, 7, "Vinyl", "2007", "");
        instance.editAllAlbumDetailsById(id, Textvalue, NumericValue, choice);
        Album result = instance.getAlbumById(id);
        assertEquals(expResult, result);
    }
    
   

    /**
     * Test of updateQuantity method, of class AlbumDao.
     */
    @Test
    public void testUpdateQuantity() {
        System.out.println("updateQuantity");
        int amountInStock = 1;
        int quantity = 12;
        int id = 1;
        AlbumDao instance = new AlbumDao(testDB);
        Album expResult = new Album(1, 1, 1, "To Pimp A Butterfly", 111, -11, "Vinyl", "", "");
        instance.updateQuantity(amountInStock, quantity, id);
        Album result = instance.getAlbumById(id);
        assertEquals(expResult, result);

    }
    
    

}
