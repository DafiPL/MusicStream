/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Genre;
import Interfaces.GenreDaoInterface;
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
public class GenreDao extends Dao implements GenreDaoInterface {

    /**
     *
     * @param databaseName
     */
    public GenreDao(String databaseName) {
        super(databaseName);
    }
/**
     * This method allows the user to add a new Album to the Album table
     * @param g Genre to be added to the database..
    
     * 
     * @return RS a Which is the album Added to the database
     */
    @Override
    public int addGenre(Genre g) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO genre (genreID, genreName) VALUES (NULL, ?)");

            ps.setString(1, g.getGenre());

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
       /**
     * gets Genres by ID in the database by
     * matching the code supplied as a parameter. This method has
     *
     * @param genreID The the ID of Genre found in the database.
     * 
     * @return The Genre Which is the Genre returned from the database
     */

    @Override
    public Genre getGenreById(int genreID) {
        ArrayList<Genre> genres = this.getAllGenres();
        Genre genre = null;
        for (int i = 0; i < genres.size(); i++) {
            if (genres.get(i).getId() == genreID) {
                genre = genres.get(i);
            }

        }
        return genre;
    }
     /**
     * This method allows the user to DELETE an Album from the Album table
     * @param id name of the Genre to be found in database.
     * 
     * 
     * @return rs = 1  if an Genre was deleted successfully from the database.
     */

    @Override
    public int deleteGenre(int id) {
        Genre m = getGenreById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM genre WHERE genreID = '" + id + "'");

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
    public ArrayList<Genre> getAllGenres() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Genre> genres = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from genre";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Genre i = new Genre(rs.getInt("genreID"),
                        rs.getString("genreName"));
                genres.add(i);
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

        return genres;

    }

    /**
     * get db connection, run query get results, loading result set and process
     * , then closing
     *
     * @param title
     * @return user enters title of an item they want to display query searches
     * through the db to see if the title exists and displays details if doesn't
     * exists gets error. exception handling
     */
    @Override
    public ArrayList<Genre> searchForGenre(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Genre> genres = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from genre where genreName = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Genre i = new Genre(rs.getInt("genreID"),
                        rs.getString("genreName"));
                genres.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllMembers() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the getAllMembers() method: " + e.getMessage());
            }
        }

        return genres;
    }

    @Override
    public int editAllGenreDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE genre SET grenreID = ? WHERE genreID = ?";

                int myInt = (int) NumericValue;
                ps = con.prepareStatement(query);
                ps.setInt(1, myInt);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE genre SET genreName = ? WHERE genreID = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println("Exception occured in the editAllGenreDetailsById() method: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the editAllBookDetailsById() method");
                e.getMessage();
            }
        }

        return rowsAffected;
    }
}
