/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Review;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface ReviewDaoInterface {
    public int addReview(Review r);
    public Review getReviewById(int ReviewID);
    public int deleteReview(int id);
    public ArrayList<Review> getAllReviews();
    public ArrayList<Review> getAllReviewsByAlbumId(int albumId);
}
