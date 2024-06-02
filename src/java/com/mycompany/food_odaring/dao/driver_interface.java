/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.util.ArrayList;
public interface driver_interface {
    public boolean insertDriver(ArrayList<Object> args);
    public String listDriver();
    public boolean updateDriver(ArrayList<Object> args);
    public String singleDriver(ArrayList<Object> args);
}
