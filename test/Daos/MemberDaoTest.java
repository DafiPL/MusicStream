/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Member;
import EncryptionPass.SaltHashPass;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Dafi
 */
public class MemberDaoTest {

    private final String testDB = "testdb";

    public MemberDaoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of searchForMmeber method, of class MemberDao.
     */
    @Test
    public void testSearchForMmeber() {
        System.out.println("searchForMmeber");
        MemberDao instance = new MemberDao(testDB);
        String username = "Damian123";
        int expResult = 1;
        ArrayList<Member> result = instance.searchForMmeber(username);
        assertEquals(expResult, result.size());
    }

    @Test
    public void testSearchForMmeberNotNull() {
        System.out.println("searchForMmeber");
        MemberDao instance = new MemberDao(testDB);
        String username = "Damian123";
        int expResult = 1;
        ArrayList<Member> result = instance.searchForMmeber(username);
        assertNotNull( result.size());
    }
    /**
     * Test of getAllMembers method, of class MemberDao.
     */
    @Test
    public void testGetAllMembers() {
        System.out.println("getAllMembers");
        MemberDao instance = new MemberDao(testDB);
        //Only normal Users UserType = 'user'
        int expResult = 6;
        ArrayList<Member> result = instance.getAllMembers();
        assertEquals(expResult, result.size());
    }

    @Test
    public void testGetAllMembersNotNull() {
        System.out.println("getAllMembers");
        MemberDao instance = new MemberDao(testDB);
        //Only normal Users UserType = 'user'
        int expResult = 6;
        ArrayList<Member> result = instance.getAllMembers();
        assertNotNull( result.size());
    }
    /**
     * Test of checkLogin method, of class MemberDao.
     */
    @Test
    public void testCheckLogin() {
        System.out.println("checkLogin");
        String username = "CheckLogin";
        String password = "pzfxH9Wv4ACua0sV";
        MemberDao instance = new MemberDao(testDB);

        Member u = new Member();

        String theSalt = instance.getSaltbyUsername(username);
        String pass = SaltHashPass.generateHash(password + theSalt);

        boolean expResult = true;
        boolean result = false;

        u = instance.checkLogin(username, pass);

        if (u != null) {
            result = true;
        }

        assertEquals(expResult, result);
    }

    /**
     * Test of getUserByUsername method, of class MemberDao.
     */
    @Test
    public void testGetUserByUsername() {
        System.out.println("getUserByUsername");
        String username = "Damian123";
        MemberDao instance = new MemberDao(testDB);

        boolean expResult = true;
        boolean result = false;

        Member u = instance.getUserByUsername(username);

        if (u != null) {
            result = true;
        }

        assertEquals(expResult, result);
    }
    
    @Test
    public void testGetUserByUsernameNotNull() {
        System.out.println("getUserByUsername");
        String username = "Damian123";
        MemberDao instance = new MemberDao(testDB);

        boolean result = false;

        Member u = instance.getUserByUsername(username);

        if (u != null) {
            result = true;
        }

        assertNotNull(result);
    }

    /**
     * Test of getAllUsers method, of class MemberDao.
     */
    @Test
    //2 methods doing same thing..
    public void testGetAllUsers() {
        System.out.println("getAllUsers");
        MemberDao instance = new MemberDao(testDB);
        int expResult = 3;
        ArrayList<Member> result = instance.getAllUsers();
        assertEquals(expResult, result.size());
    }
    
    public void testGetAllUsersNotNull() {
        System.out.println("getAllUsers");
        MemberDao instance = new MemberDao(testDB);
        ArrayList<Member> result = instance.getAllUsers();
        assertNotNull( result.size());
    }

    /**
     * Test of addMember method, of class MemberDao.
     */
    @Test
    public void testAddMember() {
        System.out.println("addMember");
        MemberDao instance = new MemberDao(testDB);
        Member u = new Member();

        byte[] salt = SaltHashPass.generateSalt();
        Member passWord = new Member();

        String password = passWord.randomString(16);

        Base64.Encoder enc = Base64.getEncoder();

        String theSalt = enc.encodeToString(salt);

        String pass = SaltHashPass.generateHash(password + theSalt);
        // (2) create a java sql register date object we want to insert
        Calendar calendar = Calendar.getInstance();
        java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
        //add 5 months to current date
        java.util.Date todaysDate = (java.util.Date) ourJavaDateObject;
        calendar.add(Calendar.MONTH, 1);
        //save in startDate and into the 
        java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
        java.util.Date expireDate = (java.util.Date) expriyDate;

        //   username, fname, lname, usertpye, pass, phoneConvert, email, adress, town, county, theSalt, todaysDate, expireDate
        u.setUsername("TESTER");
        u.setFirstName("Test");
        u.setLastName("User");
        u.setUserType("admin");
        u.setPassword(pass);
        long phoneConvert = Long.valueOf(2222);
        u.setPhone(phoneConvert);
        u.setEmail("TestUser@gmail.com");
        u.setAddressLine1("22 rockfield");
        u.setTown("Kingscourt");
        u.setCounty("Cavan");
        u.setSalt(theSalt);
        u.setDate(todaysDate);
        u.setExpiryDate(expireDate);
        int expResult = 1;
        int result = instance.addMember(u);
        
        assertEquals(expResult, result);
// search user to confirm
        instance.deleteUser("TESTER");
    }

    /**
     * Test of deleteUser method, of class MemberDao.
     */
    @Test
    public void testDeleteUser() {
        System.out.println("deleteUser");

        MemberDao instance = new MemberDao(testDB);
        Member u = new Member();
        byte[] salt = SaltHashPass.generateSalt();
        Member passWord = new Member();

        String password = passWord.randomString(16);

        Base64.Encoder enc = Base64.getEncoder();

        String theSalt = enc.encodeToString(salt);

        String pass = SaltHashPass.generateHash(password + theSalt);
        // (2) create a java sql register date object we want to insert
        Calendar calendar = Calendar.getInstance();
        java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
        //add 5 months to current date
        java.util.Date todaysDate = (java.util.Date) ourJavaDateObject;
        calendar.add(Calendar.MONTH, 1);
        //save in startDate and into the 
        java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
        java.util.Date expireDate = (java.util.Date) expriyDate;

        //   username, fname, lname, usertpye, pass, phoneConvert, email, adress, town, county, theSalt, todaysDate, expireDate
        u.setUsername("TESTER");
        u.setFirstName("Test");
        u.setLastName("User");
        u.setUserType("admin");
        u.setPassword(pass);
        long phoneConvert = Long.valueOf(2222);
        u.setPhone(phoneConvert);
        u.setEmail("TestUser@gmail.com");
        u.setAddressLine1("22 rockfield");
        u.setTown("Kingscourt");
        u.setCounty("Cavan");
        u.setSalt(theSalt);
        u.setDate(todaysDate);
        u.setExpiryDate(expireDate);

        int expResult = 1;

        instance.addMember(u);
        String username = "TESTER";

        int result = instance.deleteUser(username);
        assertEquals(expResult, result);
    }

    @Test
    public void testDeleteUserIsNull() {
        System.out.println("deleteUser");

        MemberDao instance = new MemberDao(testDB);
        Member u = new Member();
        byte[] salt = SaltHashPass.generateSalt();
        Member passWord = new Member();

        String password = passWord.randomString(16);

        Base64.Encoder enc = Base64.getEncoder();

        String theSalt = enc.encodeToString(salt);

        String pass = SaltHashPass.generateHash(password + theSalt);
        // (2) create a java sql register date object we want to insert
        Calendar calendar = Calendar.getInstance();
        java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
        //add 5 months to current date
        java.util.Date todaysDate = (java.util.Date) ourJavaDateObject;
        calendar.add(Calendar.MONTH, 1);
        //save in startDate and into the 
        java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
        java.util.Date expireDate = (java.util.Date) expriyDate;

        //   username, fname, lname, usertpye, pass, phoneConvert, email, adress, town, county, theSalt, todaysDate, expireDate
        u.setUsername("TESTER");
        u.setFirstName("Test");
        u.setLastName("User");
        u.setUserType("admin");
        u.setPassword(pass);
        long phoneConvert = Long.valueOf(2222);
        u.setPhone(phoneConvert);
        u.setEmail("TestUser@gmail.com");
        u.setAddressLine1("22 rockfield");
        u.setTown("Kingscourt");
        u.setCounty("Cavan");
        u.setSalt(theSalt);
        u.setDate(todaysDate);
        u.setExpiryDate(expireDate);

        int expResult = 1;

        instance.addMember(u);
        String username = "TESTER";

        int result = instance.deleteUser(username);
        assertNull( result);
    }

    /**
     * Test of getSaltbyUsername method, of class MemberDao.
     */
    @Test
    public void testGetSaltbyUsername() {
        System.out.println("getSaltbyUsername");
        String username = "Damian123";
        MemberDao instance = new MemberDao(testDB);
        String expResult = "ABCD";
        String result = instance.getSaltbyUsername(username);
        assertEquals(expResult, result);

    }

    /**
     * Test of forgotPassowrd method, of class MemberDao.
     */
    @Test
    public void testForgotPassowrd() {
        System.out.println("forgotPassowrd");
        Member passWord = new Member();
        String password = passWord.randomString(20);

        String newpass = password;
        String username = "TestForgotPassword";
        String email = "TestForgotPassword@gmail.com";
        MemberDao instance = new MemberDao(testDB);

        byte[] salt = SaltHashPass.generateSalt();

        Base64.Encoder enc = Base64.getEncoder();

        String theSalt = enc.encodeToString(salt);

        String pass = SaltHashPass.generateHash(newpass + theSalt);

        Calendar calendar = Calendar.getInstance();

        //add 5 months to current date
        calendar.add(Calendar.MONTH, 1);
        //save in startDate and into the 
        java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
        java.util.Date expireDate = (java.util.Date) expriyDate;

        instance.updateExpiryDate(expireDate, username);

        instance.updateSalt(theSalt, username);

        int expResult = 1;
        int result = instance.forgotPassowrd(pass, username, email);
        assertEquals(expResult, result);

    }

    /**
     * Test of updateSalt method, of class MemberDao.
     */
    @Test
    public void testUpdateSalt() {
        System.out.println("updateSalt");
        String salt = "ABCD";
        String username = "Damian123";
        MemberDao instance = new MemberDao(testDB);
        int expResult = 1;
        int result = instance.updateSalt(salt, username);
        assertEquals(expResult, result);

    }

    /**
     * Test of getExpriyDate method, of class MemberDao.
     */
    @Test
    public void testGetExpriyDate() {
        System.out.println("getExpriyDate");

        // (2) create a java sql register date object we want to insert
        Calendar calendar = Calendar.getInstance();
        java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
        //add 5 months to current date
        java.util.Date todaysDate = (java.util.Date) ourJavaDateObject;
        calendar.add(Calendar.MONTH, 1);
        //save in startDate and into the 
        java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
        java.util.Date expireDate = (java.util.Date) expriyDate;

        String username = "DATETEST";
        MemberDao instance = new MemberDao(testDB);
        Date expResult = instance.getExpriyDate(username);
        java.util.Date result = expireDate;
        assertEquals(expResult, result);

    }

}
