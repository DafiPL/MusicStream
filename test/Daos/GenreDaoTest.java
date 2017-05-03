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
    @Test
    public void testAddGenre() {
      
        System.out.println("addGenre");
        GenreDao instance = new GenreDao(testDB);
        Genre g = new Genre();
        int id = 4;
        
        g.setGenre("calm");
        

        Genre expResult = new Genre(id, "calm");
        instance.addGenre(g);
        Genre result = instance.getGenreById(id);
        
        assertEquals(expResult, result);

        
    }
    

    /**
     * Test of getGenreById method, of class GenreDao.
     */
    @Test
    public void testGetGenreById() {
        System.out.println("getGenreById");
        GenreDao instance = new GenreDao(testDB);
        int genreID = 1;
       
        Genre expResult = new Genre(1 , "Metal");
        Genre result = instance.getGenreById(genreID);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testGetGenreByIdNotNull() {
        System.out.println("getGenreById");
        GenreDao instance = new GenreDao(testDB);
        int genreID = 1;
       
        Genre result = instance.getGenreById(genreID);
        assertNotNull( result);
        
    }

    /**
     * Test of deleteGenre method, of class GenreDao.
     */
    @Test
    public void testDeleteGenre() {
        System.out.println("deleteGenre");
        GenreDao instance = new GenreDao(testDB);
        int id = 13;
        
        Genre expResult = null;
        instance.deleteGenre(id);
        Genre result = instance.getGenreById(id);
        assertEquals(expResult, result);
        
    }
    
    @Test
    public void testDeleteGenreIsNull() {
        System.out.println("deleteGenre");
        GenreDao instance = new GenreDao(testDB);
        int id = 13;
        
        Genre expResult = null;
        instance.deleteGenre(id);
        Genre result = instance.getGenreById(id);
        assertNull( result);
        
    }

    /**
     * Test of getAllGenres method, of class GenreDao.
     */
    @Test
    public void testGetAllGenres() {
        System.out.println("getAllMembers");
        GenreDao instance = new GenreDao(testDB);
        //Only normal Users UserType = 'user'
        int expResult = 1;
        ArrayList<Genre> result = instance.getAllGenres();
        assertEquals(expResult, result.size());
    }
    
    @Test
    public void testGetAllGenresNotNull() {
        System.out.println("getAllMembers");
        GenreDao instance = new GenreDao(testDB);
        //Only normal Users UserType = 'user'
        int expResult = 3;
        ArrayList<Genre> result = instance.getAllGenres();
        assertNotNull( result.size());
    }

    /**
     * Test of searchForGenre method, of class GenreDao.
     */
    @Test
    public void testSearchForGenre() {
        System.out.println("searchForGenre");
        GenreDao instance = new GenreDao(testDB);
        String genreName = "Hard Rock";
        Genre g = new Genre();
        g.setId(3);
        g.setGenre(genreName);
        ArrayList<Genre> expResult = new ArrayList<Genre>();
        expResult.add(g);
        ArrayList<Genre> result = instance.searchForGenre(genreName);
        assertEquals(expResult, result);
    }
    
    @Test
    public void testSearchForGenreNotNull() {
        System.out.println("searchForGenre");
        GenreDao instance = new GenreDao(testDB);
        String genreName = "Hard Rock";
        Genre g = new Genre();
        g.setId(2);
        g.setGenre(genreName);
        ArrayList<Genre> expResult = new ArrayList<Genre>();
        expResult.add(g);
        ArrayList<Genre> result = instance.searchForGenre(genreName);
        assertNotNull( result);
    }
    
    @Test
    public void testSearchForGenreBySize() {
        System.out.println("searchForGenre");
        GenreDao instance = new GenreDao(testDB);
        String genreName = "Hard Rock";
        
        int expResult = 1;
        ArrayList<Genre> result = instance.searchForGenre(genreName);
        assertEquals(expResult, result.size());
    }
    
    @Test
    public void testSearchForGenreBySizeNotNull() {
        System.out.println("searchForGenre");
        GenreDao instance = new GenreDao(testDB);
        String genreName = "Hard Rock";
        
        int expResult = 1;
        ArrayList<Genre> result = instance.searchForGenre(genreName);
        assertNotNull(result.size());
    }

    /**
     * Test of editAllGenreDetailsById method, of class GenreDao.
     */
    @Test
    public void testEditAllGenreDetailsById() {
        System.out.println("editAllGenreDetailsById");
        GenreDao instance = new GenreDao(testDB);
        int id = 1;
        String Textvalue = "rock";
        double NumericValue = 0.0;
        int choice = 2;
        
        Genre expResult = new Genre(1, Textvalue);
        instance.editAllGenreDetailsById(id, Textvalue, NumericValue, choice);
        Genre result = instance.getGenreById(id);
        assertEquals(expResult, result);
        
    }
    
}
