<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
pageValue=<%=pageContext.getAttribute("pageScope") %><br>
requestValue=<%=request.getAttribute("requestScope") %>
</body>
</html> 5