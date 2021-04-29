package com.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Changepassword {
	@SuppressWarnings("deprecation")
	public static boolean change(String name,String current,String newpass) {
		boolean status = false;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean yes=false;
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
                    .prepareStatement("select * from accounts where username=? and password=?");
            pst.setString(1, name);
            pst.setString(2, current);

            rs = pst.executeQuery();
            yes = rs.next();

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
        if (yes==true)
        {
        	try {
                Class.forName(driver).newInstance();
                conn = DriverManager
                        .getConnection(url + dbName, userName, password);

                pst = conn
                        .prepareStatement("update accounts set password=? where username=?");
                pst.setString(1, newpass);
                pst.setString(2, name);
                int n=0;
                n = pst.executeUpdate();
                if (n!=0) {
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
        }
        return status;
	}
	@SuppressWarnings("deprecation")
	public static boolean changeforget(String email,String phone,String parentemail) {
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
                    .prepareStatement("select * from accounts where email=? and phone=? and parentemail=?");
            pst.setString(1, email);
            pst.setString(2, phone);
            pst.setString(3, parentemail);

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
	@SuppressWarnings("deprecation")
	public static boolean changeforgetpass(String email,String pass) {
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
                    .prepareStatement("update accounts set password=? where email=?");
            pst.setString(1, pass);
            pst.setString(2, email);
            int n=0;
            n = pst.executeUpdate();
            if (n!=0) {
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
