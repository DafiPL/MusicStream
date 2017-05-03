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
import Dtos.Member;
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

        String control = request.getParameter("control");
        String choice = request.getParameter("editchoice");
        String itemId = request.getParameter("itemId");
        String newvalue = request.getParameter("value");

        int convertChoice = Integer.valueOf(choice);
        int convertitemId = Integer.valueOf(itemId);
        int convertcontrol = Integer.valueOf(control);
        Object loginValue = session.getAttribute("userLogin");
        Member member = (Member) loginValue;

        if (member.getUserType().equals("admin") && member != null) {
        if (control != null && !control.equals("") && choice != null && !choice.equals("") && itemId != null && !itemId.equals("") && newvalue != null && !newvalue.equals("")) {
            int rs = 0;
            if (convertcontrol == 1) {
                SongDao songDao = new SongDao("musicdb");
                if (choice.equals("3") || choice.equals("4")) {
                    rs = songDao.editAllSongDetailsById(convertitemId, newvalue, 0, convertChoice);
                } else if (choice.equals("1") || choice.equals("2")) {
                    int convertValue = Integer.valueOf(newvalue);
                    rs = songDao.editAllSongDetailsById(convertitemId, "", convertValue, convertChoice);
                }
            } else if (convertcontrol == 2) {
                AlbumDao albumDao = new AlbumDao("musicdb");
                if (choice.equals("4") || choice.equals("7") || choice.equals("8")) {
                    rs = albumDao.editAllAlbumDetailsById(convertitemId, newvalue, 0, convertChoice);
                } else if (choice.equals("1") || choice.equals("2") || choice.equals("3") || choice.equals("5") || choice.equals("6")) {
                    int convertValue = Integer.valueOf(newvalue);
                    rs = albumDao.editAllAlbumDetailsById(convertitemId, "", convertValue, convertChoice);
                }
            } else if (convertcontrol == 3) {
                ArtistDao artistDao = new ArtistDao("musicdb");
                if (choice.equals("2") || choice.equals("4") || choice.equals("5")) {
                    rs = artistDao.editAllArtistDetailsById(convertitemId, newvalue, 0, convertChoice);
                } else if (choice.equals("1") || choice.equals("3")) {
                    int convertValue = Integer.valueOf(newvalue);
                    rs = artistDao.editAllArtistDetailsById(convertitemId, "", convertValue, convertChoice);
                }
            } else if (convertcontrol == 4) {

                GenreDao genreDao = new GenreDao("musicdb");
                if (choice.equals("2")) {
                    rs = genreDao.editAllGenreDetailsById(convertitemId, newvalue, 0, convertChoice);
                } else if (choice.equals("1")) {
                    int convertValue = Integer.valueOf(newvalue);
                    rs = genreDao.editAllGenreDetailsById(convertitemId, "", convertValue, convertChoice);
                }
            }
            if (rs > 0) {
                forwardToJsp = "adminMenu.jsp";
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "Method didnt work");
            }
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "Please select a choice to edit.");
        }} else{ 
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "You are not a admin");
        }
        return forwardToJsp;
    }
}
