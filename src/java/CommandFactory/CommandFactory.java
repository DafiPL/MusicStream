/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CommandFactory;

import Commands.AddCommand;
import Commands.AddReviewCommand;
import Commands.Command;
import Commands.EditCommand;
import Commands.EditProfile;

import Commands.LogOutCommand;
import Commands.LoginCommand;
import Commands.MultipleOrderCartCommand;
import Commands.RegisterCommand;
import Commands.SearchCommand;
import Commands.addToCartCommand;
import Commands.albumDetailCommand;
import Commands.deleteCommand;
import Commands.orderItemCommand;
import Commands.removeFromCartCommand;

/**
 *
 * @author d00165207
 */
public class CommandFactory {

    public Command createCommand(String action) {
        if (action.equals("login")) {
            return new LoginCommand();
        } else if (action.equals("logout")) {
            return new LogOutCommand();
        } else if (action.equals("register")) {
            return new RegisterCommand();
        } else if (action.equals("delete")) {
            return new deleteCommand();
        } else if (action.equals("search")) {
            return new SearchCommand();
        } else if (action.equals("edit")) {
            return new EditCommand();
        } else if (action.equals("add")) {
            return new AddCommand();
        } else if (action.equals("editprofile")) {
            return new EditProfile();
        } else if (action.equals("albumDetail")) {
            return new albumDetailCommand();
        } else if (action.equals("orderItem")) {
            return new orderItemCommand();
        } else if (action.equals("addToCart")) {
            return new addToCartCommand();
        } else if (action.equals("removeFromCart")) {
            return new removeFromCartCommand();
        } else if (action.equals("multipleOrderCart")) {
            return new MultipleOrderCartCommand();
        } else if (action.equals("addreview")) {
            return new AddReviewCommand();
        } else if (action.equals("getpicki")) {
            return new AddReviewCommand();
        } else {
            return null;
        }
    }
}
