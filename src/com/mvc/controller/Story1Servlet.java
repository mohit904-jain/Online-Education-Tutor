package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.email.send.*;
@WebServlet("/Story1Servlet")
public class Story1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();  
	 		String name=(String)session.getAttribute("username");
	    	 String subject="Story Learning";
	    	 String grade="Class LKG";
	    	 String act="Story1 quiz";
	    	 
	    	 String ans1=request.getParameter("question1");
	    	 String ans2=request.getParameter("question2");
	    	 String ans3=request.getParameter("question3");
	    	 String ans4=request.getParameter("question4");
	    	 String ans5=request.getParameter("question5");
	    	 String ans6=request.getParameter("question6");
	    	 String ans7=request.getParameter("question7");
	    	 String ans8=request.getParameter("question8");
	    	 String ans9=request.getParameter("question9");
	    	 String ans10=request.getParameter("question10");
	    	
	    	 int score=0;
	    	 if (ans1.equals("The Thirsty crow"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans2.equals("Summer day"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans3.equals("Crow"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans4.equals("Pitcher"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans5.equals("He picked up small stones"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans6.equals("He dropped the stones one by one in the pitcher"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans7.equals("The water rise in pitcher"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans8.equals("The crow drinks water"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans9.equals("Yesr"))
	    	 {
	    		 score++;
	    	 }
	    	 if (ans10.equals("Crow"))
	    	 {
	    		 score++;
	    	 }
	    	 if (score<7)
	    	 {
	    		 PrintWriter out = response.getWriter();
	    		 out.println("<script type=\"text/javascript\">");
	      	   out.println("alert('You have scored less ! So take again');");
	      	   out.println("location='Story1.jsp';");
	      	   out.println("</script>");
	    	 }
	    	 else {
	    		 PrintWriter out = response.getWriter();
	    		 boolean yes=sendemail.store(name,grade,subject,act,score);
	    		 boolean yes1=sendemail.mailservice(name,grade,subject,act,score);
	    		 if (yes==true && yes1==true) {
	    		 out.println("<script type=\"text/javascript\">");
	      	   out.println("alert('You have passed the assessments and reports have been sent');");
	      	   out.println("location='Storymain.jsp';");
	      	   out.println("</script>");}
	    		 else
	    		 {
	    			 out.println("<script type=\"text/javascript\">");
	    	      	   out.println("alert('You have passed the assessments but reports error');");
	    	      	   out.println("location='Storymain.jsp';");
	    	      	   out.println("</script>");
	    		 }
	    	 }
	}

}
