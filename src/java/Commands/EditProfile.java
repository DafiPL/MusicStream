/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.AlbumDao;
import Daos.ArtistDao;
import Daos.GenreDao;
import Daos.MemberDao;
import Daos.SongDao;
import Dtos.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kevin
 */
public class EditProfile implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";
        HttpSession session = request.getSession();

        Object resultValue = session.getAttribute("userLogin");
        Member member = (Member) resultValue;

        String currentuser = member.getUsername();

        String confirmPassword = request.getParameter("confirmpassword");
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String street = request.getParameter("address");
        String town = request.getParameter("town");
        String county = request.getParameter("county");

        long convertedPhone = Long.valueOf(phone);
//        Object loginValue = session.getAttribute("userLogin");
//        User user = (User) loginValue;
//        if (user.getAdminRole().equals("admin") && user != null) {
        if (username != null && !username.equals("") && firstName != null && !firstName.equals("") && lastName != null && !lastName.equals("") && password != null && !password.equals("") && email != null && !email.equals("") && street != null && !street.equals("") && town != null && !town.equals("") && county != null && !county.equals("") && phone != null && !phone.equals("")) {
            if (password.equals(confirmPassword)) {
                int rs = 0;

                MemberDao memberDao = new MemberDao("musicdb");
                rs = memberDao.editAllMemberDetailsByUsername(currentuser, username, firstName, lastName, password, convertedPhone, email, street, town, county);
                if (rs > 0) {
                    forwardToJsp = "adminMenu.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                    session.setAttribute("errorMessage", "Method did not work ");
                }
            } else {
                forwardToJsp = "error.jsp";
                session.setAttribute("errorMessage", "passwords must match");
            }
        } else {
            forwardToJsp = "error.jsp";
            session.setAttribute("errorMessage", "Must enter all Fields");
        }
        return forwardToJsp;
    }
}
