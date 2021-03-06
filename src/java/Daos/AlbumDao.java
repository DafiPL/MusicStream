/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Album;
import Interfaces.AlbumDaoInterface;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author kevin
 */
public class AlbumDao extends Dao implements AlbumDaoInterface {

    /**
     *
     * @param databaseName
     */
    public AlbumDao(String databaseName) {
        super(databaseName);
    }

    /**
     * This method allows the user to add a new Album to the Album table
     *
     * @param a Album to be added to the database..
     *
     *
     * @return RS a Which is the album Added to the database
     */
    @Override
    public int addAlbum(Album a) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO albums(albumID, genreID, artistID, albumName, albumPrice, amountInStock, albumFormat, releaseDate, albumImage) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?)");

            ps.setInt(1, a.getGenreID());
            ps.setInt(2, a.getArtistID());
            ps.setString(3, a.getAlbumName());
            ps.setDouble(4, a.getAlbumPrice());
            ps.setInt(5, a.getAmountInStock());
            ps.setString(6, a.getAlbumFormat());
            ps.setString(7, a.getReleaseDate());
            ps.setString(8, a.getAlbumImage());

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
     * gets albums by ID in the database by matching the code supplied as a
     * parameter. This method has
     *
     * @param albumID The the ID of album found in the database.
     *
     * @return The ALBUM a Which is the album returned from the database
     */

    @Override
    public Album getAlbumById(int albumID) {
        ArrayList<Album> albums = this.getAllAlbums();
        Album album = null;
        for (int i = 0; i < albums.size(); i++) {
            if (albums.get(i).getAlbumID() == albumID) {
                album = albums.get(i);
            }

        }
        return album;
    }

    /**
     * This method allows the user to DELETE an Album from the Album table
     *
     * @param id name of the album to be found in database.
     *
     *
     * @return true if an album was deleted successfully from the database.
     */
    @Override
    public int deleteAlbum(int id) {
        Album m = getAlbumById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM albums WHERE albumID = '" + id + "'");

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
    public ArrayList<Album> getAllAlbums() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Album> albums = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from albums";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Album i = new Album(rs.getInt("albumID"),
                        rs.getInt("genreID"),
                        rs.getInt("artistID"),
                        rs.getString("albumName"),
                        rs.getDouble("albumPrice"),
                        rs.getInt("amountInStock"),
                        rs.getString("albumFormat"),
                        rs.getString("releaseDate"),
                        rs.getString("albumImage"));
                albums.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllAlbums() method: " + e.getMessage());
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

        return albums;

    }

    /**
     * get db connection, run query get results, loading result set and process
     * , then closing
     *
     * @param title
     * @return user enters title of an item they want to display query ides
     * through the db to see if the title exists and displays details if doesn't
     * exists gets error. exception handling
     */
    @Override
    public ArrayList<Album> searchForAlbum(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Album> albums = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from albums where albumName = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Album i = new Album(rs.getInt("albumID"),
                        rs.getInt("genreID"),
                        rs.getInt("artistID"),
                        rs.getString("albumName"),
                        rs.getDouble("albumPrice"),
                        rs.getInt("amountInStock"),
                        rs.getString("albumFormat"),
                        rs.getString("releaseDate"),
                        rs.getString("albumImage"));
                albums.add(i);
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

        return albums;
    }

    @Override
    public ArrayList<Album> searchForRandomAlbum() {
        Random rand = new Random();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Album> albums = new ArrayList();
        int size  = getAllAlbums().size();
        int randomid = rand.nextInt(size) + 1;
        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from albums where albumID = '" + randomid + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Album i = new Album(rs.getInt("albumID"),
                        rs.getInt("genreID"),
                        rs.getInt("artistID"),
                        rs.getString("albumName"),
                        rs.getDouble("albumPrice"),
                        rs.getInt("amountInStock"),
                        rs.getString("albumFormat"),
                        rs.getString("releaseDate"),
                        rs.getString("albumImage"));
                albums.add(i);
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

        return albums;
    }

    @Override
    public int editAllAlbumDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE albums SET albumID = ? WHERE albumID = ?";

                int myInt = (int) NumericValue;
                ps = con.prepareStatement(query);
                ps.setInt(1, myInt);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE albums SET genreID = ? WHERE albumID = ?";

                int myInt = (int) NumericValue;
                ps = con.prepareStatement(query);
                ps.setInt(1, myInt);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 3) {
                String query = "UPDATE albums SET artistID = ? WHERE albumID = ?";
                int myInt = (int) NumericValue;
                ps = con.prepareStatement(query);
                ps.setInt(1, myInt);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 4) {
                String query = "UPDATE albums SET albumName = ? WHERE albumID = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 5) {
                String query = "UPDATE albums SET albumPrice = ? WHERE albumID = ?";

                ps = con.prepareStatement(query);
                ps.setDouble(1, NumericValue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 6) {
                String query = "UPDATE albums SET amountInStock = ? WHERE albumID = ?";
                int myInt = (int) NumericValue;
                ps = con.prepareStatement(query);
                ps.setInt(1, myInt);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 7) {
                String query = "UPDATE albums SET albumFormat = ? WHERE albumID = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);
                rowsAffected = ps.executeUpdate();
            } else if (choice == 8) {
                String query = "UPDATE albums SET releaseDate = ? WHERE albumID = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
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

    /**
     * This method allows the user to UPDATE an Album Quantity After Purchase in
     * the Album table
     *
     * @param amountInStock amoun of Stock of the album to be found in database.
     * @param quantity The Amount Stock Is To Decrease of the album to be found
     * in database.
     * @param id name of the album to be found in database.
     * @return true if an album was deleted successfully from the database.
     */
    @Override
    public int updateQuantity(int amountInStock, int quantity, int id) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();
            int newAmount = (amountInStock - quantity);

            String query = "UPDATE albums SET amountInStock = ? WHERE albumID = ?";

            ps = con.prepareStatement(query);
            ps.setInt(1, newAmount);
            ps.setInt(2, id);

            rowsAffected = ps.executeUpdate();

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
