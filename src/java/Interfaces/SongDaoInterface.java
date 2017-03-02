/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Song;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface SongDaoInterface {
    public int editAllSongDetailsById(int id, String Textvalue, double NumericValue, int choice);
    public ArrayList<Song> searchForSong(String title);
    public ArrayList<Song> getAllSongs();
    public int deleteSong(int id);
    public Song getSongById(int SongID);
    public int addSong(Song s);
    
}
