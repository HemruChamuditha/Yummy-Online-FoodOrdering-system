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

public class class_order implements order_interface{

    ResultSet rset= null;
    Connection con = null;
    
    @Override
    public boolean insertOrder(ArrayList<Object> args) {
        int userId = (int) args.get(0);
        int productId = (int) args.get(1);
        int quantity = (int) args.get(2);

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement(
                     "INSERT INTO orders (user_id, product_id, quantity , price , status) VALUES (?, ?, ? , ?,?)")) {

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setString(4, args.get(3).toString());
            preparedStatement.setString(5, "1");

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean deleteOrder(ArrayList<Object> args) {
        int orderId = (int) args.get(0);

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM orders WHERE order_id = ?");
        ) {
            preparedStatement.setInt(1, orderId);
            int rowsDeleted = preparedStatement.executeUpdate();

            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    @Override
    public boolean currentOrderItemStatusChange(ArrayList<Object> args) {
        int userId = (int) args.get(0); 

        try (Connection con = DBConnect.getConnection();
             PreparedStatement selectStatement = con.prepareStatement("SELECT order_id FROM orders WHERE user_id = ? AND status = 1");
             PreparedStatement updateStatement = con.prepareStatement("UPDATE orders SET status = 2 WHERE order_id = ?");
        ) {
            con.setAutoCommit(false); 

            selectStatement.setInt(1, userId);
            ResultSet rs = selectStatement.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");

                updateStatement.setInt(1, orderId);
                updateStatement.executeUpdate();
            }

            con.commit(); 
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        return false; 
    }

    

    @Override
    public boolean saveDataToOrderPlace(ArrayList<Object> args) {
       String itemList = (String) args.get(0); 
       String cusId = (String) args.get(1);
       String totalPrice = (String) args.get(2); 

       try (Connection con = DBConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO complete_orders (item_list, cus_id, t_price, order_date, status , location) VALUES (?, ?, ?, NOW(), ? , ?)");
       ) {
           preparedStatement.setString(1, itemList);
           preparedStatement.setString(2, cusId);
           preparedStatement.setString(3, totalPrice);
           preparedStatement.setString(4, "1");
           preparedStatement.setString(5, args.get(3).toString());

           int rowsAffected = preparedStatement.executeUpdate();

           return rowsAffected > 0;
       } catch (SQLException e) {
           e.printStackTrace();
       }

       return false;
    }

    @Override
    public String oneCusOrderAvailable(ArrayList<Object> args) {
        int userId = (int) args.get(0); 
        StringBuilder jsonBuilder = new StringBuilder();
        boolean isFirst = true; 

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("SELECT o.*, f.name AS food_name FROM orders o JOIN foods f ON o.product_id = f.id WHERE o.user_id = ? AND o.status = 1");
        ) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                String price = rs.getString("price");
                String orderDate = rs.getString("order_date");
                String foodName = rs.getString("food_name");

                if (!isFirst) {
                    jsonBuilder.append(",");
                } else {
                    isFirst = false;
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"order_id\":").append(orderId).append(",");
                jsonBuilder.append("\"product_id\":").append(productId).append(",");
                jsonBuilder.append("\"quantity\":").append(quantity).append(",");
                jsonBuilder.append("\"price\":\"").append(price).append("\",");
                jsonBuilder.append("\"order_date\":\"").append(orderDate).append("\",");
                jsonBuilder.append("\"food_name\":\"").append(foodName).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }
    
    @Override
    public String getAllOrderList() {
        StringBuilder jsonBuilder = new StringBuilder();
        boolean isFirst = true;

        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT o.*, u.fullName AS customer_name FROM complete_orders o JOIN users u ON o.cus_id = u.id");
        ) {
            while (rs.next()) {
                int corderId = rs.getInt("corder_id");
                String itemList = rs.getString("item_list");
                String cusName = rs.getString("customer_name"); 
                String totalPrice = rs.getString("t_price");
                String orderDate = rs.getString("order_date");
                String location = rs.getString("location");
                String status = rs.getString("status");

                if (!isFirst) {
                    jsonBuilder.append(",");
                } else {
                    isFirst = false;
                }

                jsonBuilder.append("{");
                jsonBuilder.append("\"corder_id\":").append(corderId).append(",");
                jsonBuilder.append("\"item_list\":\"").append(itemList).append("\",");
                jsonBuilder.append("\"customer_name\":\"").append(cusName).append("\","); 
                jsonBuilder.append("\"t_price\":\"").append(totalPrice).append("\",");
                jsonBuilder.append("\"order_date\":\"").append(orderDate).append("\",");
                jsonBuilder.append("\"location\":\"").append(location).append("\",");
                jsonBuilder.append("\"status\":\"").append(status).append("\"");
                jsonBuilder.append("}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "[" + jsonBuilder.toString() + "]";
    }

    @Override
    public boolean completedOrderStatusChange(ArrayList<Object> args) {
        String status = (String) args.get(1);
        int orderId = (int) args.get(0);
        boolean result = false;

        try (Connection con = DBConnect.getConnection();
             PreparedStatement preparedStatement = con.prepareStatement("UPDATE complete_orders SET status = ? WHERE corder_id = ?");
        ) {
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, orderId);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    @Override
    public boolean updateDriver(ArrayList<Object> args) {
       
        int orderId = Integer.parseInt((String) args.get(0));
        String newDriver = (String) args.get(1);

        try (Connection con = DBConnect.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("UPDATE complete_orders SET driver = ? WHERE corder_id = ?");
        ) {
            preparedStatement.setString(1, newDriver);
            preparedStatement.setInt(2, orderId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

  
    
}
