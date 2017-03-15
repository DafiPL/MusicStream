/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Daos.MemberDao;
import Dtos.Member;
import EncryptionPass.SaltHashPass;
import Mailer.sendMail;
//import static encriptPassword.SaltHashPass.generateHash;
//import static encriptPassword.SaltHashPass.generateSalt;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

/**
 *
 * @author Dafi
 */
public class RegisterCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        String username = request.getParameter("username");
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        // String password = request.getParameter("password");

        Member passWord = new Member();

        String password = passWord.randomString(16);
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String adress = request.getParameter("addressLine1");
        String town = request.getParameter("town");
        String county = request.getParameter("county");
        String usertpye = "user";
        long phoneConvert = Long.valueOf(phone);

        if (username != null && password != null && !username.equals("") && !password.equals("") && fname != null && !fname.equals("") && lname != null && !lname.equals("") && phone != null && !phone.equals("") && email != null && !email.equals("")
                && adress != null && !adress.equals("") && town != null && !town.equals("") && county != null && !county.equals("")) {
            MemberDao memDao = new MemberDao("musicdb");

            Member checkUser = null;
            checkUser = memDao.getUserByUsername(username);

            if (checkUser == null) {

                byte[] salt = SaltHashPass.generateSalt();

                Base64.Encoder enc = Base64.getEncoder();

                String theSalt = enc.encodeToString(salt);

                String pass = SaltHashPass.generateHash(password + theSalt);
                // (2) create a java sql register date object we want to insert
                Calendar calendar = Calendar.getInstance();
                java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
                //add 5 months to current date
                Date todaysDate = (Date) ourJavaDateObject;
                calendar.add(Calendar.MONTH, 1);
                //save in startDate and into the 
                java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
                Date expireDate = (Date) expriyDate;

                Member u = new Member(username, fname, lname, usertpye, pass, phoneConvert, email, adress, town, county, theSalt, todaysDate, expireDate, "./images/avatar.png");
                int addMember = memDao.addMember(u);
                HttpSession session = request.getSession();

                if (addMember > 0) {

                    try {
                        sendMail.generateAndSendEmail(email, password);
                    } catch (MessagingException ex) {
                        Logger.getLogger(forgotPassowrdCommand.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    session.setAttribute("regInfo", u);
                    HttpSession session2 = request.getSession();
                    session.setAttribute("theGeneratedPassword", password);

                    forwardToJsp = "registerSuccess.jsp";
                }

            } else {
                forwardToJsp = "loginError.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("userEntryError", "Username Already Taken");
            }
        } else {

        }

        return forwardToJsp;
    }
}
