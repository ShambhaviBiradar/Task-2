<!DOCTYPE html>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<jsp:useBean id="s" class="com.minds.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>

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
     th,td, tr{
    text-align: center;
    
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
        <li><a href="adminwelcome.jsp">Home</a></li>
        <li><a href="addstudent.jsp">Add Student</a></li>
        <li class="active"><a href="#">Student Details</a></li>
        
        <li><a href="addmarks.jsp"> Add Student Marks</a></li>
         <li><a href="viewreports1.jsp">Student View Report</a></li>
         <li class=""><a href="attendance.jsp">Add Attendance</a></li>
         <li><a href="attendancedetails.jsp">Attendance Report</a></li>
        <li><a href="login.jsp">Logout</a></li>
       
      </ul>
     
    </div>
  </div>
</nav>
 <hr> 
  <div class="jumbotron" style="background-size:cover">  
<div class="container-fluid text-center">
 
  <div class="row content">
       
    <div class="col-sm-2 ">
     
    </div>
         
  <div class="col-sm-8 text-left"> 
 
	<h2>User's Table</h2><br>
	<div class="table-responsive-xl table-responsive-sm table-responsive-md table-responsive-lg">
   <table class="table table-bordered">
    <thead>
		<tr>
			<th>ID</th>
			<th>Student USN NO</th>
			<th>Student Name</th>
			<th>Student Age</th>
			<th>Student DOB</th>
			<th>SEM</th>
			<th>DEPT</th>
			<th>Course</th>
			<!-- <th>Edit</th> -->
		</tr>
		</thead>
		<%
				
			try {
				String user = (String)session.getAttribute("user");
				databaseconDao01 db = new databaseconDao01();
		      	Connection con = db.getConnection();
				Statement st = con.createStatement();
				ResultSet rs;
				String sql = "select * from student";
				rs = st.executeQuery(sql);
				while (rs.next()) {
		%>
		<tbody>
		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("std_usn")%></td>
			<td><%=rs.getString("std_name")%></td>
			<td><%=rs.getString("std_age")%></td>
			<td><%=rs.getString("std_dob")%></td>
		
			<td><%=rs.getString("sem")%></td>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("course")%></td>
			<%-- <td><a href="studentedit.jsp?id=<%=rs.getInt("id")%>">Edit</a> </td> --%>
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
    
    </div>
  </div>
</div>
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
