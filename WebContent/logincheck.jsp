<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("username");    
    String pwd = request.getParameter("password");
    databaseconDao01 db1 = new databaseconDao01();
  	Connection con1 = db1.getConnection();
    Statement st = con1.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from student where std_name='" + user + "' and std_password='" + pwd + "'");
    if (rs.next()) {
    	
        session.setAttribute("user", user);
        //out.println("welcome " + userid);
        response.sendRedirect("welcome.jsp");
    
    	
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
</body>
</html>