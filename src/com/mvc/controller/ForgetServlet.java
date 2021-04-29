package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.*;
@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		PrintWriter out=response.getWriter();
		String parentemail=request.getParameter("parentemail");
		if (Changepassword.changeforget(email, phone, parentemail)) {
        	HttpSession session=request.getSession();
        	session.setAttribute("email",email);
            RequestDispatcher rd=request.getRequestDispatcher("Resetpassword.jsp");  
            rd.forward(request,response); 
		}
		else
		{
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Credentials dont match');");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("ChangePassword.jsp");  
            rd.include(request,response);  
		}
	}

}
