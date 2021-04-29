package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mvc.dao.*;
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String current=request.getParameter("current_password");
		String newpass=request.getParameter("new_password");
		String name=null;
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
    	name=(String)session.getAttribute("username");
    	if (Changepassword.change(name, current, newpass)) {
    		out.println("<script type=\"text/javascript\">");
     	   out.println("alert('Password Sucessfully Changed');");
     	   out.println("location='Profile.jsp';");
     	   out.println("</script>");
    	}
    	else {
    		out.println("<script type=\"text/javascript\">");
      	   out.println("alert('Password did not Change. Check your details again');");
      	   out.println("location='ChangePassword.jsp';");
      	   out.println("</script>");
    	}
	}

}
