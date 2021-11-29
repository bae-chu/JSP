<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("name", "김유신");
request.setAttribute("name", "홍길동");
%>
<%
pageContext.forward("pageContextTest2.jsp");
%>
<%=pageContext.getAttribute("name") %>
<br>
<%=request.getAttribute("name") %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
