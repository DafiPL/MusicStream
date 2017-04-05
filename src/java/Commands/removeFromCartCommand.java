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


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dafi
 */
public class removeFromCartCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String forwardToJsp = "";
         Object basket = session.getAttribute("basket");
        int albumIdRemove = Integer.parseInt(request.getParameter("albumIdRemove"));
       
        if (basket != null) {

            MemberDao memDao = new MemberDao("musicdb");
            AlbumDao albumDao = new AlbumDao("musicdb");

            ArrayList<Album> allAlbums = albumDao.getAllAlbums();
            ArrayList<Integer> albumIDs = new ArrayList();
        
         

          if (albumIdRemove != 0) {
              ArrayList<Order> cartOrders = null;
                        cartOrders = (ArrayList<Order>) basket;
                       for(int i = 0; i < cartOrders.size(); i ++){
                           if(cartOrders.get(i).getAlbumID() == albumIdRemove){
                               cartOrders.remove(cartOrders.get(i));
                           }
                           
                       }
                       
                        
                        session.setAttribute("basket", cartOrders);
                         forwardToJsp = "LoginSuccess.jsp";
            session.setAttribute("message", "ALbum has been Removed");
                    }else{
               forwardToJsp = "Index.jsp";
            session.setAttribute("message", "Couldnt Remove");
          }
                

            
           
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "Empty Basket");
        }

        return forwardToJsp;
    }

}
