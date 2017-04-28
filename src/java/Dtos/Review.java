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
public class Review {
    private int id;
    private String username;
    private int albumid;
    private String review;

    public Review() {
        this.id = 1;
        this.username = "";
        this.albumid = 2;
        this.review = "very good";
    }
    
    public Review(int id, String username,  String review, int albumid) {
        this.id = id;
        this.username = username;
        this.albumid = albumid;
        this.review = review;
    }
    
    public Review( String username,  String review, int albumid) {
        this.username = username;
        this.albumid = albumid;
        this.review = review;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAlbumid() {
        return albumid;
    }

    public void setAlbumid(int albumid) {
        this.albumid = albumid;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + this.id;
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
        final Review other = (Review) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "reviews{" + "id=" + id + ", username=" + username + ", albumid=" + albumid + ", review=" + review + '}';
    }
    
    
}
