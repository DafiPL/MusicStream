/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Dtos.MemberAddress;
import java.util.ArrayList;

/**
 *
 * @author kevin
 */
public interface MemberAddressDaoInterface {

    public int editAllMemberAddressDetailsById(int id, String Textvalue, double NumericValue, int choice);

    public ArrayList<MemberAddress> searchForMemberAddress(String title);

    public ArrayList<MemberAddress> getAllMemberAddresss();

    public int deleteMemberAddress(int id);

    public MemberAddress getMemberAddressById(int memberaddressID);

    public int addMemberAddress(MemberAddress a);

}
