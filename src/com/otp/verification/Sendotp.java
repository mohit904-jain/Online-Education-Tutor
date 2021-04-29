package com.otp.verification;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.email.send.override;

public class Sendotp {
	@SuppressWarnings("deprecation")
	public static boolean sendotpemail(String email) {
		int otpvalue=0;
		Random rand = new Random();
		otpvalue=rand.nextInt(9999);
		if (otpvalue<=999)
		{
			otpvalue+=1000;
		}
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
                    .prepareStatement("insert into otp(email,otpnumber) values(?,?)");
            pst.setString(1, email);
            pst.setInt(2,otpvalue);
            int i=0;
            i = pst.executeUpdate();
            if (i!=0) {
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
        boolean y=sendmail(email,otpvalue);
        boolean x=false;
        if (status==true && y==true) {
        	x=true;
        }
        return x;
	}
	public static boolean sendmail(String email,int otpvalue) {
		boolean status=false;
		final String username="vgurulearning@gmail.com";
		final String password="vguru12345";
		Properties prop=new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starttls.enable",true);
		prop.put("mail.smtp.host","smtp.gmail.com");
		prop.put("mail.smtp.port","587");
		Session session=Session.getInstance(prop,
				new javax.mail.Authenticator() {
			@override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username,password);
			}
	});
		try {
			Message message =new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			String to = email;
			InternetAddress[] parse = InternetAddress.parse(to , true);
			message.setRecipients(Message.RecipientType.TO,parse);
			MimeBodyPart textpart=new MimeBodyPart();
			Multipart multipart=new MimeMultipart();
			String finaltext="The OTP for login is "+otpvalue;
			textpart.setText(finaltext);
			message.setSubject("OTP for login");
			multipart.addBodyPart(textpart);
			message.setContent(multipart);
			Transport.send(message);
			status=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
		
	}
	@SuppressWarnings("deprecation")
	public static boolean checkotp(String email,int otpvalue) {
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
                    .prepareStatement("select * from otp where email=? and otpnumber=?");
            pst.setString(1, email);
            pst.setInt(2,otpvalue);
            
            rs = pst.executeQuery();
            status=rs.next();

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
        if (status==true) {
        	try {
                Class.forName(driver).newInstance();
                conn = DriverManager
                        .getConnection(url + dbName, userName, password);

                pst = conn
                        .prepareStatement("delete from otp where email=? and otpnumber=?");
                pst.setString(1, email);
                pst.setInt(2,otpvalue);
                
                pst.executeUpdate();
                String username=getusername(email);
                pst = conn
                        .prepareStatement("insert into currentusers(username) values (?)");
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
		return status;
	}
	@SuppressWarnings("deprecation")
	public static void deleteotp(String email) {
		
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
                    .prepareStatement("delete from otp where email=?");
            pst.setString(1, email);
            
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
	@SuppressWarnings("deprecation")
	
	public static String getusername(String email) {
		String username=null;
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
	            
	            rs=pst.executeQuery();
	            while (rs.next())
	            {
	            	username=rs.getString(1);
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
		return username;
	}
}
