/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class user_Class implements user_interface{
    
    ResultSet rset= null;
    Connection con = null;
    
    @Override
    public boolean insertUser(ArrayList<Object> args) {
        boolean insertSucsses=false;
        con = (Connection) DBConnect.getConnection();
           
        try{
              // Prepare the INSERT statement
              String insertQuery = "INSERT INTO users (fullName, homeAddress, telephone, emailAddress, password, favoriteFood, status, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
              PreparedStatement pstmt = con.prepareStatement(insertQuery);

              // Set the values for the INSERT statement
              pstmt.setString(1, (String) args.get(0));
              pstmt.setString(2, (String) args.get(1));
              pstmt.setString(3, (String) args.get(2));
              pstmt.setString(4, (String) args.get(3));
              pstmt.setString(5, (String) args.get(4));
              pstmt.setString(6, (String) args.get(5));
              pstmt.setString(7, "1");
              pstmt.setTimestamp(8, new java.sql.Timestamp(System.currentTimeMillis()));

              // Execute the INSERT statement
              int rowsInserted = pstmt.executeUpdate();
              if (rowsInserted > 0) {
                insertSucsses=true;
              } else {
                insertSucsses=false;
              }
            
        }catch(Exception e){
            insertSucsses=false;
        }
        
        return insertSucsses;
    }

    @Override
    public String loginUser(ArrayList<Object> args) {
        String insertSucsses="";
        con = (Connection) DBConnect.getConnection();
        
        try{
            PreparedStatement insert = con.prepareStatement("select * from users where emailAddress = ? and password = ?");
            insert.setString(1, (String)args.get(0));
            insert.setString(2, (String)args.get(1));
            
            ResultSet res = insert.executeQuery();
            if(res.next()){
                insertSucsses = res.getString("id")+","+res.getString("fullName");
            }else{
                insertSucsses = "false";
            }
        }catch(SQLException e){
            insertSucsses = "false";
            System.out.print(e);
        }
        return insertSucsses;
    }
    
    @Override
    public String listUser() {
        StringBuilder jsonBuilder = new StringBuilder();

        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM users");
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("fullName");
                String homeAddress = rs.getString("homeAddress");
                String telephone = rs.getString("telephone");
                String emailAddress = rs.getString("emailAddress");
                String favoriteFood = rs.getString("favoriteFood");
                String status = rs.getString("status");
                String timestamp = rs.getString("timestamp");

                if (jsonBuilder.length() > 0) {
                    jsonBuilder.append(",");
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"id\":").append(id).append(",");
                jsonBuilder.append("\"fullName\":\"").append(fullName).append("\",");
                jsonBuilder.append("\"homeAddress\":\"").append(homeAddress).append("\",");
                jsonBuilder.append("\"telephone\":\"").append(telephone).append("\",");
                jsonBuilder.append("\"emailAddress\":\"").append(emailAddress).append("\",");
                jsonBuilder.append("\"favoriteFood\":\"").append(favoriteFood).append("\",");
                jsonBuilder.append("\"status\":\"").append(status).append("\",");
                jsonBuilder.append("\"timestamp\":\"").append(timestamp).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }

    @Override
    public boolean deleteUser(ArrayList<Object> args) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean updatePassUser(ArrayList<Object> args) {
        String email = (String) args.get(0); 
        String newPassword = (String) args.get(1); 

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("UPDATE users SET password = ? WHERE emailAddress = ?");
        ) {
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, email);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // Password update failed
    }

    
   @Override
    public boolean statusChangeUser(ArrayList<Object> args) {
        int userId = (int) args.get(0); 
        String newStatus = (String) args.get(1); 

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("UPDATE users SET status = ? WHERE id = ?");
        ) {
            preparedStatement.setString(1, newStatus);
            preparedStatement.setInt(2, userId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; 
    }

}
