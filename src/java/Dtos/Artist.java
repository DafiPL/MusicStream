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
public class Artist {

    private int artistID;
    private String artistName;
    private int artistAge;
    private String artistBio;
    private String artistPicture;

    public Artist(int artistID, String artistName, int artistAge, String artistBio, String artistPicture) {
        this.artistID = artistID;
        this.artistName = artistName;
        this.artistAge = artistAge;
        this.artistBio = artistBio;
        this.artistPicture = artistPicture;
    }
    public Artist( String artistName, int artistAge, String artistBio, String artistPicture) {
        
        this.artistName = artistName;
        this.artistAge = artistAge;
        this.artistBio = artistBio;
        this.artistPicture = artistPicture;
    }
    public Artist() {
        this.artistID = 1;
        this.artistName = "Bob Marley";
        this.artistAge = 54;
        this.artistBio = "pu tha again tha";
        this.artistPicture = "";
    }

    public int getArtistID() {
        return artistID;
    }

    public void setArtistID(int artistID) {
        this.artistID = artistID;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public int getArtistAge() {
        return artistAge;
    }

    public void setArtistAge(int artistAge) {
        this.artistAge = artistAge;
    }

    public String getArtistBio() {
        return artistBio;
    }

    public void setArtistBio(String artistBio) {
        this.artistBio = artistBio;
    }

    public String getArtistPicture() {
        return artistPicture;
    }

    public void setArtistPicture(String artistPicture) {
        this.artistPicture = artistPicture;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + this.artistID;
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
        final Artist other = (Artist) obj;
        if (this.artistID != other.artistID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Artist{" + "artistID=" + artistID + ", artistName=" + artistName + ", artistAge=" + artistAge + ", artistBio=" + artistBio + ", artistPicture=" + artistPicture + '}';
    }

    
}
