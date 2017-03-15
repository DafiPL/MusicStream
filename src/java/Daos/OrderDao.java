/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Order;
import Interfaces.OrderDaoInterface;
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
public class OrderDao extends Dao implements OrderDaoInterface {

    /**
     *
     * @param databaseName
     */
    public OrderDao(String databaseName) {
        super(databaseName);
    }

    @Override
    public int addOrder(Order o) {
        Connection con = null;
        PreparedStatement ps = null;
        int rs = 0;
        try {
            con = getConnection();
            ps = con.prepareStatement("INSERT INTO orders(username, albumID, quantity) VALUES (?, ?, ?)");

            ps.setString(1, o.getUsername());
            ps.setInt(2, o.getAlbumID());
            ps.setInt(3, o.getQuantity());

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
    public Order getOrderById(int orderID) {
        ArrayList<Order> orders = this.getAllOrders();
        Order order = null;
        for (int i = 0; i < orders.size(); i++) {
            if (orders.get(i).getOrderID() == orderID) {
                order = orders.get(i);
            }

        }
        return order;
    }

    @Override
    public int deleteOrder(int id) {
        Order m = getOrderById(id);
        int rs = 0;

        if (m != null) {
            Connection con = null;
            Statement st = null;

            try {
                con = getConnection();
                st = con.createStatement();
                String query = ("DELETE FROM orders WHERE orderID = '" + id + "'");

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
    public ArrayList<Order> getAllOrders() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Order> orders = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from orders";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order i = new Order(
                        rs.getInt("orderID"),
                        rs.getString("username"),
                        rs.getInt("albumID"),
                        rs.getInt("quantity"));

                orders.add(i);
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

        return orders;

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
    public ArrayList<Order> searchForOrder(String title) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<Order> orders = new ArrayList();

        try {
            con = getConnection();
            st = con.createStatement();
            String query = "Select * from orders where username = '" + title + "' ";
            rs = st.executeQuery(query);
            while (rs.next()) {
                Order i = new Order(
                        rs.getInt("orderID"),
                        rs.getString("username"),
                        rs.getInt("albumID"),
                        rs.getInt("quantity"));

                orders.add(i);
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

        return orders;
    }

    @Override
    public int editAllOrderDetailsById(int id, String Textvalue, double NumericValue, int choice) {

        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = getConnection();

            if (choice == 1) {
                String query = "UPDATE orders SET username = ? WHERE orderID = ?";

                ps = con.prepareStatement(query);
                ps.setString(1, Textvalue);
                ps.setInt(2, id);

                rowsAffected = ps.executeUpdate();
            } else if (choice == 2) {
                String query = "UPDATE orders SET albumID = ? WHERE orderID = ?";

                ps = con.prepareStatement(query);
                ps.setDouble(1, NumericValue);
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

    @Override
    public ArrayList<Order> selectAllOrdersByUser(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Order> orders = new ArrayList();

        try {
            con = getConnection();

            String query = "Select * from orders WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order(rs.getInt("OrderID"),
                        rs.getString("username"),
                        rs.getInt("albumID"),
                        rs.getInt("quantity")
                );
                orders.add(o);
            }
        } catch (SQLException e) {
            System.out.println("Exception occured in the selectAllOrdersByUser() method: " + e.getMessage());
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
                System.out.println("Exception occured in the finally section of the selectAllOrdersByUser() method: " + e.getMessage());
            }
        }

        return orders;
    }
}
