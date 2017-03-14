/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.AlbumDao;
import Daos.ArtistDao;
import Daos.GenreDao;
import Daos.MemberDao;
import Daos.SongDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kevin
 */
public class EditCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String control = request.getParameter("control");
        String choice = request.getParameter("editchoice");
        String itemId = request.getParameter("itemId");
        String newvalue = request.getParameter("value");

        int convertChoice = Integer.valueOf(choice);
        int convertitemId = Integer.valueOf(itemId);
        int convertcontrol = Integer.valueOf(control);
//        Object loginValue = session.getAttribute("userLogin");
//        User user = (User) loginValue;

//        if (user.getAdminRole().equals("admin") && user != null) {
        if (choice != null && itemId != null && newvalue != null) {

            int rs = 0;

            switch (convertcontrol) {
                case 1:
                    SongDao songDao = new SongDao("musicdb");
                    if (choice.equals("3") || choice.equals("4")) {
                        rs = songDao.editAllSongDetailsById(convertitemId, newvalue, 0, convertChoice);
                    } else if (choice.equals("1") || choice.equals("2")) {
                        int convertValue = Integer.valueOf(newvalue);
                        rs = songDao.editAllSongDetailsById(convertitemId, "", convertValue, convertChoice);
                    }
                    break;
                case 2:
                    AlbumDao albumDao = new AlbumDao("musicdb");
                    if (choice.equals("4") || choice.equals("7") || choice.equals("8")) {
                        rs = albumDao.editAllAlbumDetailsById(convertitemId, newvalue, 0, convertChoice);
                    } else if (choice.equals("1") || choice.equals("2") || choice.equals("3") || choice.equals("5") || choice.equals("6")) {
                        int convertValue = Integer.valueOf(newvalue);
                        rs = albumDao.editAllAlbumDetailsById(convertitemId, "", convertValue, convertChoice);
                    }
                    break;
                case 3:
                    ArtistDao artistDao = new ArtistDao("musicdb");
                    if (choice.equals("2") || choice.equals("4") || choice.equals("5")) {
                        rs = artistDao.editAllArtistDetailsById(convertitemId, newvalue, 0, convertChoice);
                    } else if (choice.equals("1") || choice.equals("3")) {
                        int convertValue = Integer.valueOf(newvalue);
                        rs = artistDao.editAllArtistDetailsById(convertitemId, "", convertValue, convertChoice);
                    }
                    break;
                case 4:
                    GenreDao genreDao = new GenreDao("musicdb");
                    if (choice.equals("2")) {
                        rs = genreDao.editAllGenreDetailsById(convertitemId, newvalue, 0, convertChoice);
                    } else if (choice.equals("1")) {
                        int convertValue = Integer.valueOf(newvalue);
                        rs = genreDao.editAllGenreDetailsById(convertitemId, "", convertValue, convertChoice);
                    }
                    break;

                default:
                    break;
            }
            if (rs > 0) {
                forwardToJsp = "adminMenu.jsp";
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "Please select a choice to edit. ");
            }
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "user is not a admin you do not have permission for that action!");
        }
        return forwardToJsp;
    }
}
