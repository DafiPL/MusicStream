/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.Album;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface AlbumDaoInterface {
    public Album getAlbumById(int albumID);
    
    public ArrayList<Album> getAllAlbums();
    
    public int deleteAlbum(int id);
    
    public ArrayList<Album> searchForAlbum(String title);
    
    public int editAllAlbumDetailsById(int id, String Textvalue, double NumericValue, int choice);

    public int addAlbum(Album a);
    public int updateQuantity(int amountInStock, int quantity, int id);
    public ArrayList<Album> searchForRandomAlbum();
}
