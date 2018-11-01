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
        <li class="active"><a href="userwelcome.jsp">Add Student</a></li>
        <li><a href="attendance.jsp">Attendance</a></li>
        <li><a href="attendancedetails.jsp">Attendance Details</a></li>
        <li><a href="studentdetails.jsp">Student Details</a></li>
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
  <form class="form-horizontal" action="updateStudent.jsp">
  <div class="form-group">
  <% 
  		String id = request.getParameter("id");
  		try {
			String user = (String)session.getAttribute("user");
			databaseconDao01 db1 = new databaseconDao01();
		  	Connection con = db1.getConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			String sql = "select * from student where id='"+id+"'";
			rs = st.executeQuery(sql);
			while (rs.next()) {
			session.setAttribute("id", rs.getInt("studentRollno"));
		 
  %>
      <label class="control-label col-sm-4" for="rollno"></label>
      <div class="col-sm-8">
        <input type="hidden" class="form-control" id="rollno" value="<%=rs.getInt("studentRollno") %>" name="rollno"> 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="adminno"></label>
      <div class="col-sm-8">
        <input type="hidden" class="form-control" id="adminno"  value="<%=rs.getInt("studentAdminno") %>" name="adminno" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentfname">Student Firstname:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="studentfname" value="<%=rs.getString("studentFirstname") %>" name="studentfname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentlname">Student Lastname:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="studentlname" value="<%=rs.getString("studentLastname") %>" name="studentlname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentfatname">Student Fathername:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="studentfatname" value="<%=rs.getString("studentFathername") %>" name="studentfatname" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentaddress"> Address:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="studentaddress" value="<%=rs.getString("studentAddress") %>" name="studentaddress" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentemail"> Email:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="studentemail" value="<%=rs.getString("studentEmail") %>" name="studentemail" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="studentmobile"> Mobile No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="studentmobile" value="<%=rs.getString("studentMobileno") %>" name="studentmobile" required>
      </div>
      <%
			}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-4 col-sm-10">
        <button type="submit" class="btn btn-primary">Update</button>
         <!-- <button type="submit" class="btn btn-default">Cancel</button> -->
      </div>
     </div>
  </form>
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
