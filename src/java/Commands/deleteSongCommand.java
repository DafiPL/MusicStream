/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.SongDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.User;

/**
 *
 * @author kevin
 */
public class deleteSongCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();
        
        String songId = request.getParameter("songID");
        int songid = Integer.parseInt(songId);
        
//        Object loginValue = session.getAttribute("userLogin");
//        User user = (User) loginValue;
        
//        if (user.getAdminRole().equals("admin") && user != null) {
            if (songId != null) {

                int rs = 0;
                SongDao songDao = new SongDao("musicdb");
                rs = songDao.deleteSong(songid);
                if (rs > 0) {
                    forwardToJsp = "adminMenu.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "song does not exist");
                }
            }
//        else {
//            forwardToJsp = "error.jsp";
//            session.setAttribute("errorMessage", "user is not a admin you do not have permission for that action!");
//        }
        return forwardToJsp;

    }
}
