///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Commands;
//
//import Daos.AlbumDao;
//import Daos.ArtistDao;
//import Daos.GenreDao;
//import Daos.MemberDao;
//import Daos.SongDao;
//import Dtos.Member;
//import java.sql.Blob;
//import java.sql.SQLException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author kevin
// */
//public class GetImageCommand implements Command {
//
//    public String execute(HttpServletRequest request, HttpServletResponse response){
//
//        String forwardToJsp = "";
//        HttpSession session = request.getSession();
//        byte[] image;
//        
//        Object resultValue = session.getAttribute("userLogin");
//        Member member = (Member) resultValue;
//
//        String currentuser = member.getUsername();
//
//        
//
//        if ( currentuser != null && !currentuser.equals("")) {
//           
//                MemberDao memberDao = new MemberDao("musicdb");
//                image = memberDao.getAvatar(currentuser);
//                 request.setAttribute("image", image);
//                
//                if (image !=null) {
//                    forwardToJsp = "EditProfile.jsp";
//                } else {
//                    forwardToJsp = "error.jsp";
//                    session.setAttribute("errorMessage", "Method did not work ");
//                }
//            } else {
//                forwardToJsp = "error.jsp";
//                session.setAttribute("errorMessage", "passwords must match");
//            }
//        
//        return forwardToJsp;
//    }
//}
