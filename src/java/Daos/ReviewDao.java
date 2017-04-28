/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Album;
import Dtos.Review;
import Interfaces.ReviewDaoInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public class ReviewDao extends Dao implements ReviewDaoInterface{
          /**
     *
     * @param databaseName
     */
    public ReviewDao(String databaseName) {
        super(databaseName);
    }
    
    @Override
    public int addReview(Review r) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO reviews (id, username, review, albumid) VALUES (NULL, ?, ?, ?)");

            
            ps.setString(1, r.getUsername());
            ps.setString(2, r.getReview());
            ps.setInt(3, r.getAlbumid());

            rs = ps.executeUpdate();

        } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
            System.out.println("Constraint Exception occurred: " + e.getMessage());
            // Set the rowsAffected to -1, this can be used as a flag for the display section
            rs = -1;
        } catch (SQLException se) {
            System.out.println("SQL Exception occurred");
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the getAllProducts() method: " + e.getMessage());
            }
        }
        return rs;
    }
    
    @Override
    public Review getReviewById(int ReviewID) {
        ArrayList<Review> Reviews = this.getAllReviews();
        Review memberaddress = null;
        for (int i = 0; i < Reviews.size(); i++) {
            if (Reviews.get(i).getId()== ReviewID) {
                memberaddress = Reviews.get(i);
            }

        }
        return memberaddress;
    }

    @Override
    public int deleteReview(int id) {
        Review r = getReviewById(id);
        int rs = 0;

        if (r != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM reviews WHERE id = '" + id + "'");

                rs = st.executeUpdate(query);

            } catch (SQLException se) {
                System.out.println("SQL Exception occurred");
                se.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {

                    if (con != null) {
                        freeConnection(con);
                    }
                } catch (Exception e) {
                    System.out.println("Exception occured in the finally section of the getAllProducts() method: " + e.getMessage());
                }
            }
        }
        return rs;
    }

    /**
     * get db connection, run query get results, loading result set and process
     * , then closing
     *
     * @return displaying all users in the db on screen sql exceptions
     */
    @Override
    public ArrayList<Review> getAllReviews() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Review> Reviews = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from reviews";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Review i = new Review(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("review"),
                        rs.getInt("albumid"));
                       
                Reviews.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllBooks() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the getAllBooks() method: " + e.getMessage());
            }
        }

        return Reviews;

    }

  @Override
    public ArrayList<Review> getAllReviewsByAlbumId(int albumId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Review> Reviews = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from reviews WHERE albumid = '" + albumId + "'";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Review i = new Review(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("review"),
                        rs.getInt("albumid"));
                       
                Reviews.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllBooks() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the getAllBooks() method: " + e.getMessage());
            }
        }

        return Reviews;

    }

   
}
