package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Removeusername {
	@SuppressWarnings("deprecation")
	public static void removeusername(String username) {
		  Connection conn = null;
	        PreparedStatement pst = null;
	        ResultSet rs = null;

	        String url = "jdbc:mysql://localhost:3306/";
	        String dbName = "database";
	        String driver = "com.mysql.jdbc.Driver";
	        String userName = "root";
	        String password = "";
	        try {
	            Class.forName(driver).newInstance();
	            conn = DriverManager
	                    .getConnection(url + dbName, userName, password);

	            pst = conn
	                    .prepareStatement("delete from currentusers where username=?");
	            pst.setString(1, username);
	            
	            pst.executeUpdate();
	            

	        } catch (Exception e) {
	            System.out.println(e);
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (pst != null) {
	                try {
	                    pst.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (rs != null) {
	                try {
	                    rs.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	}
}
