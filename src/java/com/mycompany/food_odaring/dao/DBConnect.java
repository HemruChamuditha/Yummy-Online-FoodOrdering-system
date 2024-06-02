/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.food_odaring.dao;

import java.sql.DriverManager;

/**
 *
 * @author DELL
 */
public class DBConnect {
   
        private static final String url="jdbc:mysql://localhost:3306/yummy";
        private static final String user="root";
        private static final String pass=""; 
        private static java.sql.Connection con;
        
        //jdbc:mysql://127.0.0.1:3306/?user=root
                
        public static java.sql.Connection getConnection(){
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=  DriverManager.getConnection(url, user, pass);
                //System.out.print("Database Connection  Success.");
            }catch(Exception e){
                System.out.println("Database Connection not SUCCESS");
            }
            return con;
            
        }
        
        
        
}
