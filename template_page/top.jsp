<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("id") == null){
%>
	<a href="template.jsp?page=login">Login</a> | 
	<a href="template.jsp?page=join">Join</a>
<%} else{%>
	<a href="template.jsp?page=myPage"><%=session.getAttribute("id") %></a>님  환영합니다.
	<a href="logout.jsp">logout</a>
<%} %>
</body>
</html>