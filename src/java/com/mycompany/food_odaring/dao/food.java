/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.util.ArrayList;

public interface food {
    public boolean insertFood(ArrayList<Object> args);
    public boolean deleteFood(ArrayList<Object> args);
    public boolean updateFood(ArrayList<Object> args);
    public String foodList();
    public String singleFood(ArrayList<Object> args);
    public String filterFoods(ArrayList<Object> args);
}
