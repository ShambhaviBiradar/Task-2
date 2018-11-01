<%@page import="com.minds.Dao.*"%>
<jsp:useBean id="a" class="com.minds.bean.Attendance"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="G:\Workspace_Java\CRUD_ExampleJSP\WebContent\WEB-INF\bootstrap-3.3.7-dist\css\bootstrap.css" rel="stylesheet" type="text/css"/>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
  </script>

</head>
<body style="background-image: url('pic28.jpg'); text-align:center;">


<%
int i=databaseconDao01.attendsave(a);
if(i>0){
response.sendRedirect("attendancedetails.jsp");
}else{
response.sendRedirect("attendance.jsp");
}
%>




</body>

</html>