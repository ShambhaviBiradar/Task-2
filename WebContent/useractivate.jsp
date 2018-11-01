<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <jsp:useBean id="s" class="com.minds.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="ad"/>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	String id = request.getParameter("id");
	try 
		{
				String user = (String)session.getAttribute("user");
				databaseconDao01 db1 = new databaseconDao01();
			  	Connection con = db1.getConnection();
				Statement st = con.createStatement();
				ResultSet rs;
				String message = null;
				rs = st.executeQuery("select status from user where user_Id = '" + id + "'");
				while (rs.next()) {
					int ad = rs.getInt("status");
					ad=1;
					PreparedStatement ps;
					String sql = "update user set status='"+s+"' where user_Id ='"+id+"'";
					ps = con.prepareStatement(sql);
					int i =ps.executeUpdate();
					if(i!=0){
						message = "Activation successful";
					%>
					
					<%
					//JOptionPane.showMessageDialog(null, "Status Activated");
					
					}
					else{
						message = "Activation Failed..!!!";
						%>
						<%
					}
					session.setAttribute("message", message);
					response.sendRedirect("adminwelcome.jsp");
				}
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
</body>
</html>