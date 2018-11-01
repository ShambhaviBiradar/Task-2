<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	 String user = request.getParameter("username");
    String email = request.getParameter("email");
    String pwd = request.getParameter("password");
    String address = request.getParameter("address");
    String mobile  = request.getParameter("mobile");
    int status =0;
   /*  Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentattend","root",""); */
    databaseconDao01 db1 = new databaseconDao01();
  	Connection con = db1.getConnection();
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into user(username ,password, email_Id, address, mobile, status) values ('" +user+ "','" + email + "','" + pwd + "','" + address + "','"+mobile+"','"+status+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("login.jsp");
        String userid = (String)session.getAttribute("user");
        %>
       <script type="text/javascript">
			
       </script>
      
    <%} else {
        response.sendRedirect("reg.jsp");
    }
	
	
	%>
</body>
</html>