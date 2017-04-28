/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

import Daos.ReviewDao;
import Dtos.Member;
import Dtos.Review;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kevin
 */
public class AddReviewCommand implements Command {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String forwardToJsp = "";
        HttpSession session = request.getSession();

        String review = request.getParameter("review");
        String reviewalbumid = request.getParameter("reviewalbumid");
        int Reviewalbumid = Integer.valueOf(reviewalbumid);

        Object loginValue = session.getAttribute("userLogin");
        Member member = (Member) loginValue;
        String username = member.getUsername();

       
        
        
        if (!username.equals("")&& username != null &&! reviewalbumid.equals("")&& reviewalbumid != null &&! review.equals("")&& review != null ){
           
            ReviewDao reviewDao = new ReviewDao("musicdb");
            Review r = new Review(username, review, Reviewalbumid);
            reviewDao.addReview(r);
            
            ArrayList<Review> reviews = null;
            
            reviews = reviewDao.getAllReviewsByAlbumId(Reviewalbumid);
            
            if (reviews !=null){
                session.setAttribute("allreviews", reviews);
                forwardToJsp = "albumDetailPage.jsp";
            }
            
            

       
    }
     return forwardToJsp;
    }
}
