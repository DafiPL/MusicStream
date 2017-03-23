/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MemberDao;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kevin
 */
@MultipartConfig(maxFileSize = 16177215)
public class EditProfilepicCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";
        HttpSession session = request.getSession();
        InputStream inputStream = null;

        Part filePart;
        try {
            filePart = request.getPart("image");

            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                //obtains input stream of the upload file
                //the InputStream will point to a stream that contains
                //the contents of the file
                inputStream = filePart.getInputStream();
            }

            int rs = 0;
            MemberDao member = new MemberDao("musicdb");
            rs = member.editProfilePic(inputStream);

            if (rs > 0) {
                forwardToJsp = "EditProfile.jsp";
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "Method did not work ");
            }
        } catch (IOException ex) {
            Logger.getLogger(EditProfilepicCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ServletException ex) {
            Logger.getLogger(EditProfilepicCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return forwardToJsp;
    }
}
