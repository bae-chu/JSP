<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.Connection"%>    
    
    <%
	Connection conn = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
		conn = ds.getConnection();
		out.println("<h3>연결되었습니다.</h3>");
				
	}catch (Exception e){
		out.println("<h3>연결에 실패하였습니다</h3>");
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>