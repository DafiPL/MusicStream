/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Daos.MemberDao;
import Mailer.sendMail;
import Dtos.Member;
import EncryptionPass.SaltHashPass;
import static EncryptionPass.SaltHashPass.generateHash;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dafi
 */
public class forgotPassowrdCommand {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";

        String username = request.getParameter("username");
        String email = request.getParameter("email");
     

        if (username != null  && email != null  && !username.equals("") && !email.equals("")) {
            HttpSession session = request.getSession();
            MemberDao resetDao = new MemberDao("library");

            //   Member m = memDao.checkLogin(username, pass);
            

                 Member passWord = new Member();
        String password = passWord.randomString(20);

            byte[] salt = SaltHashPass.generateSalt();

                Base64.Encoder enc = Base64.getEncoder();

                String theSalt = enc.encodeToString(salt);

                String pass = SaltHashPass.generateHash(password + theSalt);
                
                
                
                Calendar calendar = Calendar.getInstance();
             
                //add 5 months to current date
               
                calendar.add(Calendar.MONTH, 1);
                //save in startDate and into the 
                java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
                Date expireDate = (Date) expriyDate;

                resetDao.updateExpiryDate(expireDate, username);
                
                
                
                
               
            try {
                sendMail.generateAndSendEmail(email, password);
            } catch (MessagingException ex) {
               Logger.getLogger(forgotPassowrdCommand.class.getName()).log(Level.SEVERE, null, ex);
           }

                

                int rs = 0;

                rs = resetDao.forgotPassowrd(pass, username, email);


                if (rs > 0) {
 //                    session.setAttribute("reset", password);
                      resetDao.updateSalt(theSalt, username);
                    forwardToJsp = "login.html";
                }

             else {
                forwardToJsp = "loginError.jsp";
                session.setAttribute("userEntryError", "invalid username or email adresss");
            }
        }
        return forwardToJsp;
    }
}
