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
public class MemberAddress {
    private int adressId;
    private String username;
    private String adress1;
    private String adress2;

    public MemberAddress(int adressId, String username, String adress1, String adress2) {
        this.adressId = adressId;
        this.username = username;
        this.adress1 = adress1;
        this.adress2 = adress2;
    }
    
    public MemberAddress() {
        this.adressId = 1;
        this.username = "crackiso";
        this.adress1 = "church street";
        this.adress2 = "kingscourt";
    }

    public int getAdressId() {
        return adressId;
    }

    public void setAdressId(int adressId) {
        this.adressId = adressId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAdress1() {
        return adress1;
    }

    public void setAdress1(String adress1) {
        this.adress1 = adress1;
    }

    public String getAdress2() {
        return adress2;
    }

    public void setAdress2(String adress2) {
        this.adress2 = adress2;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.adressId;
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
        final MemberAddress other = (MemberAddress) obj;
        if (this.adressId != other.adressId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "MemberAddress{" + "adressId=" + adressId + ", username=" + username + ", adress1=" + adress1 + ", adress2=" + adress2 + '}';
    }
    
    
}
