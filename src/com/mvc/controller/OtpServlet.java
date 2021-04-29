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

import com.otp.verification.Sendotp;

@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int password=Integer.parseInt(request.getParameter("password"));
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		int attempts=(int)session.getAttribute("attempt");
		PrintWriter out=response.getWriter();
		if (attempts<=3)
		{
			if (Sendotp.checkotp(email,password )) {
				session.removeAttribute("attempt");
				session.removeAttribute("email");
				RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");  
	            rd.forward(request,response); 
			}
			else
			{
				attempts=attempts+1;
				session.setAttribute("attempt", attempts);
				out.println("<script type=\"text/javascript\">");
	            out.println("alert('OTP Incorrect ! Enter again');");
	            out.println("</script>");
	            RequestDispatcher rd=request.getRequestDispatcher("otppage.jsp");  
	            rd.include(request,response);  
			}
		}
		else {
			session.removeAttribute("attempt");
			session.removeAttribute("email");
			Sendotp.deleteotp(email);
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Too many incorrect attempts ! Login Again');");
            out.println("</script>");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.include(request,response);  
		}
	}

}
