/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Song;
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
public class SongDaoTest {
    
    public SongDaoTest() {
    }
    
     private final String testDB = "testdb";
     
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
     * Test of addSong method, of class SongDao.
     */
//    @Test
//    public void testAddSong() {
//        System.out.println("addSong");
//        
//        Song s = null;
//        SongDao instance = null;
//        int expResult = 0;
//        int result = instance.addSong(s);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getSongById method, of class SongDao.
     */
    @Test
    public void testGetSongById() {
        System.out.println("getSongById");
        SongDao instance = new SongDao(testDB);
        int SongID = 2;
        
        Song expResult = new Song(2, 1, "Motion", "2012" );
        Song result = instance.getSongById(SongID);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of deleteSong method, of class SongDao.
     */
//    @Test
//    public void testDeleteSong() {
//        System.out.println("deleteSong");
//        int id = 0;
//        SongDao instance = null;
//        int expResult = 0;
//        int result = instance.deleteSong(id);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }

    /**
     * Test of getAllSongs method, of class SongDao.
     */
    @Test
    public void testGetAllSongs() {
        System.out.println("getAllSongs");
        SongDao instance = new SongDao(testDB);
        ArrayList<Song> expResult = null;
        ArrayList<Song> result = instance.getAllSongs();
        assertEquals(expResult, result);
      
    } 

    /**
     * Test of searchForSong method, of class SongDao.
     */
    @Test
    public void testSearchForSong() {
        System.out.println("searchForSong");
        SongDao instance = new SongDao(testDB);
        String title = "Motion";
        
        ArrayList<Song> expResult = null;
        ArrayList<Song> result = instance.searchForSong(title);
        assertEquals(expResult, result);
       
    }
//
//    /**
//     * Test of editAllSongDetailsById method, of class SongDao.
//     */
//    @Test
//    public void testEditAllSongDetailsById() {
//        System.out.println("editAllSongDetailsById");
//        int id = 0;
//        String Textvalue = "";
//        double NumericValue = 0.0;
//        int choice = 0;
//        SongDao instance = null;
//        int expResult = 0;
//        int result = instance.editAllSongDetailsById(id, Textvalue, NumericValue, choice);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
    
}
