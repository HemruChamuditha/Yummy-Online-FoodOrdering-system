/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.util.ArrayList;

public interface order_interface {
    public boolean insertOrder(ArrayList<Object> args);
    public boolean deleteOrder(ArrayList<Object> args);
    public boolean currentOrderItemStatusChange(ArrayList<Object> args);
    public boolean saveDataToOrderPlace(ArrayList<Object> args);
    public String oneCusOrderAvailable(ArrayList<Object> args);
    public String getAllOrderList();
    public boolean completedOrderStatusChange(ArrayList<Object> args);
    public boolean updateDriver(ArrayList<Object> args);
    
}
