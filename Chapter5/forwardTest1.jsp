<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<jsp:forward page='<%=request.getParameter("forwardPage") %>'>
	<jsp:param value="034-1234-5678" name="tel"/>
</jsp:forward>
</body>
</html>