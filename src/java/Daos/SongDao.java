/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Song;
import Interfaces.SongDaoInterface;
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
public class SongDao extends Dao implements SongDaoInterface{
      /**
     *
     * @param databaseName
     */
    public SongDao(String databaseName) {
        super(databaseName);
    }
    
    @Override
    public int addSong(Song s) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO songs(albumID, songName, songRelease) VALUES (NULL, ?, ?, ?)");

            
            ps.setInt(1, s.getAlbum_id());
            ps.setString(2, s.getSongName());
            ps.setString(3, s.getSongRelease());
            

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
    public Song getSongById(int SongID) {
        ArrayList<Song> Songs = this.getAllSongs();
        Song memberaddress = null;
        for (int i = 0; i < Songs.size(); i++) {
            if (Songs.get(i).getId()== SongID) {
                memberaddress = Songs.get(i);
            }

        }
        return memberaddress;
    }

    @Override
    public int deleteSong(int id) {
        Song m = getSongById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM Songs WHERE SongID = '" + id + "'");

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
    public ArrayList<Song> getAllSongs() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Song> Songs = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from Songs";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Song i = new Song(
                        rs.getInt("SongID"),
                        rs.getInt("albumID"),
                        rs.getString("songName"),
                        rs.getString("songRelease"));
                       
                Songs.add(i);
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

        return Songs;

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
    public ArrayList<Song> searchForSong(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Song> Songs = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from Songs where songName = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                 Song i = new Song(
                        rs.getInt("SongID"),
                        rs.getInt("albumID"),
                        rs.getString("songName"),
                        rs.getString("songRelease"));
                       
                Songs.add(i);
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

        return Songs;
    }

    @Override
    public int editAllSongDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE Songs SET songID = ? WHERE SongID = ?";

                ps = con.prepareStatement(query);
                ps.setDouble(1, NumericValue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE Songs SET albumID = ? WHERE SongID = ?";

                ps = con.prepareStatement(query);
                 ps.setDouble(1, NumericValue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 3) {
                String query = "UPDATE Songs SET songName = ? WHERE SongID = ?";

                ps = con.prepareStatement(query);
                 ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 4) {
                String query = "UPDATE Songs SET songRelease = ? WHERE SongID = ?";

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
}
