/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

import java.security.SecureRandom;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Dafi
 */
public class Member {

    private String username;
    private String firstName;
    private String lastName;
    private String userType;
    private String password;
    private long phone;
    private String email;
    private String addressLine1;
    private String town;
    private String county;
    private String salt;
    private Date date;
    private Date expiryDate;
    
    static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
static SecureRandom rnd = new SecureRandom();

public Member() {
        
    }



    public Member(String username, String password) {
        this.username=username;
        this.password = password;
    }
    
     public Member(String salt) {
         this.salt = salt;
    }

    public Member(String username, String firstName, String SecondName, String userType,String password, long phone, String email, String addressLine1, String town, String county, String salt, Date date, Date expiryDate) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = SecondName;
        this.userType = userType;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.addressLine1 = addressLine1;
        this.town = town;
        this.county = county;
        this.salt = salt;
        this.date =date;
        this.expiryDate = expiryDate;
    }
       public Member(String username, String firstName, String SecondName, String userType,String password, long phone, String email, String addressLine1, String town, String county, String salt) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = SecondName;
        this.userType = userType;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.addressLine1 = addressLine1;
        this.town = town;
        this.county = county;
        this.salt = salt;
       
    }

    public Member(String username, String firstName, String lastName, String userType, String password, long phone, String email, String addressLine1, String town, String county) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.addressLine1 = addressLine1;
        this.town = town;
        this.county = county;
    }
       
       

    public String getUsername() {
        return username;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUserType() {
        return userType;
    }

    public String getPassword() {
        return password;
    }

    public long getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public String getTown() {
        return town;
    }

    public String getCounty() {
        return county;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String SecondName) {
        this.lastName = SecondName;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    

public String randomString( int len ){
   StringBuilder sb = new StringBuilder( len );
   for( int i = 0; i < len; i++ ) 
      sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
   return sb.toString();
}

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.username);
        hash = 67 * hash + Objects.hashCode(this.firstName);
        hash = 67 * hash + Objects.hashCode(this.lastName);
        hash = 67 * hash + (int) (this.phone ^ (this.phone >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Member other = (Member) obj;
        if (!Objects.equals(this.username, other.username)) {
            return false;
        }
        if (this.phone != other.phone) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        return true;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }
    

    
    
    @Override
    public String toString() {
        return "username=" + username + ", firstName=" + firstName + ", SecondName=" + lastName + ", userType=" + userType + ", password=" + password + ", phone=" + phone + ", email=" + email + ", addressLine1=" + addressLine1 + ", town=" + town + ", county=" + county;
    }
    
    

}
