/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class class_driver implements driver_interface{

    ResultSet rset= null;
    Connection con = DBConnect.getConnection();
    
    @Override
    public boolean insertDriver(ArrayList<Object> args) {
        try {
            String sql = "INSERT INTO driver (full_name, address, nic, telephone_number, license_number, license_level, driving_experience_years, photo_path) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, args.get(0).toString()); 
            preparedStatement.setString(2, args.get(1).toString()); 
            preparedStatement.setString(3, args.get(2).toString()); 
            preparedStatement.setString(4, args.get(3).toString()); 
            preparedStatement.setString(5, args.get(4).toString()); 
            preparedStatement.setString(6, args.get(5).toString()); 
            preparedStatement.setInt(7, 4); 
            preparedStatement.setString(8, args.get(7).toString()); 
            
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public String listDriver() {
        String driverList = "";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM driver");) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
               
                        int id = rs.getInt("id");
                        String full_name = rs.getString("full_name");
                        String address = rs.getString("address");
                        String nic = rs.getString("nic");
                        String telephone_number = rs.getString("telephone_number");
                        String license_number = rs.getString("license_number");
                        String license_level = rs.getString("license_level");
                        String driving_experience_years = rs.getString("driving_experience_years");
                        String photo_path = rs.getString("photo_path");
                        String time_stamp = rs.getString("time_stamp");
                        String status = rs.getString("status");
                        
                        if("".equals(driverList)){
                            driverList = String.valueOf(id)+",,"+full_name+",,"+address+",,"+nic+",,"+telephone_number+",,"+license_number+",,"+license_level+",,"+driving_experience_years+",,"+photo_path+",,"+time_stamp+",,"+status;
                        }else{
                            driverList = driverList+"!!!!"+String.valueOf(id)+",,"+full_name+",,"+address+",,"+nic+",,"+telephone_number+",,"+license_number+",,"+license_level+",,"+driving_experience_years+",,"+photo_path+",,"+time_stamp+",,"+status;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        
        return driverList;
    }

    @Override
    public String singleDriver(ArrayList<Object> args) {
        StringBuilder jsonBuilder = new StringBuilder();

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM driver where id = ?");
        ) {
            preparedStatement.setObject(1, args.get(0));
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String full_name = rs.getString("full_name");
                String address = rs.getString("address");
                String nic = rs.getString("nic");
                String telephone_number = rs.getString("telephone_number");
                String license_number = rs.getString("license_number");
                String license_level = rs.getString("license_level");
                String driving_experience_years = rs.getString("driving_experience_years");
                String photo_path = rs.getString("photo_path");
                String time_stamp = rs.getString("time_stamp");
                String status = rs.getString("status");

                if (jsonBuilder.length() > 0) {
                    jsonBuilder.append("!!!!");
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"id\":").append(id).append(",");
                jsonBuilder.append("\"full_name\":\"").append(full_name).append("\",");
                jsonBuilder.append("\"address\":\"").append(address).append("\",");
                jsonBuilder.append("\"nic\":\"").append(nic).append("\",");
                jsonBuilder.append("\"telephone_number\":\"").append(telephone_number).append("\",");
                jsonBuilder.append("\"license_number\":\"").append(license_number).append("\",");
                jsonBuilder.append("\"license_level\":\"").append(license_level).append("\",");
                jsonBuilder.append("\"driving_experience_years\":\"").append(driving_experience_years).append("\",");
                jsonBuilder.append("\"photo_path\":\"").append(photo_path).append("\",");
                jsonBuilder.append("\"time_stamp\":\"").append(time_stamp).append("\",");
                jsonBuilder.append("\"status\":\"").append(status).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }


    
    public boolean deleteDriver(ArrayList<Object> args) {
        boolean success = false;

        if (args != null && args.size() == 1) {
           
            PreparedStatement preparedStatement = null;

            try {
                con = DBConnect.getConnection();
                String query = "DELETE FROM driver WHERE id = ?";
                preparedStatement = con.prepareStatement(query);
                preparedStatement.setInt(1, (int) args.get(0)); 
                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    success = true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (preparedStatement != null) {
                    try {
                        preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        return success;
    }

    @Override
    public boolean updateDriver(ArrayList<Object> args) {
        boolean updated = false;
        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(
                "UPDATE driver SET full_name = ?, address = ?, license_level = ?, driving_experience_years = ? , status = ? WHERE id = ?");
        ) {
            preparedStatement.setString(1, args.get(0).toString());
            preparedStatement.setString(2, args.get(1).toString()); 
            preparedStatement.setString(3, args.get(2).toString());
            preparedStatement.setInt(4, Integer.parseInt(args.get(3).toString()));
            preparedStatement.setString(5, args.get(4).toString()); 
            preparedStatement.setInt(6, Integer.parseInt(args.get(5).toString())); 
            

            int rowsAffected = preparedStatement.executeUpdate();
            updated = rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }

     
}
