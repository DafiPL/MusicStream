/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Review;
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
public class ReviewDaoTest {

    private final String testDB = "testdb";

    public ReviewDaoTest() {
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
     * Test of addReview method, of class ReviewDao.
     */
    @Test
    public void testAddReview() {
        System.out.println("addReview");
        Review r = new Review();
        ReviewDao instance = new ReviewDao(testDB);
        r.setId(15);
        r.setReview("very good");
        r.setUsername("dafi");
        r.setAlbumid(8);
        Review expResult = new Review(9, "dafi", "very good", 8);
        instance.addReview(r);
        Review result = instance.getReviewById(9);
        assertEquals(expResult, result);
        instance.deleteReview(15);
        

    }

    /**
     * Test of getReviewById method, of class ReviewDao.
     */
    @Test
    public void testGetReviewById() {
        System.out.println("getReviewById");
        int ReviewID = 2;
        ReviewDao instance = new ReviewDao(testDB);
        Review expResult = new Review(2, "dafi", "vey bad", 1);
        Review result = instance.getReviewById(ReviewID);
        assertEquals(expResult, result);

    }

    @Test
    public void testGetReviewByIdNotNull() {
        System.out.println("getReviewById");
        int ReviewID = 2;
        ReviewDao instance = new ReviewDao(testDB);

        Review result = instance.getReviewById(ReviewID);
        assertNotNull(result);

    }

    /**
     * Test of deleteReview method, of class ReviewDao.
     */
    @Test
    public void testDeleteReview() {
        System.out.println("deleteReview");
        int id = 5;
        ReviewDao instance = new ReviewDao(testDB);

        Review expResult = null;
        instance.deleteReview(id);
        Review result = instance.getReviewById(id);
        assertEquals(expResult, result);

    }

    @Test
    public void testDeleteReviewIsNull() {
        System.out.println("deleteReview");
        int id = 5;
        ReviewDao instance = new ReviewDao(testDB);

        instance.deleteReview(id);
        Review result = instance.getReviewById(id);
        assertNull(result);
    }

    /**
     * Test of getAllReviews method, of class ReviewDao.
     */
    @Test
    public void testGetAllReviews() {
        System.out.println("getAllReviews");
        
        
        ReviewDao instance = new ReviewDao(testDB);
        int expResult = 11;

        ArrayList<Review> result = instance.getAllReviews();
        assertEquals(expResult, result.size());

    }

    /**
     * Test of getAllReviewsByAlbumId method, of class ReviewDao.
     */
    @Test
    public void testGetAllReviewsByAlbumId() {
        System.out.println("getAllReviewsByAlbumId");
        int albumId = 7;
        ReviewDao instance = new ReviewDao(testDB);
        int expResult = 1;

        ArrayList<Review> result = instance.getAllReviewsByAlbumId(albumId);
        assertEquals(expResult, result.size());

    }

    @Test
    public void testGetAllReviewsByAlbumIdNotNull() {
        System.out.println("getAllReviewsByAlbumId");
        int albumId = 7;
        ReviewDao instance = new ReviewDao(testDB);

        ArrayList<Review> result = instance.getAllReviewsByAlbumId(albumId);
        assertNotNull(result.size());

    }
}
