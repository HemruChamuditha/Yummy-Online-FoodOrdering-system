package com.mycompany.food_odaring.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class class_food implements food {

    ResultSet rset = null;
    Connection con = DBConnect.getConnection();

    @Override
    public boolean insertFood(ArrayList<Object> args) {
        boolean inserted = false;
        try (PreparedStatement preparedStatement = con.prepareStatement(
            "INSERT INTO foods (name, img, food_category, description, price) VALUES (?, ?, ?, ?, ?)"
        )) {
            preparedStatement.setString(1, args.get(0).toString()); 
            preparedStatement.setString(2, args.get(1).toString()); 
            preparedStatement.setString(3, args.get(2).toString()); 
            preparedStatement.setString(4, args.get(4).toString()); 
            preparedStatement.setString(5, args.get(3).toString());

            int rowsAffected = preparedStatement.executeUpdate();
            inserted = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inserted;
    }

    @Override
    public boolean deleteFood(ArrayList<Object> args) {
        boolean deleted = false;
        try (PreparedStatement preparedStatement = con.prepareStatement(
            "DELETE FROM foods WHERE id = ?"
        )) {
            preparedStatement.setInt(1, Integer.parseInt(args.get(0).toString())); 

            int rowsAffected = preparedStatement.executeUpdate();
            deleted = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deleted;
    }

    @Override
    public boolean updateFood(ArrayList<Object> args) {
        boolean updated = false;
        try (PreparedStatement preparedStatement = con.prepareStatement(
            "UPDATE foods SET name = ?, description = ?, price = ? WHERE id = ?"
        )) {
            preparedStatement.setString(1, args.get(0).toString()); 
            preparedStatement.setString(2, args.get(1).toString()); 
            preparedStatement.setString(3, args.get(2).toString()); 
            preparedStatement.setInt(4, Integer.parseInt(args.get(3).toString())); 

            int rowsAffected = preparedStatement.executeUpdate();
            updated = rowsAffected > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }
    
    @Override
    public String foodList() {
        StringBuilder jsonBuilder = new StringBuilder();
        boolean isFirst = true; // To track the first object

        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM foods");
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String img = rs.getString("img");
                String foodCategory = rs.getString("food_category");
                String description = rs.getString("description");
                String price = rs.getString("price");
                String timestamp = rs.getString("timestamp");

                if (!isFirst) {
                    jsonBuilder.append(",");
                } else {
                    isFirst = false;
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"id\":").append(id).append(",");
                jsonBuilder.append("\"name\":\"").append(name).append("\",");
                jsonBuilder.append("\"img\":\"").append(img).append("\",");
                jsonBuilder.append("\"food_category\":\"").append(foodCategory).append("\",");
                jsonBuilder.append("\"description\":\"").append(description).append("\",");
                jsonBuilder.append("\"price\":\"").append(price).append("\",");
                jsonBuilder.append("\"timestamp\":\"").append(timestamp).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }

    @Override
    public String singleFood(ArrayList<Object> args) {
        StringBuilder jsonBuilder = new StringBuilder();

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM foods WHERE id = ?");
        ) {
            preparedStatement.setObject(1, args.get(0));
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String img = rs.getString("img");
                String foodCategory = rs.getString("food_category");
                String description = rs.getString("description");
                String price = rs.getString("price");
                String timestamp = rs.getString("timestamp");

                if (jsonBuilder.length() > 0) {
                    jsonBuilder.append(",");
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"id\":").append(id).append(",");
                jsonBuilder.append("\"name\":\"").append(name).append("\",");
                jsonBuilder.append("\"img\":\"").append(img).append("\",");
                jsonBuilder.append("\"food_category\":\"").append(foodCategory).append("\",");
                jsonBuilder.append("\"description\":\"").append(description).append("\",");
                jsonBuilder.append("\"price\":\"").append(price).append("\",");
                jsonBuilder.append("\"timestamp\":\"").append(timestamp).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }

    @Override
    public String filterFoods(ArrayList<Object> args) {
        String searchName = (String) args.get(0);
        String searchCategory = (String) args.get(1);

        StringBuilder jsonBuilder = new StringBuilder();
        boolean isFirst = true;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM foods WHERE name LIKE ? AND food_category LIKE ?");
        ) {
            preparedStatement.setString(1, "%" + searchName + "%");
            preparedStatement.setString(2, "%" + searchCategory + "%");

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String img = rs.getString("img");
                String foodCategory = rs.getString("food_category");
                String description = rs.getString("description");
                String price = rs.getString("price");
                String timestamp = rs.getString("timestamp");

                if (!isFirst) {
                    jsonBuilder.append(",");
                } else {
                    isFirst = false;
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"id\":").append(id).append(",");
                jsonBuilder.append("\"name\":\"").append(name).append("\",");
                jsonBuilder.append("\"img\":\"").append(img).append("\",");
                jsonBuilder.append("\"food_category\":\"").append(foodCategory).append("\",");
                jsonBuilder.append("\"description\":\"").append(description).append("\",");
                jsonBuilder.append("\"price\":\"").append(price).append("\",");
                jsonBuilder.append("\"timestamp\":\"").append(timestamp).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }


}
