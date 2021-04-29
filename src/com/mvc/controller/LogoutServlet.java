package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mvc.dao.*;
@SuppressWarnings("serial")
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();  
		String username=(String)session.getAttribute("username");
		Removeusername.removeusername(username);
		session.removeAttribute("username");
        session.invalidate();  
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        request.getRequestDispatcher("/Index.jsp").forward(request, response);
	}

	

}
