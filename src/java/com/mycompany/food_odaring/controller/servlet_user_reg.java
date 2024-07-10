/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.food_odaring.controller;

import com.mycompany.food_odaring.dao.user_Class;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nadun Sandeepa
 */
public class servlet_user_reg extends HttpServlet {

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
            // Retrieve the user data from the request parameters
            String fullName = request.getParameter("fullName");
            String homeAddress = request.getParameter("homeAddress");
            String telephone = request.getParameter("telephone");
            String emailAddress = request.getParameter("emailAddress");
            String password = request.getParameter("password");
            String favoriteFood = request.getParameter("favoriteFood");
            String status = "1";
            Timestamp timestamp = new Timestamp(System.currentTimeMillis()); 
            
            if(addUsers(fullName,homeAddress,telephone,emailAddress,password,favoriteFood,status,timestamp)){
                out.println(1);
            }else{
                out.println(0); 
            }
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

    private boolean addUsers(String fullName, String homeAddress, String telephone, String emailAddress, String password, String favoriteFood, String status, Timestamp timestamp) {
         ArrayList<Object> userData = new ArrayList<>();
         userData.add(fullName);
         userData.add(homeAddress);
         userData.add(telephone);
         userData.add(emailAddress);
         userData.add(password);
         userData.add(favoriteFood);
         userData.add(status);
         userData.add(timestamp);
         boolean isAdded = new user_Class().insertUser(userData);
         return isAdded;
    }

}
