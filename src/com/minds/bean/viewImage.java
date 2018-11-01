package com.minds.bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class viewImage1
 */
@WebServlet("/viewImage")
public class viewImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		Connection conn;
		 Statement stmt;
		 ResultSet rs;
		 String id = request.getParameter("id");
         try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentattend","root","");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select status from user where user_Id = '" + id + "'");
			while (rs.next()) {
				int s = rs.getInt("status");
				s=0;
				PreparedStatement ps;
				String sql = "update user set status='"+s+"' where user_Id ='"+id+"'";
				ps = con.prepareStatement(sql);
				int i =ps.executeUpdate();
				if(i!=0){
					//message = "Activation successful";
				System.out.println("De-Activation successful");
				//out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>");
				/*out.println("<html><head>");
				out.println("</head>");
				out.println("<body>");
				out.println("<script language='text/javascript'>");
			    out.println("alert('De-Activation successful');");
			    out.println("</script>");
			    out.println("</body>");
			    out.println("</html>");*/
			    request.setAttribute("message", "De-Activation successful..!");
				
				}
				else{
					//message = "Activation Failed..!!!";
					System.out.print("De-Activation unsuccessful");
				}
				//session.setAttribute("message", message);
				
				response.sendRedirect("adminwelcome.jsp");
			}
			
	}
	catch(Exception e){
		e.printStackTrace();
	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
