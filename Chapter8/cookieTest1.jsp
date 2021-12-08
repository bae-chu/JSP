<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie=new Cookie("name", "honkildong");	
	response.addCookie(cookie);
	cookie=new Cookie("gender", "male");
	response.addCookie(cookie);
	cookie=new Cookie("Age", "20");
	response.addCookie(cookie);
	cookie=new Cookie("nation", "Korea");
	response.addCookie(cookie);
	cookie.setMaxAge(600);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=cookie.getName() %></h2>
<h2><%=cookie.getValue() %></h2>
<h2><%=cookie.getMaxAge() %></h2>

<a href="cookieTest2.jsp">쿠키 값 불러오기</a>
</body>
</html>