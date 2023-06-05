/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.entities.User;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.msg;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import com.tech.blog.servlets.EditServlet;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author tanus
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            Fect All Data
            String UserEmail = request.getParameter("user_email");
            String UserName = request.getParameter("user_name");
            String UserPassword = request.getParameter("user_password");
            String UserAbout = request.getParameter("user_about");
            Part part = request.getPart("profile");
            String imageName = part.getSubmittedFileName();

//            Get the user from the session
            HttpSession s = request.getSession();
            s.getAttribute("currentUser");
            User user = (User) s.getAttribute("currentUser");

            user.setAbout(UserAbout);
            user.setEmail(UserEmail);
            user.setPassword(UserPassword);
            user.setName(UserName);
            String oldFile = user.getProfile();
            user.setProfile(imageName);

//            Update DB
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userDao.UpdateUser(user);
            if (ans) {
                String Path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
//                Delete code
                String PathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
//              
                   if(!oldFile.equals("Profile.jpg")){
                       Helper.deleteFile(PathOldFile);
                   }
                if (Helper.saveFile(part.getInputStream(), Path)) {
                    msg m = new msg("Profile Details Updated ", "success", "alert-success");
                    
                    s.setAttribute("msg", m);
                    
                }
                else{
                    msg m = new msg("Something Went Wrong! Try again", "error", "alert-danger");
                   
                   s.setAttribute("msg", m);
                }

            } else {
                msg m = new msg("Something Went Wrong! Try again", "error", "alert-danger");
                   
                   s.setAttribute("msg", m);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
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
