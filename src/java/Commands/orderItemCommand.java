/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.AlbumDao;
import Daos.OrderDao;
import Dtos.Album;
import Dtos.Artist;
import Dtos.Order;
import Mailer.sendMail;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author access
 */
public class orderItemCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        int album_id = Integer.parseInt(request.getParameter("album"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));
         String email = request.getParameter("email");
         String username = request.getParameter("username");

        if (user_id != 0 && album_id != 0) {

            OrderDao orderDao = new OrderDao("musicdb");

            AlbumDao alDao = new AlbumDao("musicdb");
            

            if (null == null) {
                forwardToJsp = "orderFailed.jsp";
            } else {
                forwardToJsp = "myProfile.jsp";
                    
         //       sendMail.generateAndSendEmail(email,Aname,username,Aprice,Artist);

            }

        } else {
            forwardToJsp = "orderFailed.jsp";
        }
        return forwardToJsp;
    }

}
