<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <jsp:useBean id="s" class="com.minds.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<% 
		Connection conn;
	
		String rollno = request.getParameter("rollno");
		System.out.println(rollno);
		
		int rolno= Integer.parseInt(rollno);
		System.out.println(rolno);
		String adminno = request.getParameter("adminno");
		int admnno= Integer.valueOf(adminno);
		String firstname = request.getParameter("studentfname");
		String lastname = request.getParameter("studentlname");
		String fathername = request.getParameter("studentfatname");
		String address = request.getParameter("studentaddress");
		String email = request.getParameter("studentemail");
		String mobileno = request.getParameter("studentmobile");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			databaseconDao01 db1 = new databaseconDao01();
		  	conn = db1.getConnection();
			String sql = "update student set studentRollno=?, studentAdminno=?, studentFirstname=?, StudentLastname=?,studentFathername=?, studentAddress=?,studentEmail=?, studentMobileno=? where id="+rolno;
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, rolno);
			st.setInt(2, admnno);
			st.setString(3, firstname);
			st.setString(4, lastname);
			st.setString(5, fathername);
			st.setString(6, address);
			st.setString(7, email);
			st.setString(8, mobileno);
			
			int i = st.executeUpdate();
			if(i!=0){
				System.out.println("Data Inserted Successfully...!!!");
				out.println("<script type=\"text/javascript\">");
				out.println(" alert('Success');");
				out.println("</script>");
				response.sendRedirect("studentdetails.jsp");
			}
			else{
				System.out.println("Data Not Inserted ...!!!");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	
	%>
</body>
</html>