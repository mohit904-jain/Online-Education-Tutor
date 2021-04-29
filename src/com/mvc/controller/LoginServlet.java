package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.LoginDao;
import com.otp.verification.Sendotp;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
 

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginServlet() {
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
	        PrintWriter out = response.getWriter();  
	        
	        String n=request.getParameter("email");  
	        String p=request.getParameter("pass");

	        if (LoginDao.validateadmin(n, p)) {
	        	String name="";
	        	name=LoginDao.getadminname(n,p);
	        	HttpSession session=request.getSession();
	        	session.setAttribute("username",name);
	            RequestDispatcher rd=request.getRequestDispatcher("Adminhome.jsp");  
	            rd.forward(request,response); 
	        }
	        else if(LoginDao.validate(n, p)){  
	        	String name="";
	        	name=LoginDao.getname(n,p);
	        	HttpSession session=request.getSession();
	        	session.setAttribute("username",name);
	        	session.setAttribute("email", n);
	        	session.setAttribute("attempt", 1);
	        	out.println("<script type=\"text/javascript\">");
	            out.println("alert('OTP Sent via Email');");
	            out.println("</script>");
	        	if (Sendotp.sendotpemail(n)) {
	            RequestDispatcher rd=request.getRequestDispatcher("otppage.jsp");  
	            rd.forward(request,response); 
	            }
	        	else
	        	{
	        		out.println("<script type=\"text/javascript\">");
		            out.println("alert('OTP Send Error');");
		            out.println("</script>");
		            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
		            rd.include(request,response);  
	        	}
	        	
	        }  
	        else{  
	        	out.println("<script type=\"text/javascript\">");
	            out.println("alert('Email or password incorrect');");
	            out.println("</script>");
	            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	            rd.include(request,response);  
	        }  

	        out.close();  
	}

}
