<!DOCTYPE html>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% String usn =request.getParameter("usn");
String res="";
System.out.println(usn);
%>
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      	<li><a href="welcome.jsp">Home</a></li>
        <li><a href="addstudent.jsp">Add Student</a></li>
        <li class=""><a href="attendance.jsp">Attendance</a></li>
        <li class=""><a href="attendancedetails.jsp">Attendance Details</a></li>
         <li class="active"><a href="attendmail.jsp">Mail Attendance</a></li>
        <li class=""><a href="studentdetails.jsp">Student Details</a></li>
        <li><a href="login.jsp">Logout</a></li>
      </ul>
     <!--  <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul> -->
    </div>
  </div>
</nav>
<hr>
<div class="container-fluid text-center">
<div class="jumbotron">    
  <div class="row content">
    <div class="col-sm-2 ">
      <!-- <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p> -->
    </div>
    <div class="col-sm-8 text-left"> 
      
  <h2 align="center">Report to Parent</h2>
  <form class="form-horizontal" action="MailerApp" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="username">Email Id:</label>
      
      <div class="col-sm-10">
      <%
      try {
			/* String roll = request.getParameter("id"); */
    	 // int rollno = Integer.parseInt(request.getParameter("studentRollno"));
			System.out.print(usn);
    	  String user = (String)session.getAttribute("user");
			/* Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_ia3", "root", "admin"); */
			databaseconDao01 db = new databaseconDao01();
	      	Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			String sql = "select * from student where std_usn ='"+usn+"'";
			System.out.print(sql);
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String email = rs.getString("std_email"); 
      %>
        <input type="text" class="form-control" id="username" value=<%=email %> name="email">
      <%}
      }
      catch(Exception e){
    	  e.printStackTrace();
      }
			%>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd"></label>
      <div class="col-sm-10">
       <%
      try {
			/* String roll = request.getParameter("id"); */
    	 // int rollno = Integer.parseInt(request.getParameter("studentRollno"));
			System.out.print(usn);
    	  String user = (String)session.getAttribute("user");
			/* Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_ia", "root", ""); */
			databaseconDao01 db = new databaseconDao01();
	      	Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			String sql = "select * from marks where std_usn ='"+usn+"'";
			System.out.println(sql);
			rs = st.executeQuery(sql);
			while (rs.next()) {
				String sem = rs.getString("sem"); 
				String course = rs.getString("course"); 
				String std_usn = rs.getString("std_usn"); 
				String attendance = rs.getString("attend");
				String date = rs.getString("date"); 
			
				
				res = "<h2> Hello Parents </h2>"
				+"<br> <h2> Attendance Report of your Child </h2>"
				+"<table border='1' color='blue' id='example' style='width:60%'>"
				+"<thead>"
				+"<tr><td style='font-weight: bold; color:red;'>Subject</td>"
				+"<td>Marks</td></tr>"
				+"</thead>"
				+"<tbody>"
				+"<tr><td class='labelName'>SEM</td><td>"+sem+"</td></tr>"
				+"<tr><td class='labelName'>Course</td>"
				+"<td>"+course+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>STD USN</td>"
				+"<td>"+std_usn+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Attendance</td>"
				+"<td>"+attendance+"</td>"
				+"</tr>"
				+"<tr><td class='labelName'>Date</td>"
				+"<td>"+date+"</td>"
				+"</tr>"
				
				
   				+"</tbody></table>"
   				+"<br>"
   				+"Wish You a Great Learing Ahead";
   				
	    			
 
			System.out.println(res);	
      %>
      
        <%-- <textarea  rows="4" cols="90" name ="desc" value=<%=res %>></textarea> --%>
      <%}
      }
      catch(Exception e){
    	  e.printStackTrace();
      }
			%>          
        
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      <input type="hidden" class="form-control" id="desc"  value="<%=res %>" name="desc" >
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="attendancedetails.jsp"> Back</a>
      </div>
    </div>
   </form>

    </div>
    <div class="col-sm-2 ">
      <!-- <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p> -->
    </div>
  </div>
</div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
