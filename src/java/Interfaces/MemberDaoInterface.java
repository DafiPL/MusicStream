/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.ArrayList;
import java.util.List;
import Dtos.Member;
import java.io.InputStream;

/**
 *
 * @author Dafi
 */
public interface MemberDaoInterface {

    public ArrayList<Member> getAllMembers();

    public ArrayList<Member> getAllUsers();

    public Member checkLogin(String username, String password);

    public Member getUserByUsername(String username);

    public int addMember(Member m);

    public int deleteUser(String username);

    public ArrayList<Member> searchForMmeber(String username);

    public int editAllMemberDetailsByUsername(String currentUser, String username, String firstName, String lastName, String password, long convertedPhone, String email, String street, String town, String county);

    public int editProfilePic(InputStream picture);
}
