package com.email.send;
import java.sql.Connection;

import java.sql.SQLException;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class sendemail {
	@SuppressWarnings({ "deprecation", "resource" })
	public static boolean store(String username,String grade, String subject ,String act, int score ) {
		Connection conn = null;
		boolean status = false;
        PreparedStatement pst = null;
        boolean x=false;
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
                    .prepareStatement("select * from quizmarks where username=? and class=? and subject=? and activity=?");
            pst.setString(1,username);
            pst.setString(2,grade);
            pst.setString(3,subject);
            
            pst.setString(4,act);
            ResultSet rs=null;
            rs = pst.executeQuery();
            x=rs.next();
            if (x==false) {
            	pst = conn
                        .prepareStatement("insert into quizmarks(username,class,subject,activity,marks) values (?,?,?,?,?)");
                pst.setString(1,username);
                pst.setString(2,grade);
                pst.setString(3,subject);
               
                pst.setString(4,act);
                pst.setInt(5, score);
                pst.executeUpdate();
                status=true;
            }
            else
            {
            	 pst = conn
                         .prepareStatement("update quizmarks set marks=? where username=? and class=? and subject=? and activity=?");
                 pst.setInt(1, score);
                 pst.setString(2,username);
                 pst.setString(3,grade);
                 pst.setString(4,subject);
                
                 pst.setString(5,act);
                 pst.executeUpdate();
                 status=true;

            }

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
           
        }
        
		return status;
	}
	@SuppressWarnings("deprecation")
	public static boolean mailservice(String username,String grade, String subject ,String act, int score )
	{
		Boolean status =false;
		Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String parentemail = null,teacheremail=null;
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
                    .prepareStatement("select parentemail,teacheremail from accounts where username=?");
            pst.setString(1, username);
            

            rs = pst.executeQuery();
            while (rs.next()) {
            	parentemail=rs.getString("parentemail");
            	teacheremail=rs.getString("teacheremail");
            }
           
            boolean yes=gmailsendemail.gmailservice(username,grade,subject,act,score,parentemail,teacheremail);
            if (yes==true)
            {
            	status=true;
            }

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
		return status;
		
	}
	
}
