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
public class deleteCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String choice = request.getParameter("choice");
        String Id = request.getParameter("deleteItem");

        int id = Integer.parseInt(Id);

//        Object loginValue = session.getAttribute("userLogin");
//        User user = (User) loginValue;
//        if (user.getAdminRole().equals("admin") && user != null) {
        if (choice != null && !choice.equals("") && Id != null && !Id.equals("")) {

            int rs = 0;
            if (choice.endsWith("song")) {
                SongDao songDao = new SongDao("musicdb");

                rs = songDao.deleteSong(id);

            } else if (choice.endsWith("album")) {
                AlbumDao albumDao = new AlbumDao("musicdb");

                rs = albumDao.deleteAlbum(id);

            } else if (choice.endsWith("artist")) {
                ArtistDao artistDao = new ArtistDao("musicdb");

                rs = artistDao.deleteArtist(id);

            } else if (choice.endsWith("genre")) {
                GenreDao genreDao = new GenreDao("musicdb");

                rs = genreDao.deleteGenre(id);

            } else if (choice.endsWith("member")) {
                MemberDao memberDao = new MemberDao("musicdb");

                rs = memberDao.deleteUser(Id);

            }

            if (rs > 0) {
                forwardToJsp = "adminMenu.jsp";
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "User does not exist Enter Valid ID");
            }
        }
        else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "Please Select Values To Delete");
        }
        return forwardToJsp;

    }
}
