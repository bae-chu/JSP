<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>   
<%
	//Date 인스턴스만 format 메서드 사용 가능하기때문에 Calendar 인스턴스를 date 인스턴스로 바꿔줘야함. 
	Calendar calendar = Calendar.getInstance();
	
	Date day=calendar.getTime(); //Calendar 인스턴스를 date 인스턴스로 변환 
	SimpleDateFormat sdf1, sdf2, sdf3, sdf4;
	
	sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	sdf2 = new SimpleDateFormat("''yy년 MMM dd일 E요일");
	sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	sdf4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a");
	
	out.println(sdf1.format(day)+"<br>");
	out.println(sdf2.format(day)+"<br>");
	out.println(sdf3.format(day)+"<br>");
	out.println(sdf1.format(day)+"<br>");
	
%>
</h3>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple date format test 2 </title>
</head>
<body>

</body>
</html>