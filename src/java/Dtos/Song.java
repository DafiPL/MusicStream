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
public class Song {
    private int id;
    private int album_id;
    private String songName;
    private String songRelease;

    
    
    public Song(int id, int album_id, String songName, String songRelease) {
        this.id = id;
        this.album_id = album_id;
        this.songName = songName;
        this.songRelease = songRelease;
    }

    public Song() {
        this.id = 1;
        this.album_id = 2;
        this.songName = "coming homw";
        this.songRelease = "";
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAlbum_id() {
        return album_id;
    }

    public void setAlbum_id(int album_id) {
        this.album_id = album_id;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public String getSongRelease() {
        return songRelease;
    }

    public void setSongRelease(String songRelease) {
        this.songRelease = songRelease;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 89 * hash + this.id;
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
        final Song other = (Song) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Song{" + "id=" + id + ", album_id=" + album_id + ", songName=" + songName + ", songRelease=" + songRelease + '}';
    }

    
    
}
