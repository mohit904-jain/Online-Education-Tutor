package com.mvc.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {
	public String registerUser(RegisterBean registerBean)
    {
        String phonenumber = registerBean.getPhoneNumber();
        String email = registerBean.getEmail();
        String userName = registerBean.getUserName();
        String password = registerBean.getPassword();
        String teacheremail=registerBean.getTeacheremail();
        String parentemail=registerBean.getParentemail();
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.createConnection();
            String query = "insert into accounts(username,password,email,phone,parentemail,teacheremail) values (?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(4, phonenumber);
            preparedStatement.setString(3, email);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            preparedStatement.setString(5, parentemail);
            preparedStatement.setString(6, teacheremail);
            
            int i= preparedStatement.executeUpdate();
            
            if (i!=0)  //Just to ensure data has been inserted into the database
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
	@SuppressWarnings("deprecation")
	public static boolean validate(String email) {        
        boolean status = false;
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
                    .prepareStatement("select * from accounts where email=?");
            pst.setString(1, email);

            rs = pst.executeQuery();
            status = rs.next();

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
