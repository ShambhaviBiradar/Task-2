<!DOCTYPE html>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    
   th,td, tr{
    text-align: center;
    
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
      <a class="navbar-brand" href="#">Student Internal Record System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="welcome.jsp">Home</a></li>
        <li><a href="addstudent.jsp">Add Student</a></li>
         <li><a href="studentdetails.jsp">Student Details</a></li>
          <li><a href="addmarks.jsp"> Add Student Marks</a></li>
         <li><a href="viewreports1.jsp">Student View Report</a></li>
         <li ><a href="attendance.jsp">Add Attendance</a></li>
         <li class="active"><a href="attendancedetails.jsp">Attendance Report</a></li>
        <li><a href="login.jsp">Logout</a></li>
       <!--  <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li> -->
      </ul>
      <!-- <ul class="nav navbar-nav navbar-right">
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
      
  <div class="col-sm-8 text-left"> 
	<h2>User's Table</h2><br>
   <table class="table table-bordered table-responsive">
    <thead>
		<tr >
			
			<th>ID</th>
			<th>Student RollNo</th>
			
			<th>Attendance</th>
			<th>Date</th>
			<th>Send Email</th>
		</tr>
		</thead>
		<%
				
			try {
				String user = (String)session.getAttribute("user");
				
				databaseconDao01 db = new databaseconDao01();
		      	Connection con = db.getConnection();
				Statement st = con.createStatement();
				ResultSet rs;
				String sql = "select * from attendance";
				rs = st.executeQuery(sql);
				while (rs.next()) {
		%>
		<tbody>
		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("studentRollno")%></td>
			
			<td><%=rs.getString("attend")%></td>
			<td><%=rs.getString("date")%></td>
			<td><a href="report.jsp?usn=<%=rs.getString("studentRollno")%>">Send Mail</a> </td>
		</tr>
		 </tbody>
		<%
			}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	</div>

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
