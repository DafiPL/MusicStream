/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import Interfaces.MemberDaoInterface;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dafi
 */
public class MemberDao extends Dao implements MemberDaoInterface {

    /**
     * Initialises a MemberDao to access the specified database name
     *
     * @param databaseName The name of the MySQL database to be accessed (this
     * database should be running on localhost and listening on port 3306).
     */
    public MemberDao(String databaseName) {
        super(databaseName);
    }

    /**
     * Returns a Array list of (@code Member) objects based on the information
     * in the database. All member entry in the members table are selected from
     * the database and stored as(@code Member) objects in a (@code ArrayList).
     *
     * @return The (@code ArrayList) of all members entry in the members table.
     * This(@code ArrayList) may be empty where no members are present in the
     * database.
     */
    //This Method can be sql injected
    @Override
    public ArrayList<Member> searchForMmeber(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Member> members = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from Members where username = '" + username + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Member m = new Member(rs.getString("username"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("userType"),
                        rs.getString("password"),
                        rs.getLong("phone"),
                        rs.getString("email"),
                        rs.getString("addressLine1"),
                        rs.getString("town"),
                        rs.getString("county"),
                        rs.getString("saltGen")
                );
                members.add(m);

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

        return members;
    }

    /**
     * Returns a Array list (members) of (@code Member) objects based on the
     * information in the database. All member entry in the members table are
     * selected from the database and stored as( Member) objects in a (
     * ArrayList members).
     *
     * @return The (@code ArrayList) of all members entry in the members table.
     * This(@code ArrayList) may be empty where no members are present in the
     * database.
     */
    @Override
    public ArrayList<Member> getAllMembers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Member> members = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from Members";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Member m = new Member(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("userType"), rs.getString("password"), rs.getLong("phone"), rs.getString("email"), rs.getString("addressLine1"), rs.getString("town"), rs.getString("county"), rs.getString("saltGen"));
                members.add(m);
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

        return members;
    }

    /**
     * Checks if the username and password are correct in the database by
     * matching the code supplied as a parameter. This method has less security
     * than the rest so that it can be sql injcted
     *
     * @param username The username of a member to be found in the database.
     * @param password The password of a member to be found in the database.
     * @return The {@code m} object contained in the database matching the
     * supplied username and password, or {@code null} otherwise.
     */
    @Override
    public Member checkLogin(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Member m = null;

        try {
            con = getConnection();

            String query = "Select * from Members WHERE username = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                m = new Member(rs.getString("username"),
                        rs.getString("firstname"),
                        rs.getString("lastname"),
                        rs.getString("userType"),
                        rs.getString("password"),
                        rs.getLong("phone"),
                        rs.getString("email"),
                        rs.getString("addressLine1"),
                        rs.getString("town"),
                        rs.getString("county"),
                        rs.getString("saltGen"),
                        rs.getDate("registerDate"),
                        rs.getDate("expiryDate"),
                        rs.getString("Avatar"));

            }

        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllMembers() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the getAllMembers() method: " + e.getMessage());
            }
        }
        return m;
    }

    /**
     * Get an user object from method getAllMember by matching the code supplied
     * as a parameter.
     *
     * @param username The name of the user which to be found in the database.
     * @return The {@code m2} object contained in the database matching the
     * supplied username, or {@code null} otherwise.
     */
    @Override
    public Member getUserByUsername(String username) {
        ArrayList<Member> m = this.getAllMembers();
        Member m2 = null;
        for (int i = 0; i < m.size(); i++) {
            if (m.get(i).getUsername().equalsIgnoreCase(username)) {
                m2 = new Member(m.get(i).getUsername(), m.get(i).getFirstName(), m.get(i).getLastName(), m.get(i).getUserType(), m.get(i).getPassword(), m.get(i).getPhone(), m.get(i).getEmail(), m.get(i).getAddressLine1(), m.get(i).getTown(), m.get(i).getCounty(), m.get(i).getSalt(), m.get(i).getDate(), m.get(i).getExpiryDate(), m.get(i).getDbImage());
            }
        }
        return m2;
    }

    /**
     * Returns an Array list of (@code Member) objects which is an user based on
     * the information in the database. All member entry in the members table
     * are selected from the database and stored as(@code Member) objects in a
     * (@code ArrayList).
     *
     * @return The (@code ArrayList) of all members which userType is user entry
     * in the members table. This(@code ArrayList) may be empty where no members
     * are present in the database.
     */
    @Override
    public ArrayList<Member> getAllUsers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Member> members = new ArrayList();

        try {
            con = getConnection();

            String query = "SELECT * FROM Members WHERE userType = 'user'";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Member m = new Member(rs.getString("username"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("userType"), rs.getString("password"), rs.getInt("phone"), rs.getString("email"), rs.getString("addressLine1"), rs.getString("town"), rs.getString("county"), rs.getString("saltGen")
                );
                members.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the getAllUsers() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the getAllUsers() method: " + e.getMessage());
            }
        }

        return members;
    }

    /**
     * Adds a new member into loan table with the code supplied as a parameter.
     *
     * @param m An object consists of all the fields of a member to be added
     * into the database.
     * @return The {@code rs} contained the number of rows affected in the
     * member table by the object m, (@code 0}, or {@code -1}otherwise.
     */
    @Override
    public int addMember(Member m) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO members(username, firstName, lastName, userType, password, phone, email, addressLine1, town, county, saltGen, registerDate, expiryDate, Avatar) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)");

            ps.setString(1, m.getUsername());
            ps.setString(2, m.getFirstName());
            ps.setString(3, m.getLastName());
            ps.setString(4, m.getUserType());
            ps.setString(5, m.getPassword());
            ps.setLong(6, m.getPhone());
            ps.setString(7, m.getEmail());
            ps.setString(8, m.getAddressLine1());
            ps.setString(9, m.getTown());
            ps.setString(10, m.getCounty());
            ps.setString(11, m.getSalt());
            ps.setDate(12, (Date) m.getDate());
            ps.setDate(13, (Date) m.getExpiryDate());
            ps.setString(14, m.getDbImage());

            rs = ps.executeUpdate();

        } catch (MySQLIntegrityConstraintViolationException e) {
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
     * Deletes member from member table in the database matching the specified
     * code.
     *
     * @param username The id of the member which is to be deleted.
     * @return The {@code rs} contained the number of rows affected after
     * deleting by using the id, (@code 0}, or {@code -1}otherwise.
     */
    //This Method can be sql injected
    @Override
    public int deleteUser(String username) {
        //  Member m = getUserByUsername(username);
        int rs = 0;

        if (username != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM members WHERE username = '" + username + "'");

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
     * Gets the salt value of a user matching the code supplied as a parameter.
     *
     * @param username The username of a member to be found in the database.
     *
     * @return String salt of the given user matching the supplied username
     *
     *
     */
    public String getSaltbyUsername(String username) {
        ArrayList<Member> members = this.getAllMembers();
        Member book = null;
        String salt = "";
        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).getUsername().equalsIgnoreCase(username)) {
                salt = members.get(i).getSalt();
            }
        }
        return salt;
    }

    /**
     * Updates a members password in the database by matching the username and
     * password supplied as a parameter
     *
     * @param newpass The new password to be updated into the database.
     * @param username The username of a member to be found in the database.
     * @param oldpass The password of a member to be found in the database.
     * @return RowsEffected which is the number of entries changed in the
     * database
     */
    /**
     * Updates a members password in the database by matching the username and
     * password(automaticly generated and sent via email) supplied as a
     * parameter
     *
     * @param newpass The new generated password to be updated into the
     * database.
     * @param username The username of a member to be found in the database.
     * @param email The Email of a member to be found in the database. used to
     * verify member
     * @return RowsEffected which is the number of entries changed in the
     * database.
     */
    public int forgotPassowrd(String newpass, String username, String email) {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            String query = "UPDATE members SET password = ?  WHERE username = ? AND email = ?";

            ps = con.prepareStatement(query);
            ps.setString(1, newpass);
            ps.setString(2, username);
            ps.setString(3, email);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception occured in the editPassword() method: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the editPassword() method");
                e.getMessage();
            }
        }

        return rowsAffected;
    }

    /**
     * Updates a members salt value by username used to update salt when a
     * password is reset
     *
     * @param salt new salt generated to be updated in the database.
     * @param username The username of a member to be found in the database to
     * make sure salt is updated for the right user.
     * @return RowsEffected which is the number of entries changed in the
     * database.
     */
    public int updateSalt(String salt, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            String query = "UPDATE members SET saltGen = ?  WHERE username = ?";

            ps = con.prepareStatement(query);
            ps.setString(1, salt);
            ps.setString(2, username);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception occured in the updateSalt() method: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the editPassword() method");
                e.getMessage();
            }
        }

        return rowsAffected;
    }

    /**
     * Gets the user expiry date by matching the username supplied as a
     * parameter.
     *
     * @param username The username of a member to be found in the database.
     * @return Date object with the date for a specified user.
     */
    public Date getExpriyDate(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Date date = null;
        try {
            con = getConnection();

            String query = "SELECT expiryDate FROM members WHERE username = ?";

            ps = con.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                date = rs.getDate("expiryDate");
            }

        } catch (SQLException e) {
            System.out.println("Exception occured in the ExpiryDate() method: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the editPassword() method");
                e.getMessage();
            }
        }

        return date;
    }

    /**
     * Updates the expiry date for a member matching the username supplied in
     * the parameter
     *
     * @param date new expiry date to be updated in the dataabase in case of
     * password reset.
     * @param username username The username of a member to be found in the
     * database.
     * @return RowsEffected which is the number of entries changed in the
     * database.
     */
    public int updateExpiryDate(java.util.Date date, String username) {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            String query = "UPDATE members SET expiryDate = ?  WHERE username = ?";

            ps = con.prepareStatement(query);
            ps.setDate(1, (Date) date);
            ps.setString(2, username);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception occured in the editPassword() method: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("Exception occured in the finally section of the editPassword() method");
                e.getMessage();
            }
        }

        return rowsAffected;
    }

    
    @Override
    public int editAllMemberDetailsByUsername(String username, String Textvalue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE members SET username = ? WHERE username = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setString(2, username);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE members SET firstName = ? WHERE username = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setString(2, username);

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
