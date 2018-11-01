<!DOCTYPE html>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<jsp:useBean id="a" class="com.minds.bean.Attendance"></jsp:useBean>
<jsp:setProperty property="*" name="a"/>

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
    .row.content {height: 550px}
    
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

<nav class="navbar navbar-inverse fixed-nav-bar" >
  <div class="container-fluid" >
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
        <li><a href="userwelcome.jsp">Add Student</a></li>
      
        <li><a href="studentdetails.jsp">Student Details</a></li>
        
        <li><a href="addmarks.jsp"> Add Student Marks</a></li>
         <li><a href="viewreports1.jsp">Student View Report</a></li>
        
        <li class="active"><a href="attendance.jsp">Add Attendance</a></li>
         <li><a href="attendancedetails.jsp">Attendance Report</a></li>
    
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
      <h2 align="center">Add Attendance </h2> <br>
      
  <form class="form-horizontal" action="addAttend.jsp">
  
  
  
  
  <div class="form-group">
  
  

   
      <label class="control-label col-sm-4" for="std_usn">Student USN:</label>
      <div class="col-sm-8">
      <select class="form-control" name="studentRollno">
     
      
      <%
  String  studentRollno;
  //int stdadminno=0;
  ResultSet rs=null;
  try {
		
		databaseconDao01 db = new databaseconDao01();
		Connection conn = db.getConnection();
		
		String sql = "select std_usn from student";
		Statement st = conn.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()){
			studentRollno = rs.getString(1);
			%>
			
			<option value="<%String item= String.valueOf(rs.getString(1)); out.print(item);%>"><% out.print(item);%></option>
			<%
			System.out.println("Roll No:"+studentRollno);
			
		}
  }
  catch(Exception e){
	  e.printStackTrace();
  }
  %>
		
	  </select>
   
      </div>
    </div>
    
    
   
    <div class="form-group">
      <label class="control-label col-sm-4" for="attendance">Attendance:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="attendance" placeholder="Enter Student attendance" name="attend" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="date">Date:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="date" placeholder="Enter date YYYY-MM-DD" name="date" required>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-10">
        <button type="submit" class="btn btn-primary">Submit</button>
         <button type="submit" class="btn btn-default">Cancel</button>
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
