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
        a.setArtistBio("dgshsd");
        a.setArtistPicture("sdghfdsgh");
        
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 1;
        int result = instance.addArtist(a);
        assertEquals(expResult, result);
       
    }
    /**
     * Test of getArtistById method, of class ArtistDao.
     */
    @Test
    public void testGetArtistById() {
        System.out.println("getArtistById");
        int artistID = 1;
        ArtistDao instance = new ArtistDao(testDB);
        Artist expResult = new Artist(1, "Kendrick Lamar", 27, "From Compton, LA", "./images/artists/kendrick.jpg");
        Artist result = instance.getArtistById(artistID);
        assertEquals(expResult, result);

    }

    /**
     * Test of deleteArtist method, of class ArtistDao.
     */
    @Test
    public void testDeleteArtist() {
        System.out.println("deleteArtist");
        int id = 13;
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 1;
        int result = instance.deleteArtist(id);
        assertEquals(expResult, result);
        
    }
    /**
     * Test of getAllArtists method, of class ArtistDao.
     */
    @Test
    public void testGetAllArtists() {
        System.out.println("getAllArtists");
        ArtistDao instance = new ArtistDao(testDB);
        Artist artist = new Artist(1, "Kendrick Lamaer", 27, "Well Lad!!", "./images/artists/kendrick.jpg");

        
        ArrayList<Artist> expResult = instance.getAllArtists();
        ArrayList<Artist> result = instance.getAllArtists();
        assertEquals(expResult, result);

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

    /**
     * Test of editAllArtistDetailsById method, of class ArtistDao.
     */
    @Test
    public void testEditAllArtistDetailsById() {
        System.out.println("editAllArtistDetailsById");
        int id = 1;
        String Textvalue = "Well Lad!!";
        double NumericValue = 0.0;
        int choice = 4;
        ArtistDao instance = new ArtistDao(testDB);
        int expResult = 1;
        int result = instance.editAllArtistDetailsById(id, Textvalue, NumericValue, choice);
        assertEquals(expResult, result);

    }

}
