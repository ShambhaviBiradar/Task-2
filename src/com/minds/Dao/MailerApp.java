package com.minds.Dao;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MailerApp")
public class MailerApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MailerApp() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String to = request.getParameter("email");
        String message =  request.getParameter("desc");
        System.out.print("Message... "+message);
       
        SendMail.send(to, message);
        out.println("Mail sent successfully");
        out.println("<br> <a href='viewreports1.jsp'> Back to Send Report </a>");
        out.println("<br> <a href='attendancedetails.jsp'>Send Attendance </a>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
        doGet(request, response);
	}

}
