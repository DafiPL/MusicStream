/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import CommandFactory.CommandFactory;
import Commands.Command;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author grahamm
 */
@WebServlet(name = "FrontController", urlPatterns
        = {
            "/FrontController"
        })
public class FrontController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


 String forwardToJsp = "";
        String action = request.getParameter("action");
        
        if (action != null)
        {
            // Choose which action to carry out
            // Deal with if the user wants to update a customer
            CommandFactory factory = new CommandFactory();
            Command command = factory.createCommand(action);
            
            if(command != null)
            {
                forwardToJsp = command.execute(request, response);
            }
            // Deal with where there was no valid action provided
            else
            {
                // There was no action to be taken, so set the page to be viewed to the error page
                forwardToJsp = "error.jsp";
                // Get the session so we can add information to it
                HttpSession session = request.getSession();

                // Add an error message to the session to be displayed on the error page
                // This lets us inform the user about what went wrong
                session.setAttribute("errorMessage", "No valid action was supplied");
            }
        } else
        {
            // There was no action to be taken, so set the page to be viewed to the error page
            forwardToJsp = "error.jsp";
            // Get the session so we can add information to it
            HttpSession session = request.getSession();

            // Add an error message to the session to be displayed on the error page
            // This lets us inform the user about what went wrong
            session.setAttribute("errorMessage", "No action information was supplied");
        }

        // Send back the name of the page for the user to view
        response.sendRedirect(forwardToJsp);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
