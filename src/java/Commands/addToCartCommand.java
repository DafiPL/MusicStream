/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.AlbumDao;
import Daos.MemberDao;
import Dtos.Album;
import Dtos.Member;
import Dtos.Order;

import static EncryptionPass.SaltHashPass.generateHash;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dafi
 */
public class addToCartCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String forwardToJsp = "";
        Member user = (Member) session.getAttribute("userLogin");
        int albumID = Integer.parseInt(request.getParameter("albumID"));
        int cartQuantity = Integer.parseInt(request.getParameter("quantity"));
        if (user != null) {

            MemberDao memDao = new MemberDao("musicdb");
            AlbumDao albumDao = new AlbumDao("jmchotel");

            ArrayList<Album> allAlbums = albumDao.getAllAlbums();
            ArrayList<Integer> albumIDs = new ArrayList();
            int quantity = 0;
            for (Album a : allAlbums) {
                if (a.getAlbumID() == albumID) {
                    //get quantity
                    quantity = albumDao.getAlbumById(a.getAlbumID()).getAmountInStock();
                    //check Before Adding  
                    if (quantity > 0) {
                        albumIDs.add(a.getAlbumID());
                    } else {
                        forwardToJsp = "index.jsp";
                        session.setAttribute("message", "Not Enought In Stock. Please try a diffrent album");
                    }

                }
            }

            if (albumIDs.size() > 0) {

                Object b = session.getAttribute("basket");
                for (Integer i : albumIDs) {
                    Order r = new Order(user.getUsername(), i, cartQuantity, albumDao.getAlbumById(i).getAlbumPrice());

                    if (b != null) {
                        ArrayList<Order> cartOrders = (ArrayList<Order>) b;

                        cartOrders.add(r);
                        session.setAttribute("basket", cartOrders);
                    } else {
                        ArrayList<Order> cartOrders = new ArrayList();

                        cartOrders.add(r);
                        session.setAttribute("basket", cartOrders);
                    }
                }

            }
            forwardToJsp = "index.jsp";
            session.setAttribute("message", "ALbum has been added into basket.");
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "You need to log in to buy an Album.");
        }

        return forwardToJsp;
    }

}
