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

@WebServlet("/Checkandsave")
public class Checkandsave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession session=request.getSession();  
 		String name=(String)session.getAttribute("username");
    	 String subject="English";
    	 String grade="Class 12";
    	 String act="Unit 1 quiz";
    	 
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
    	 if (ans1.equals("Alphonse Daudet"))
    	 {
    		 score++;
    	 }
    	 if (ans2.equals("Procastination"))
    	 {
    		 score++;
    	 }
    	 if (ans3.equals("Time and school"))
    	 {
    		 score++;
    	 }
    	 if (ans4.equals("Loss of language and freedom"))
    	 {
    		 score++;
    	 }
    	 if (ans5.equals("Change of teachers"))
    	 {
    		 score++;
    	 }
    	 if (ans6.equals("The defeat of Prussia"))
    	 {
    		 score++;
    	 }
    	 if (ans7.equals("Lorraine"))
    	 {
    		 score++;
    	 }
    	 if (ans8.equals("Transition"))
    	 {
    		 score++;
    	 }
    	 if (ans9.equals("Wanted to enjoy outdoor"))
    	 {
    		 score++;
    	 }
    	 if (ans10.equals("soft and kind"))
    	 {
    		 score++;
    	 }
    	 if (score<7)
    	 {
    		 PrintWriter out = response.getWriter();
    		 out.println("<script type=\"text/javascript\">");
      	   out.println("alert('You have scored less ! So take again');");
      	   out.println("location='unit1quiz.jsp';");
      	   out.println("</script>");
    	 }
    	 else {
    		 PrintWriter out = response.getWriter();
    		 boolean yes=sendemail.store(name,grade,subject,act,score);
    		 boolean yes1=sendemail.mailservice(name,grade,subject,act,score);
    		 if (yes==true && yes1==true) {
    		 out.println("<script type=\"text/javascript\">");
      	   out.println("alert('You have passed the assessments and reports have been sent');");
      	   out.println("location='class12english.jsp';");
      	   out.println("</script>");}
    		 else
    		 {
    			 out.println("<script type=\"text/javascript\">");
    	      	   out.println("alert('You have passed the assessments but reports error');");
    	      	   out.println("location='class12english.jsp';");
    	      	   out.println("</script>");
    		 }
    	 }
    	 
	}

}
