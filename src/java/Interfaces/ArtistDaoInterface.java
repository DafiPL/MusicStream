/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Artist;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface ArtistDaoInterface {
    public int addArtist(Artist a) ;
    public Artist getArtistById(int albumID);
    public int deleteArtist(int id);
    public ArrayList<Artist> getAllArtists();
    public ArrayList<Artist> searchForArtist(String title);
    public int editAllArtistDetailsById(int id, String Textvalue, double NumericValue, int choice);
    
}
