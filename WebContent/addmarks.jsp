<!DOCTYPE html>
<%@page import="com.minds.bean.Marks"%>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<jsp:useBean id="m" class="com.minds.bean.Marks"></jsp:useBean>
<jsp:setProperty property="*" name="m"/>

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
        <li ><a href="addstudent.jsp">Add Student</a></li>
        <li><a href="studentdetails.jsp">Student Details</a></li>
         <li class="active"><a href="addmarks.jsp">Add Student Marks</a></li>
          <li><a href="viewreports1.jsp">Student View Report</a></li>
           <li class=""><a href="attendance.jsp">Add Attendance</a></li>
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
     
    </div>
    <div class="col-sm-8 text-left"> 
      <h2 align="center">Add Student Marks </h2> <br>
      
  <form class="form-horizontal" action="addMrk.jsp">
   
   <div class="form-group">
      <label class="control-label col-sm-4" for="std_usn"> STD USN:</label>
      <div class="col-sm-8">
       <select class="form-control" name="std_usn">
      <%
    	databaseconDao01 db1 = new databaseconDao01();
      	Connection con1 = db1.getConnection();
      	ResultSet rs1=null;
      	String dept;
  		try {
			String sql = "select std_usn from student";
			Statement st = con1.createStatement();
			rs1 = st.executeQuery(sql);
			while(rs1.next()){
				dept = rs1.getString(1);
				%>
			
			<option value="<%String item= String.valueOf(rs1.getString(1)); out.print(item);%>"><% out.print(item);%></option>
			<%
			
		
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
      <label class="control-label col-sm-4" for="sub01">Sub 01:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sub01" placeholder="Enter Sub01 Marks" name="sub01" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="sub02">Sub 02:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sub02" placeholder="Enter Sub02 Marks" name="sub02" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="sub03">Sub 03:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="sub03" placeholder="Enter Sub03 Marks" name="sub03" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="sub04">Sub 04:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sub04" placeholder="Enter Sub04 Marks" name="sub04" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="sub05">Sub 05:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sub05" placeholder="Enter sub05 Marks" name="sub05" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-4" for="sub06">Sub 06:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="sub06" placeholder="Enter sub06 Marks" name="sub06" required>
        
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
