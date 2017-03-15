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
public class orderItemCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        int albumQuantity = Integer.parseInt(request.getParameter("quantity"));
        String username = request.getParameter("username");
        int albumID = Integer.parseInt(request.getParameter("albumID"));

        if (username != null && !username.equals("") && albumQuantity != 0 && albumID != 0) {
            HttpSession session = request.getSession();
            OrderDao orderDao = new OrderDao("musicdb");
            MemberDao memberDao = new MemberDao("musicdb");
            AlbumDao albumDao = new AlbumDao("musicdb");
            double price = albumDao.getAlbumById(albumID).getAlbumPrice();

            String albumName = albumDao.getAlbumById(albumID).getAlbumName();
            Member m = null;
            m = memberDao.getUserByUsername(username);

            if (albumDao.getAlbumById(albumID).getAmountInStock() > 0) {
                if (m != null) {
                    Order o = new Order(username, albumID, albumQuantity);
                    int rs = orderDao.addOrder(o);
                    String email = m.getEmail();

                    if (rs > 0) {
                        int stock = albumDao.getAlbumById(albumID).getAmountInStock();
                        int updateRs = 0;

                        updateRs = albumDao.updateQuantity(stock, albumQuantity, albumID);
                        if (updateRs > 0) {
                            try {
                                sendMail.generateAndSendEmailOrder(email, albumName, albumQuantity, username, price);
                            } catch (MessagingException ex) {
                                Logger.getLogger(forgotPassowrdCommand.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        } else {
                            forwardToJsp = "loginError.jsp";
                            session.setAttribute("userEntryError", "Couldnt Create Order!");
                        }

                    }
                    forwardToJsp = "orderSuccessfull.jsp";
                    session.setAttribute("orderDetials", o);
                }
            } else {
                forwardToJsp = "loginError.jsp";
                session.setAttribute("userEntryError", "Not ENough Stock!");
            }
        }
        return forwardToJsp;
    }

}
