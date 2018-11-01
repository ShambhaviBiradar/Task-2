package com.minds.Dao;
import java.sql.*;
import java.util.ArrayList;

import com.minds.bean.Admin;
import com.minds.bean.Attendance;
import com.minds.bean.Marks;
import com.minds.bean.Student;

public class databaseconDao01 {
public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_ia3","root","admin");
	}catch(Exception e){System.out.println(e);}
	return con;
}



public static int save(Admin ad){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into admin(username, password) values(?,?)"  );

ps.setString(1,ad.getUsername()); 
ps.setString(2,ad.getPassword());


status=ps.executeUpdate();
}catch(Exception e){System.out.println(e);}
return status;
}

public static int update(Admin ad){
int status=0;
try{
	Connection con=getConnection();
	PreparedStatement ps=con.prepareStatement("update admin set username=?,password=? where id=?");
	ps.setString(1,ad.getUsername());
	ps.setString(2,ad.getPassword());

	ps.setInt(3,ad.getId());
	status=ps.executeUpdate();
}catch(Exception e){System.out.println(e);}
return status;
}

public static ArrayList<Admin> getAllRecords(){
ArrayList<Admin> list=new ArrayList<Admin>();

try{
	Connection con=getConnection();
	PreparedStatement ps=con.prepareStatement("select * from admin");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Admin ad=new Admin();
		ad.setId(rs.getInt("id"));
		ad.setUsername(rs.getString("username"));
		ad.setPassword(rs.getString("password"));
		
		list.add(ad);
	}
}catch(Exception e){System.out.println(e);}
return list;
}
public static Admin getRecordById(int id){
	Admin ad=null;
try{
	Connection con=getConnection();
	PreparedStatement ps=con.prepareStatement("select * from admin where id=?");
	ps.setInt(1,id);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		ad=new Admin();
		ad.setId(rs.getInt("id"));
		ad.setUsername(rs.getString("username"));
		ad.setPassword(rs.getString("password"));
		
	}
}catch(Exception e){System.out.println(e);}
return ad;
}
















public static int stdsave(Student s){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into student(std_usn, std_name, std_age, std_dob,std_password,std_mobile,std_email, sem,dept,course)  values(?,?,?,?,?,?,?,?,?,?)");
String usn = s.getStd_usn();
System.out.println("USN : "+usn);
ps.setString(1,s.getStd_usn()); 
ps.setString(2,s.getStd_name());
ps.setString(3,s.getStd_age());
ps.setString(4,s.getStd_dob());
ps.setString(5,s.getStd_password());
ps.setString(6,s.getStd_mobile());
ps.setString(7,s.getStd_email());
ps.setString(8,s.getSem());
ps.setString(9,s.getDept());
ps.setString(10,s.getCourse());







status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}


public static int update(Student u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update student set std_usn=?, std_name=?, std_age=?, std_dob=?,std_password=?,std_mobile=?,std_email=?, sem=?,dept=?,course=? where id=?");

ps.setString(1,u.getStd_usn()); 
ps.setString(2,u.getStd_name());
ps.setString(3,u.getStd_age());
ps.setString(4,u.getStd_dob());
ps.setString(5,u.getStd_password());
ps.setString(6,u.getStd_mobile());
ps.setString(7,u.getStd_email());
ps.setString(8,u.getSem());
ps.setString(9,u.getDept());
ps.setString(10,u.getCourse());


status=ps.executeUpdate();
}catch(Exception e){System.out.println(e);}
return status;
}

public static ArrayList<Student> getAllRecords11(){
ArrayList<Student> list=new ArrayList<Student>();

try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from student");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	Student s=new Student();
	s.setId(rs.getInt("id"));
	s.setStd_usn(rs.getString("std_usn"));
	s.setStd_name(rs.getString("std_name"));
	s.setStd_age(rs.getString("std_age"));
	s.setStd_dob(rs.getString("std_dob"));
	s.setStd_password(rs.getString("std_password"));
	s.setStd_mobile(rs.getString("std_mobile"));
	s.setStd_email(rs.getString("std_email"));
	s.setSem(rs.getString("sem"));
	s.setDept(rs.getString("dept"));
	s.setCourse(rs.getString("course"));
	
	

	
	
	list.add(s);
}
}catch(Exception e){System.out.println(e);}
return list;
}
public static Student getRecordById1(int id){
Student s=null;
try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from student where id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	s=new Student();
	s.setId(rs.getInt("id"));
	s.setStd_usn(rs.getString("std_usn")); 
	s.setStd_name(rs.getString("std_name"));
	s.setStd_age(rs.getString("std_age"));
	s.setStd_dob(rs.getString("std_dob"));
	s.setStd_password(rs.getString("std_password"));
	s.setStd_mobile(rs.getString("std_mobile"));
	s.setStd_email(rs.getString("std_email"));
	s.setSem(rs.getString("sem"));
	s.setDept(rs.getString("dept"));
	s.setCourse(rs.getString("course"));
	

	
	
}
}catch(Exception e){System.out.println(e);}
return s;
}





















public static int marksave(Marks m){
	int status=0;

	

	String std_usn =m.getStd_usn("std_usn");
	String sem = m.getSem("sem");
	String course = m.getCourse("course");
	
	String sub01 = m.getSub01("sub01");
	int sub011 = Integer.valueOf(sub01);
	
	String sub02= m.getSub02("sub02");
	int sub021 = Integer.valueOf(sub02);
	String sub03 = m.getSub03("sub03");
	int sub031 = Integer.valueOf(sub03);
	String sub04 = m.getSub04("sub04");
	int sub041 = Integer.valueOf(sub04);
	String sub05 = m.getSub05("sub05");
	int sub051 = Integer.valueOf(sub05);
	String sub06 = m.getSub06("sub06");  
	int sub061 = Integer.valueOf(sub06);

	
	int sum =sub011+sub021+sub031+sub041+sub051+sub061;
	String Max_obt11 = String.valueOf(sum);
	String Max_marks11 ="600";
	double res = sum/6;
	String result11 = String.valueOf(res);
	String remarks11=null;
	if (sub011 <15 && sub021 <15 && sub031<15 && sub041 <15 && sub051 <15 && sub061 <15){
		remarks11 ="Fail"; 
	}
	else if(sub011 >=15 && sub021 >=15 && sub031>=15 && sub041 >=15 && sub051>=15 && sub061>=15){
		remarks11="Pass";
	}
	
	
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into marks(sem,course,std_usn,sub01,sub02,sub03,sub04,sub05,sub06,Max_obt,Max_marks,result,remarks)  values(?,?,?,?,?,?,?,?,?,?,?,?,?)");


		ps.setString(1,m.getSem("sem"));
		ps.setString(2,m.getCourse("course"));
		ps.setString(3,m.getStd_usn("std_usn"));
		
		ps.setString(4,m.getSub01("sub01")); 
		ps.setString(5,m.getSub02("sub02"));
		ps.setString(6,m.getSub03("sub03"));
		ps.setString(7,m.getSub04("sub04"));
		ps.setString(8,m.getSub05("sub05"));
		ps.setString(9,m.getSub06("sub06"));
		
		ps.setString(10,Max_obt11);
		ps.setString(11,Max_marks11);
		ps.setString(12,result11);
		ps.setString(13,remarks11);




status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}
public static int update(Marks m){
	int status=0;
	
	

	String std_usn =m.getStd_usn("std_usn");
	String sem = m.getSem("sem");
	String course = m.getCourse("course");
	
	String sub01 = m.getSub01("sub01");
	int sub011 = Integer.valueOf(sub01);
	
	String sub02= m.getSub02("sub02");
	int sub021 = Integer.valueOf(sub02);
	String sub03 = m.getSub03("sub03");
	int sub031 = Integer.valueOf(sub03);
	String sub04 = m.getSub04("sub04");
	int sub041 = Integer.valueOf(sub04);
	String sub05 = m.getSub05("sub05");
	int sub051 = Integer.valueOf(sub05);
	String sub06 = m.getSub06("sub06");  
	int sub061 = Integer.valueOf(sub06);

	
	int sum =sub011+sub021+sub031+sub041+sub051+sub061;
	String Max_obt11 = String.valueOf(sum);
	String Max_marks11 ="600";
	double res = sum/6;
	String result11 = String.valueOf(res);
	String remarks11=null;
	if (sub011 <15 && sub021 <15 && sub031<15 && sub041 <15 && sub051 <15 && sub061 <15){
		remarks11 ="Fail"; 
	}
	else if(sub011 >=15 && sub021 >=15 && sub031>=15 && sub041 >=15 && sub051>=15 && sub061>=15){
		remarks11="Pass";
	}
	
	

	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update marks set sem=?,course=?,std_usn=?,sub01=?,sub02=?,sub03=?,sub04=?,sub05=?,sub06=?,Max_obt=?,Max_marks=?,result=?,remarks=?,where id=?");

		ps.setString(1,m.getSem("sem"));
		ps.setString(2,m.getCourse("course"));
		ps.setString(3,m.getStd_usn("std_usn"));
		
		ps.setString(4,m.getSub01("sub01")); 
		ps.setString(5,m.getSub02("sub02"));
		ps.setString(6,m.getSub03("sub03"));
		ps.setString(7,m.getSub04("sub04"));
		ps.setString(8,m.getSub05("sub05"));
		ps.setString(9,m.getSub06("sub06"));
	
		ps.setString(10,Max_obt11);
		ps.setString(11,Max_marks11);
		ps.setString(12,result11);
		ps.setString(13,remarks11);



status=ps.executeUpdate();
}catch(Exception e){System.out.println(e);}
return status;
}

public static ArrayList<Marks> getAllRecords111(){
ArrayList<Marks> list=new ArrayList<Marks>();

try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from marks");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	Marks m=new Marks();
	m.setId(rs.getInt("id"));
	
	m.setSem(rs.getString("sem"));
	m.setCourse(rs.getString("course"));
	m.setStd_usn(rs.getString("std_usn"));
	
	m.setSub01(rs.getString("sub01"));
	m.setSub02(rs.getString("sub02"));
	m.setSub03(rs.getString("sub03"));
	m.setSub04(rs.getString("sub04"));
	m.setSub05(rs.getString("sub05"));
	m.setSub06(rs.getString("sub06"));
	
	m.setMax_obt(rs.getString("Max_obt"));
	m.setMax_marks(rs.getString("Max_marks"));
	m.setResult(rs.getString("result"));
	m.setRemarks(rs.getString("remarks"));
	
	
	
	list.add(m);
}
}catch(Exception e){System.out.println(e);}
return list;
}
public static Marks getRecordById11(int id){
	Marks m=null;
try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from marks where id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	m=new Marks();
	

	m.setSem(rs.getString("sem"));
	m.setCourse(rs.getString("course"));
	m.setStd_usn(rs.getString("std_usn"));
	
	m.setSub01(rs.getString("sub01"));
	m.setSub02(rs.getString("sub02"));
	m.setSub03(rs.getString("sub03"));
	m.setSub04(rs.getString("sub04"));
	m.setSub05(rs.getString("sub05"));
	m.setSub06(rs.getString("sub06"));
	
	m.setMax_obt(rs.getString("Max_obt"));
	m.setMax_marks(rs.getString("Max_marks"));
	m.setResult(rs.getString("result"));
	m.setRemarks(rs.getString("remarks"));
	
	

	
	
	
}
}catch(Exception e){System.out.println(e);}
return m;
}


























public static int attendsave(Attendance a){
	int status=0;
	
	

	String rollno = a.getStudentRollno("studentRollno");
	String rolno = String.valueOf("rollno");
	
	String attendance= a.getAttend("attend");
	String date= a.getDate("date");
	
	
	try{
		databaseconDao01 db = new databaseconDao01();
		Connection con= db.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into attendance(studentRollno,  attend, date)  values(?,?,?)");
		
		
		ps.setString(1,rollno);
		ps.setString(2,attendance);
		ps.setString(3,date);
		
 
		int i= ps.executeUpdate();
		if(i!=0){
			status=1;
		}
		else{
			status=0;
		}
	}catch (Exception e){
			e.printStackTrace();
		}
		return status;
		
		
	}


public static int update(Attendance a){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update attendance set studentRollno=?,  attend=?, date=? where id=?");

ps.setString(1,a.getStudentRollno("StudentRollno")); 

ps.setString(2,a.getAttend("attend"));
ps.setString(3,a.getDate("date"));



status=ps.executeUpdate();
}catch(Exception e){System.out.println(e);}
return status;
}

public static ArrayList<Attendance> getAllRecords1(){
ArrayList<Attendance> list=new ArrayList<Attendance>();

try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from attendance");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	Attendance a=new Attendance();
	a.setId(rs.getInt("id"));
	
a.setStudentRollno(rs.getString("studentRollno")); 

a.setAttend(rs.getString("attend"));
a.setDate(rs.getString("date"));


	
	
	list.add(a);
}
}catch(Exception e){System.out.println(e);}
return list;
}
public static Attendance getRecordById111(int id){
	Attendance a=null;
try{
Connection con=getConnection();
PreparedStatement ps=con.prepareStatement("select * from attendance where id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	a=new Attendance();
	a.setId(rs.getInt("id"));
	
	a.setStudentRollno(rs.getString("studentRollno")); 
	
	a.setAttend(rs.getString("attend"));
	a.setDate(rs.getString("date"));
	
	
}
}catch(Exception e){System.out.println(e);}
return a;



}

}