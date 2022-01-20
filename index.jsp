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
	String id = (String)session.getAttribute("id");
	
	if(id==null){ //id가 null이면 로그인을 열고  
%>

<a href="loginForm.html">로그인</a>

<%
	}else{//아니면 로그아웃 뜨게
%>

<a href="logout">로그아웃</a>

<%
	}
%>


</body>
</html>