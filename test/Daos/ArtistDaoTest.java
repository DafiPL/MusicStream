/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Artist;
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
public class ArtistDaoTest {

    private final String testDB = "testdb";

    public ArtistDaoTest() {
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
     * Test of addArtist method, of class ArtistDao.
     */
    @Test
    public void testAddArtist() {
        System.out.println("addArtist");
        Artist a = new Artist();
        a.setArtistName("Kevin");
        a.setArtistAge(19);
        a.setArtistBio("nice");
        a.setArtistPicture("");
        
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = new Artist(10, "kevin", 19, "nice", "");
        instance.addArtist(a);
        Artist result =  instance.getArtistById(10);
        assertEquals(expResult, result);
        
       
    }
    /**
     * Test of getArtistById method, of class ArtistDao.
     */
    @Test
    public void testGetArtistById() {
        System.out.println("getArtistById");
        int artistID = 2;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = new Artist(2, "Skepta", 29, "Grime Music Revolutionary, crowned \"Lord of The Mic\". 4 studio albums as of January 2017", "./images/artists/Skepta.jpg");
        Artist result = instance.getArtistById(artistID);
        assertEquals(expResult, result);
    }  
    
        
        @Test
    public void testGetArtistByIdNotNull() {
        System.out.println("getArtistById");
        int artistID = 2;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = new Artist(2, "Skepta", 29, "Grime Music Revolutionary, crowned \"Lord of The Mic\". 4 studio albums as of January 2017", "./images/artists/Skepta.jpg");
        Artist result = instance.getArtistById(artistID);
        assertNotNull( result);
        
    }

    /**
     * Test of deleteArtist method, of class ArtistDao.
     */
    @Test
    public void testDeleteArtist() {
        System.out.println("deleteArtist");
        int id = 13;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = null;
        instance.deleteArtist(id);
        Artist result = instance.getArtistById(id);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testDeleteArtistIsNull() {
        System.out.println("deleteArtist");
        int id = 13;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = null;
        instance.deleteArtist(id);
        Artist result = instance.getArtistById(id);
        assertNull( result);
        
    }
    /**
     * Test of getAllArtists method, of class ArtistDao.
     */
    
    
    @Test
    public void testGetAllArtists() {
        System.out.println("getAllArtists");
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 25;
        ArrayList<Artist> result = instance.getAllArtists();
        assertEquals(expResult, result.size());
    }

    @Test
    public void testGetAllArtistsNotNull() {
        System.out.println("getAllArtists");
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 25;
        ArrayList<Artist> result = instance.getAllArtists();
        assertNotNull( result.size());
    }
    /**
     * Test of searchForArtist method, of class ArtistDao.
     */
    @Test
    public void testSearchForArtist() {
        System.out.println("searchForArtist");
        String title = "Skepta";
        ArtistDao instance = new ArtistDao(testDB);
        ArrayList<Artist> expResult = instance.searchForArtist(title);
        ArrayList<Artist> result = instance.searchForArtist(title);
        assertEquals(expResult, result);

    }
    
        @Test
    public void testSearchForArtistNotNull() {
        System.out.println("searchForArtist");
        String title = "Skepta";
        ArtistDao instance = new ArtistDao(testDB);
        ArrayList<Artist> expResult = instance.searchForArtist(title);
        ArrayList<Artist> result = instance.searchForArtist(title);
        assertNotNull( result);

    }
    
    @Test
    public void testSearchForArtistBySize() {
        System.out.println("searchForArtist");
        String title = "Skepta";
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 1;
        ArrayList<Artist> result = instance.searchForArtist(title);
        assertEquals(expResult, result.size());

    }
    
    @Test
    public void testSearchForArtistBySizeNotNull() {
        System.out.println("searchForArtist");
        String title = "Skepta";
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 1;
        ArrayList<Artist> result = instance.searchForArtist(title);
        assertNotNull(result.size());

    }

    /**
     * Test of editAllArtistDetailsById method, of class ArtistDao.
     */
    @Test
    public void testEditAllArtistDetailsById() {
        System.out.println("editAllArtistDetailsById");
        int id = 3;
        String Textvalue = "king of the hill";
        double NumericValue = 0.0;
        int choice = 4;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = new Artist(3, "Guns n' Roses", 50, "Lgends, nothing more to add..", "./images/artists/guns.jpg");
        instance.editAllArtistDetailsById(id, Textvalue, NumericValue, choice);
        Artist result = instance.getArtistById(id);
        assertEquals(expResult, result);

    }

}
