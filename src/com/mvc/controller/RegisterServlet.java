package com.mvc.controller;
import com.mvc.dao.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


 
import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String email = request.getParameter("email");
        String parentemail = request.getParameter("parentemail");
        String teacheremail = request.getParameter("teacheremail");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("psw");
        PrintWriter out = response.getWriter();
        RegisterBean registerBean = new RegisterBean();
       //Using Java Beans - An easiest way to play with group of related data
        registerBean.setPhoneNumber(phonenumber);
        registerBean.setEmail(email);
        registerBean.setUserName(username);
        registerBean.setPassword(password); 
        registerBean.setParentemail(parentemail);
        registerBean.setTeacheremail(teacheremail);
        RegisterDao registerDao = new RegisterDao();
        if (CheckUser.checkuser(username)) {
        	out.println("<script type=\"text/javascript\">");
     	   out.println("alert('Username exists');");
     	   out.println("location='register.jsp';");
     	   out.println("</script>");
        	
        }
       //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        else{
        	String userRegistered = registerDao.registerUser(registerBean);
        	if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
            {
            	   out.println("<script type=\"text/javascript\">");
            	   out.println("alert('Registration Sucessful ! Welcome Buddy');");
            	   out.println("location='login.jsp';");
            	   out.println("</script>");
            }
            else   //On Failure, display a meaningful message to the User.
            {
            	   out.println("<script type=\"text/javascript\">");
            	   out.println("alert('Registration Unsucessful ! Try Again');");
            	   out.println("location='register.jsp';");
            	   out.println("</script>");
            }
        }
       
       
	}

}
