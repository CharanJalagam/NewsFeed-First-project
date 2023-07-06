/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.news.feed.servlet;

import com.news.feed.dao.Userdao;
import com.news.feed.entities.Message;
import com.news.feed.entities.User;
import com.news.feed.helper.ConnectionProvider;
import com.news.feed.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.*;

/**
 *
 * @author jalag
 */
@MultipartConfig
public class EditProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //fetch the data
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
            String password=request.getParameter("user_password");
            String about=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imagename=part.getSubmittedFileName();
            //get the session of user
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("CurrentUser");
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(about);
            String oldImg=user.getProfile();
            user.setProfile(imagename);
            //update
            
            Userdao dao=new Userdao(ConnectionProvider.getConnection());
            boolean ans=dao.updateUser(user);
            if(ans){
                String path=request.getServletContext().getRealPath ("/") + "pics" + File.separator+user.getProfile();
                
                 String oldpath=request.getServletContext().getRealPath ("/") + "pics" + File.separator+oldImg;
                 if(oldImg.equals("default.jpg")){
                Helper.deleteImage(oldpath);
                 }
                if(Helper.saveImage(part.getInputStream(), path)){
                
                    Message msg=new Message("Profile Updated Succesfully...","success","alert-success");
                
                    s.setAttribute("msg", msg);
                }
                
                    Message msg=new Message("Profile Updated Succesfully...","success","alert-success");
                
                s.setAttribute("msg", msg);
                
            
            }
            else{
                Message msg=new Message("Something went wrong...","error","alert-danger");
                
                s.setAttribute("msg", msg);
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
