<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";	//시드이름 
	
	Boolean connect = false;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, "java", "java");
		
		connect = true;
		
		conn.close();
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
	//실행시켰을때 하단 console 창에 아무것도 안떠야 정상임.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc 연동 테스트 예제</title>
</head>
<body>
<h3>
<%if(connect == true){ %>
	연결되었습니다.
<%}else{ %>
	연결에 실패하였습니다.
<%} %> 
</h3>
</body>
</html>
