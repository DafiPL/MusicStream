/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Artist;
import Interfaces.ArtistDaoInterface;
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
public class ArtistDao extends Dao implements ArtistDaoInterface {

    /**
     *
     * @param databaseName
     */
    public ArtistDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public int addArtist(Artist a) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO artists (artistID, artistName, artistAge, artistBio, artistPicture) VALUES (NULL, ?, ?, ?, ?)");

            
            ps.setString(1, a.getArtistName());
            ps.setInt(2, a.getArtistAge());
            ps.setString(3, a.getArtistBio());
            ps.setString(4, a.getArtistPicture());

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
    public Artist getArtistById(int artistID) {
        ArrayList<Artist> artists = this.getAllArtists();
        Artist artist = null;
        for (int i = 0; i < artists.size(); i++) {
            if (artists.get(i).getArtistID() == artistID) {
                artist = artists.get(i);
            }

        }
        return artist;
    }

    @Override
    public int deleteArtist(int id) {
        Artist m = getArtistById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM artists WHERE artistID = '" + id + "'");

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
    public ArrayList<Artist> getAllArtists() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Artist> artists = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from artists";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Artist i = new Artist(
                        rs.getInt("artistID"),
                        rs.getString("artistName"),
                        rs.getInt("artistAge"),
                        rs.getString("artistBio"),
                        rs.getString("artistPicture"));

                artists.add(i);
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

        return artists;

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
    public ArrayList<Artist> searchForArtist(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Artist> artists = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from artists where artistName = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Artist i = new Artist(
                        rs.getInt("artistID"),
                        rs.getString("artistName"),
                        rs.getInt("artistAge"),
                        rs.getString("artistBio"),
                        rs.getString("artistPicture"));

                artists.add(i);
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

        return artists;
    }

    @Override
    public int editAllArtistDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            switch (choice) {
                case 1:
                    {
                        String query = "UPDATE artists SET artistId = ? WHERE artistID = ?";
                        int myInt = (int) NumericValue;
                        ps = con.prepareStatement(query);
                        ps.setInt(1, myInt);
                        ps.setInt(2, id);
                        rowsAffected = ps.executeUpdate();
                        break;
                    }
                case 2:
                    {
                        String query = "UPDATE artists SET artistName = ? WHERE artistID = ?";
                        ps = con.prepareStatement(query);
                        ps.setString(1, Textvalue);
                        ps.setInt(2, id);
                        rowsAffected = ps.executeUpdate();
                        break;
                    }
                case 3:
                    {
                        String query = "UPDATE artists SET artistAge = ? WHERE artistID = ?";
                        int myInt = (int) NumericValue;
                        ps = con.prepareStatement(query);
                        ps.setInt(1, myInt);
                        
                        ps.setInt(2, id);
                        rowsAffected = ps.executeUpdate();
                        break;
                    }
                case 4:
                    {
                        String query = "UPDATE artists SET artistBio = ? WHERE artistID = ?";
                        ps = con.prepareStatement(query);
                        ps.setString(1, Textvalue);
                        ps.setInt(2, id);
                        rowsAffected = ps.executeUpdate();
                        break;
                    }
                case 5:
                    {
                        String query = "UPDATE artists SET artistPicture = ? WHERE artistID = ?";
                        ps = con.prepareStatement(query);
                        ps.setString(1, Textvalue);
                        ps.setInt(2, id);
                        rowsAffected = ps.executeUpdate();
                        break;
                    }
                default:
                    break;
            }

        } catch (SQLException e) {
            System.out.println("Exception occured in the editAllBookDetailsById() method: " + e.getMessage());
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
