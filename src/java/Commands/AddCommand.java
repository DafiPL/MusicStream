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
import Dtos.Song;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kevin
 */
public class AddCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String choice = request.getParameter("addchoice");
        String albumID = request.getParameter("albumID");
        String songName = request.getParameter("songName");
        String songRelease = request.getParameter("songRelease");

        String genreID = request.getParameter("genreID");
        String artistID = request.getParameter("artistID");
        String albumName = request.getParameter("albumName");
        String albumPrice = request.getParameter("albumPrice");
        String amountInStock = request.getParameter("amountInStock");
        String albumFormat = request.getParameter("albumFormat");
        String releaseDate = request.getParameter("releaseDate");
        String albumImage = request.getParameter("albumImage");

        String songID = request.getParameter("songID");

        String artistName = request.getParameter("artistName");
        String artistAge = request.getParameter("artistAge");
        String artistBio = request.getParameter("artistBio");
        String artistPicture = request.getParameter("artistPicture");
        
        
        String genreName = request.getParameter("genreName");
        int albumId = Integer.valueOf(albumID);
        int genreId = Integer.valueOf(genreID);
        int artistId = Integer.valueOf(artistID);
        int songId = Integer.valueOf(songID);
        int ArtistAge = Integer.valueOf(artistAge);
        Double AlbumPrice = Double.valueOf(albumPrice);
        int AmountInStock = Integer.valueOf(amountInStock);
//        Object loginValue = session.getAttribute("userLogin");
//        User user = (User) loginValue;
//        if (user.getAdminRole().equals("admin") && user != null) {
        if (choice != null) {

            if (choice.equals("song")) {
                
                SongDao songDao = new SongDao("musicdb");
                Song s = new Song(songId, albumId, songName, songRelease);
                songDao.addSong(s);
                forwardToJsp = "adminMenu.jsp";
            } else if (choice.equals("album")) {
                AlbumDao albumDao = new AlbumDao("musicdb");
                Album a = new Album(genreId, artistId, albumName, AlbumPrice, AmountInStock, albumFormat, releaseDate, albumImage);
                albumDao.addAlbum(a);
                forwardToJsp = "adminMenu.jsp";
            } else if (choice.equals("artist")) {
                ArtistDao artistDao = new ArtistDao("musicdb");
                Artist a = new Artist(artistName, ArtistAge, artistBio, artistPicture );
                artistDao.addArtist(a);
                forwardToJsp = "adminMenu.jsp";
            } else if (choice.equals("genre")) {
                GenreDao genreDao = new GenreDao("musicdb");
                Genre g = new Genre(genreId, genreName);
                genreDao.addGenre(g);
                forwardToJsp = "adminMenu.jsp";
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "Please select a choice to edit. ");
            }
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "not all fields are entered!");
        }
        return forwardToJsp;
    }
}
