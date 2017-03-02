/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.MemberDao;
import Dtos.Member;
import static EncryptionPass.SaltHashPass.generateHash;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dafi
 */
public class LoginCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "";
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Member m = null;
        if (username != null && password != null && !username.equals("") && !password.equals("")) {
            MemberDao memDao = new MemberDao("musicdb");
            session.setAttribute("name", username);
            
            String salt = memDao.getSaltbyUsername(username);
            String pass = generateHash(password+salt);
             m = memDao.checkLogin(username, pass);
            session.setAttribute("userLogin", m);
            if (m != null) {
             Calendar calendar = Calendar.getInstance();
                java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
               Date todaysDate = (Date) ourJavaDateObject;
               
                  calendar.add(Calendar.MONTH, 2);
                //save in startDate and into the 
                java.sql.Date expriyDate = new java.sql.Date(calendar.getTime().getTime());
                Date expireDate = (Date) expriyDate;
            
               boolean flag = false;
               
               Date expiryDate = memDao.getExpriyDate(username);
            flag = todaysDate.after(expiryDate);
            
            
            
            
         
                 
                
                if(m.getUserType().equalsIgnoreCase("admin"))
                {
                    forwardToJsp = "adminMenu.jsp";
                       if(flag == true){
               forwardToJsp = "forgotResetPassword.jsp";
            }
                }
                else
                {
                   forwardToJsp = "LoginSuccess.jsp"; 
                      if(flag == true){
               forwardToJsp = "forgotResetPassword.jsp";
            }
                }
                
                 session.setAttribute("userLogin", m);
            } else{
                
               
                session.setAttribute("userEntryError", "username and password do not match");
                forwardToJsp = "loginError.jsp";
            }
        } 
        return forwardToJsp;

    }

}
