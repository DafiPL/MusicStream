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
public class albumDetailCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();
        String albumName = request.getParameter("albumName");
                int convertedID = Integer.valueOf(albumName);
        
      
        Member m = null;
        if (albumName != null && !albumName.equals("")) {
            AlbumDao albDao = new AlbumDao("musicdb");
          
         Album album = null;
          album= albDao.getAlbumById(convertedID);
          
        if(album != null){
              session.setAttribute("selectedAlbum", album);
            forwardToJsp = "albumDetailPage.jsp";
        }
        
         
          else{
                
               
                session.setAttribute("userEntryError", "username and password do not match");
                forwardToJsp = "loginError.jsp";
            }
        } 
        return forwardToJsp;

    }

}
