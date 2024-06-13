/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import com.mysql.cj.xdevapi.JsonArray;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class food_category_class implements food_category_interface{

    ResultSet rset= null;
    Connection con = null;
    
    @Override
    public boolean insertFoodCategory(ArrayList<Object> args) {
        if (args == null || args.size() != 2) {
            return false;
        }

        String categoryName = (String) args.get(0);
        String image = (String) args.get(1);
        con = (Connection) DBConnect.getConnection();

        try {
            String insertQuery = "INSERT INTO foods_categories (category_name, image) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, categoryName);
            pstmt.setString(2, image);

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String listFoodCategory() {
        String fcList = "";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM foods_categories");) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                        int id = rs.getInt("id");
                        String category_name = rs.getString("category_name");
                        String image = rs.getString("image");
                        
                        if("".equals(fcList)){
                            fcList = String.valueOf(id)+",,"+category_name+",,"+image;
                        }else{
                            fcList = fcList+"!!!!"+String.valueOf(id)+",,"+category_name+",,"+image;
                        }
                }
        } catch (SQLException e) {
                e.printStackTrace();  
        }
        
        return fcList;
    }

    @Override
    public boolean deleteFoodCategory(ArrayList<Object> args) {
        boolean success = false;

        if (args != null && args.size() == 1) {
           
            PreparedStatement preparedStatement = null;

            try {
                con = DBConnect.getConnection();
                String query = "DELETE FROM foods_categories WHERE id = ?";
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
    public boolean updateFoodCategory(ArrayList<Object> args) {
        boolean success = false;

        if (args != null && args.size() == 2) {
            
            PreparedStatement preparedStatement = null;

            try {
                con = DBConnect.getConnection();
                String query = "UPDATE foods_categories SET category_name = ? WHERE id = ?";
                preparedStatement = con.prepareStatement(query);
                preparedStatement.setString(1, (String) args.get(1)); 
                preparedStatement.setInt(2, (int) args.get(0));    
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

}
