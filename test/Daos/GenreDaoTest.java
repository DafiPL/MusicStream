/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Genre;
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
public class GenreDaoTest {
    
    public GenreDaoTest() {
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
     * Test of addGenre method, of class GenreDao.
     */
//    @Test
//    public void testAddGenre() {
//      
//        System.out.println("addGenre");
//        GenreDao instance = new GenreDao(testDB);
//        Genre g = new Genre();
//
//        
//        g.setGenre("Test");
//        
//
//        int expResult = 1;
//        int result = instance.addGenre(g);
//        
//        assertEquals(expResult, result);
//// search user to confirm
//        instance.deleteGenre(9);
//    }
    

    /**
     * Test of getGenreById method, of class GenreDao.
     */
    @Test
    public void testGetGenreById() {
        System.out.println("getGenreById");
        GenreDao instance = new GenreDao(testDB);
        int genreID = 1;
       
        Genre expResult = new Genre(1 , "Metal");;
        Genre result = instance.getGenreById(genreID);
        assertEquals(expResult, result);
        
    }

    /**
     * Test of deleteGenre method, of class GenreDao.
     */
//    @Test
//    public void testDeleteGenre() {
//        System.out.println("deleteGenre");
//        GenreDao instance = new GenreDao(testDB);
//        int id = 13;
//        
//        int expResult = 1;
//        int result = instance.deleteGenre(id);
//        assertEquals(expResult, result);
//        
//    }

    /**
     * Test of getAllGenres method, of class GenreDao.
     */
    @Test
    public void testGetAllGenres() {
        System.out.println("getAllMembers");
        GenreDao instance = new GenreDao(testDB);
        //Only normal Users UserType = 'user'
        int expResult = 5;
        ArrayList<Genre> result = instance.getAllGenres();
        assertEquals(expResult, result.size());
    }

    /**
     * Test of searchForGenre method, of class GenreDao.
     */
    @Test
    public void testSearchForGenre() {
        System.out.println("searchForGenre");
        GenreDao instance = new GenreDao(testDB);
        String genreName = "Metal";
        int expResult = 1;
        ArrayList<Genre> result = instance.searchForGenre(genreName);
        assertEquals(expResult, result.size());
    }

    /**
     * Test of editAllGenreDetailsById method, of class GenreDao.
     */
    @Test
    public void testEditAllGenreDetailsById() {
        System.out.println("editAllGenreDetailsById");
        GenreDao instance = new GenreDao(testDB);
        int id = 1;
        String Textvalue = "Metal";
        double NumericValue = 0.0;
        int choice = 2;
        
        int expResult = 1;
        int result = instance.editAllGenreDetailsById(id, Textvalue, NumericValue, choice);
        assertEquals(expResult, result);
        
    }
    
}
