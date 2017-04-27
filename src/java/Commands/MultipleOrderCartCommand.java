/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.AlbumDao;
import Daos.MemberDao;
import Daos.OrderDao;
import Dtos.Album;
import Dtos.Artist;
import Dtos.Member;
import Dtos.Order;
import Mailer.sendMail;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dafi
 */
public class MultipleOrderCartCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String forwardToJsp = "";
        Object basket = session.getAttribute("basket");
        String username = request.getParameter("username");

        if (basket != null && username != null) {
            MemberDao memDao = new MemberDao("musicdb");
            AlbumDao albumDao = new AlbumDao("musicdb");
            OrderDao orderDao = new OrderDao("musicdb");

            ArrayList<Order> cartOrders = null;
            Member m = null;
            m = memDao.getUserByUsername(username);
            int albumCartID = 0;
            int albumQuantity = 0;
            cartOrders = (ArrayList<Order>) basket;
            
            for (int i = 0; i < cartOrders.size(); i++) {

                albumCartID = cartOrders.get(i).getAlbumID();
                albumQuantity = cartOrders.get(i).getQuantity();
                double price = albumDao.getAlbumById(albumCartID).getAlbumPrice();
                double totalPrice = (price * albumQuantity);

                int stock = albumDao.getAlbumById(albumCartID).getAmountInStock();
                if (stock > 0) {
                    int stockAfterPurchase = (stock - albumQuantity);
                    if (stockAfterPurchase > 0) {
                        Order o = new Order(username, albumCartID, albumQuantity, totalPrice);
                        int updateRs = albumDao.updateQuantity(stock, albumQuantity, albumCartID);
                        int rs = orderDao.addOrder(o);
                        if(rs <0){
                           Album a =  albumDao.getAlbumById(albumCartID);
                            
                             forwardToJsp = "loginError.jsp";
                            session.setAttribute("userEntryError", a);
                        }
                        String email = m.getEmail();
                      
                        
                    } else {
                             forwardToJsp = "loginError.jsp";
                            session.setAttribute("userEntryError", "This Product is SOLD OUT! ");
                    }
                }
            }
                     forwardToJsp = "orderSuccessfull.jsp";
                    session.setAttribute("cartOrderDetails", basket);
        }
return forwardToJsp;
    }

}
