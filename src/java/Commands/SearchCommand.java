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
import Dtos.Album;
import Dtos.Artist;
import Dtos.Genre;
import Dtos.Member;
import Dtos.Song;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kevin
 */
public class SearchCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";
        HttpSession session = request.getSession();
        
        String choice = request.getParameter("searchchoice");
        String itemName = request.getParameter("itemName");
//        User user = (User) loginValue;

        // valiadtion
//        if (user.getAdminRole().equals("admin") && user != null) {
        if (choice != null) {

            if (choice.equals("song")) {
                session.setAttribute("setchoice", choice);
                SongDao songDao = new SongDao("musicdb");
                ArrayList<Song> songs = new ArrayList<>();

                songs = songDao.searchForSong(itemName);

                session.setAttribute("showSearchSong", songs);
                if (!songs.isEmpty()) {
                    forwardToJsp = "showSearchResult.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Song match that title");
                }

            } else if (choice.equals("album")) {
                session.setAttribute("setchoice", choice);
                AlbumDao albumDao = new AlbumDao("musicdb");
                ArrayList<Album> albums = new ArrayList<>();

                albums = albumDao.searchForAlbum(itemName);

                session.setAttribute("showSearchAlbum", albums);
                if (!albums.isEmpty()) {
                    forwardToJsp = "showSearchResult.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Album match that title");
                }
            } else if (choice.equals("artist")) {
                session.setAttribute("setchoice", choice);
                ArtistDao artistDao = new ArtistDao("musicdb");
                ArrayList<Artist> artists = new ArrayList<>();

                artists = artistDao.searchForArtist(itemName);

                session.setAttribute("showSearchArtist", artists);
                if (!artists.isEmpty()) {
                    forwardToJsp = "showSearchResult.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Artist match that title");
                }
            } else if (choice.equals("RandomAlbum")) {
                AlbumDao albumDao = new AlbumDao("musicdb");
                ArrayList<Album> albums = new ArrayList<>();

                albums = albumDao.searchForRandomAlbum();

                session.setAttribute("searchRandomAlbum", albums);
                if (!albums.isEmpty()) {
                    forwardToJsp = "LoginSuccess.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Albums in database");
                }
            } else if (choice.equals("genre")) {
                session.setAttribute("setchoice", choice);
                GenreDao genreDao = new GenreDao("musicdb");
                ArrayList<Genre> genres = new ArrayList<>();

                genres = genreDao.searchForGenre(itemName);

                session.setAttribute("showSearchGenre", genres);
                if (!genres.isEmpty()) {
                    forwardToJsp = "showSearchResult.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Genre match that title");
                }
            } else if (choice.equals("member")) {
                session.setAttribute("setchoice", choice);
                MemberDao memberDao = new MemberDao("musicdb");
                ArrayList<Member> members = new ArrayList<>();

                members = memberDao.searchForMmeber(itemName);

                session.setAttribute("showSearchMember", members);
                if (!members.isEmpty()) {
                    forwardToJsp = "showSearchResult.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "No Member match that title");
                }
            }
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "user is not a admin you do not have permission for that action!");
        }

        return forwardToJsp;
    }

}
