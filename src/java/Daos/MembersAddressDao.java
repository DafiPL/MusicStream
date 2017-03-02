/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.MemberAddress;
import Interfaces.MemberAddressDaoInterface;
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
public class MembersAddressDao extends Dao implements MemberAddressDaoInterface{
     
    /**
     *
     * @param databaseName
     */
    public MembersAddressDao(String databaseName) {
        super(databaseName);
    }
    
    @Override
    public int addMemberAddress(MemberAddress a) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO memberaddresses(adressID, username, adress1, adress2) VALUES (NULL, ?, ?, ?, ?)");

            ps.setInt(1, a.getAdressId());
            ps.setString(2, a.getUsername());
            ps.setString(3, a.getAdress1());
            ps.setString(4, a.getAdress2());
            

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
    public MemberAddress getMemberAddressById(int memberaddressID) {
        ArrayList<MemberAddress> memberaddresses = this.getAllMemberAddresss();
        MemberAddress memberaddress = null;
        for (int i = 0; i < memberaddresses.size(); i++) {
            if (memberaddresses.get(i).getAdressId()== memberaddressID) {
                memberaddress = memberaddresses.get(i);
            }

        }
        return memberaddress;
    }

    @Override
    public int deleteMemberAddress(int id) {
        MemberAddress m = getMemberAddressById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM memberaddresses WHERE adressID = '" + id + "'");

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
    public ArrayList<MemberAddress> getAllMemberAddresss() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<MemberAddress> memberaddresses = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from memberaddresses";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                MemberAddress i = new MemberAddress(
                        rs.getInt("adressID"),
                        rs.getString("username"),
                        rs.getString("adress1"),
                        rs.getString("adress2"));
                       
                memberaddresses.add(i);
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

        return memberaddresses;

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
    public ArrayList<MemberAddress> searchForMemberAddress(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<MemberAddress> memberaddresses = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from memberaddresses where username = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                 MemberAddress i = new MemberAddress(
                        rs.getInt("adressID"),
                        rs.getString("username"),
                        rs.getString("adress1"),
                        rs.getString("adress2"));
                       
                memberaddresses.add(i);
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

        return memberaddresses;
    }

    @Override
    public int editAllMemberAddressDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE memberaddresses SET username = ? WHERE memberaddressID = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE memberaddresses SET address1 = ? WHERE memberaddressID = ?";

                ps = con.prepareStatement(query);
                 ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 3) {
                String query = "UPDATE memberaddresses SET adress2 = ? WHERE memberaddressID = ?";

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
