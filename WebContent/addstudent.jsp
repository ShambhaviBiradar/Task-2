<!DOCTYPE html>
<%@page import="com.minds.bean.Student"%>
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
        <li><a href="adminwelcome.jsp">Home</a></li>
        <li class="active"><a href="#">Add Student</a></li>
        <li><a href="studentdetails.jsp">Student Details</a></li>
        
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
<div class="container-fluid text-center">
<div class="jumbotron">        
  <div class="row content">
    <div class="col-sm-2 ">
     
    </div>
    <div class="col-sm-8 text-left"> 
      <h2 align="center">Add Student </h2> <br>
      
  <form class="form-horizontal" action="addStd.jsp">
  
  <div class="form-group">
      <label class="control-label col-sm-4" for="usnno">USN No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="usnno" placeholder="Enter Roll No" name="std_usn" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="stdname">Student Name:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="stdname" placeholder="Enter Student Name" name="std_name" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="std_age">Student age:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="std_age" placeholder="Enter Student age" name="std_age" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="std_dob">Student DOB:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="std_dob" placeholder="DOB MM-DD-YYYY" name="std_dob" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="std_pass">Student Password:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="std_pass" placeholder="Enter Student Password" name="std_password" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-4" for="mobile">Mobile No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="mobile" placeholder="Enter Mobile" name="std_mobile" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-4" for="std_email">Email :</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="std_email" placeholder="Enter Email " name="std_email" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="semid"> SEM:</label>
      <div class="col-sm-8">
        <select class="form-control" name="sem">
      	<option value="1st sem">1</option>
        <option value="2nd sem">2</option>
		<option value="3rd sem">3 </option>
        <option value="4th sem">4</option>
        <option value="5th sem">5 </option>
        <option value="6th sem">6</option>
	  </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="dept"> DEPTARTMENT:</label>
      <div class="col-sm-8">
       <select class="form-control" name="dept">
      	<option value="UG">UG </option>
        <option value="PG">PG</option>
        		
	  </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="courseid"> Course :</label>
      <div class="col-sm-8">
        <select class="form-control" name="course">
        <option value="CSE">CSE </option>
        <option value="ECE">ECE </option>
        <option value="MECH">MECH</option>
        <option value="EEE">EEE</option>
        <option value="IT">IT</option>
        <option value="CE">CE </option>
	  </select>
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
