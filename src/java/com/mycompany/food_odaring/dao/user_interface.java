
package com.mycompany.food_odaring.dao;

import java.util.ArrayList;

public interface user_interface {
    public boolean insertUser(ArrayList<Object> args);
    public String loginUser(ArrayList<Object> args);
    public String listUser();
    public boolean deleteUser(ArrayList<Object> args);
    public boolean updatePassUser(ArrayList<Object> args);
    public boolean statusChangeUser(ArrayList<Object> args);
    
}
