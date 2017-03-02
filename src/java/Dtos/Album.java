/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author kevin
 */
public class Album {
   private int albumID;
   private int genreID;
   private int artistID;
   private String albumName;
   private double albumPrice;
   private double amountInStock;
   private String albumFormat;
   private String releaseDate;

    public Album(int albumID, int genreID, int artistID, String albumName, double albumPrice, double amountInStock, String albumFormat, String releaseDate) {
        this.albumID = albumID;
        this.genreID = genreID;
        this.artistID = artistID;
        this.albumName = albumName;
        this.albumPrice = albumPrice;
        this.amountInStock = amountInStock;
        this.albumFormat = albumFormat;
        this.releaseDate = releaseDate;
    }
   
   public Album() {
        this.albumID = 1;
        this.genreID = 1;
        this.artistID = 1;
        this.albumName = "summer";
        this.albumPrice = 12.99;
        this.amountInStock = 2;
        this.albumFormat = "";
        this.releaseDate = "";
    }

    public int getAlbumID() {
        return albumID;
    }

    public void setAlbumID(int albumID) {
        this.albumID = albumID;
    }

    public int getGenreID() {
        return genreID;
    }

    public void setGenreID(int genreID) {
        this.genreID = genreID;
    }

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public double getAlbumPrice() {
        return albumPrice;
    }

    public void setAlbumPrice(double albumPrice) {
        this.albumPrice = albumPrice;
    }

    public double getAmountInStock() {
        return amountInStock;
    }

    public void setAmountInStock(double amountInStock) {
        this.amountInStock = amountInStock;
    }

    public String getAlbumFormat() {
        return albumFormat;
    }

    public void setAlbumFormat(String albumFormat) {
        this.albumFormat = albumFormat;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + this.albumID;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Album other = (Album) obj;
        if (this.albumID != other.albumID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Album{" + "albumID=" + albumID + ", genreID=" + genreID + ", artistID=" + artistID + ", albumName=" + albumName + ", albumPrice=" + albumPrice + ", amountInStock=" + amountInStock + ", albumFormat=" + albumFormat + ", releaseDate=" + releaseDate + '}';
    }
   
   
   
           
    
}
