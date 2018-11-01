<!DOCTYPE html>
<%@page import="com.minds.Dao.databaseconDao01"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%String usn = request.getParameter("std_usn");
System.out.println(usn);
%>


<jsp:useBean id="m" class="com.minds.bean.Marks"></jsp:useBean>
<jsp:setProperty property="*" name="m"/>

<html lang="en"> 
<head>
  <title>Student Result</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	  <link rel="stylesheet" href="css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="js/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="js/buttons.dataTables.min.css">
  
  
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
   
	.labelName{
		color: #111;
		font-weight: bolder;
		width: 50%;
		border: 1px #ddd;
		   border-top-width: 0px;
    border-left-width: 0px;
    border-bottom-width: 0px;
    border-right-width: 0px;
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
        <li ><a href="addstudent.jsp">Add Student</a></li>
        <li><a href="studentdetails.jsp">Student Details</a></li>
         <li ><a href="addmarks.jsp">Add Student Marks</a></li>
       <li class="active"><a href="viewreports1.jsp">Student View Report</a></li>
        <li><a href="attendance.jsp">Add Attendance</a></li>
        
         <li><a href="attendancedetails.jsp">Attendance Report</a></li>
        <li><a href="admin.jsp">Logout</a></li>
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
  <div class="jumbotron" style="background-size:cover">  
<div class="container-fluid text-center">
 
  <div class="row content">
       
    <div class="col-sm-2 ">
     <!--  <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p> -->
    </div>
         
  <div class="col-sm-8 text-left"> 
 
	<h2>User's Table <a href="mail.jsp?usn=<%=usn %>" style="text-align:right">Send Mail</a></h2><br>
	<div class="table-responsive-xl table-responsive-sm table-responsive-md table-responsive-lg">
	
	
	
  <table id="example" class="display nowrap" style="width:100%">
  
  
    <thead>
    	<tr>
    		<td >Subject </td>
    		<td >Marks</td>
    	</tr>
    </thead>
    <tbody>
    		<%
				
			try {
				
				
				databaseconDao01 db = new databaseconDao01();
		      	Connection con = db.getConnection();
				Statement st = con.createStatement();
				ResultSet rs;
				String sql = "select * from marks where std_usn ='"+usn+"'";
				rs = st.executeQuery(sql);
				while (rs.next()) {
		%>
		
		
    	<tr>
    			<td class="labelName">SEM</td>
    		<td><%=rs.getString("sem")%></td>
    	</tr>
    	<tr>
    		<td class="labelName">Course</td>
    		<td><%=rs.getString("course")%></td>
    	</tr>
    	<tr>
    			<td class="labelName">STD USN</td>
    		<td><%=rs.getString("std_usn")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 01</td>
    		<td><%=rs.getString("sub01")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 02</td>
    		<td><%=rs.getString("sub02")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 03</td>
    		<td><%=rs.getString("sub03")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 04</td>
    		<td><%=rs.getString("sub04")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 05</td>
    		<td><%=rs.getString("sub05")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">SUB 06</td>
    		<td><%=rs.getString("sub06")%></td>
		
    	</tr>
    	<tr>
    		<td class="labelName">Marks Obtained</td>
    			<td><%=rs.getString("Max_obt")%></td>
			
    	</tr>
    	<tr>
    			<td class="labelName">Max Marks </td>
    		<%-- <td><a href="studentedit.jsp?id=<%=rs.getInt("id")%>">Edit</a> </td> --%>
			<td><%=rs.getString("Max_marks")%></td>
			
    	</tr>
    	<tr>
    		<td class="labelName">Result</td>
    		<td><%=rs.getString("result")%> &nbsp; %</td>
    	</tr>
    	<tr>
    		<td class="labelName">Remarks</td>
    		<td><%=rs.getString("remarks")%> </td>
    	</tr>
			<%
			}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
    </tbody>
    	
	
	</table>
	</div>
	</div>


    <div class="col-sm-2 ">
    
 <!--  <p><a href="#">Link</a></p>
 <p><a href="#">Link</a></p>
 <p><a href="#">Link</a></p>  -->
    
    </div>
  </div>
</div>
</div>


<script type="text/javascript" language="javascript"  src="js/jquery-1.12.4.js"></script>
  <script src="js/bootstrap.min.js"></script>

	<script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/buttons.flash.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/jszip.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/pdfmake.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="js/buttons.html5.min.js"></script>
	<script type="text/javascript" language="javascript" src="js/buttons.print.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	console.log("now setting table");
    $('#example').DataTable( {
        dom: 'Bfrtip',
        "order": [],
        lengthMenu:[[-1 ],['Show all']],
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
</script>
</body>
</html>
