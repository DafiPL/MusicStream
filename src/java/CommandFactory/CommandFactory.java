/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CommandFactory;

import Commands.Command;
import Commands.LogOutCommand;
import Commands.LoginCommand;
import Commands.RegisterCommand;
import Commands.deleteAlbumCommand;
import Commands.deleteArtistCommand;
import Commands.deleteGenreCommand;
import Commands.deleteMemberCommand;
import Commands.deleteSongCommand;

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
        } else if (action.equals("deletesong")) {
            return new deleteSongCommand();
        } else if (action.equals("deletealbum")) {
            return new deleteAlbumCommand();
        } else if (action.equals("deleteartist")) {
            return new deleteArtistCommand();
        } else if (action.equals("deletegenre")) {
            return new deleteGenreCommand();
        } else if (action.equals("deletemember")) {
            return new deleteMemberCommand();
        } 
        else {
            return null;
        }
    }
}
