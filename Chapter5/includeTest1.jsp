<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include action test</title>
</head>
<body>
<h2>include action test</h2>
<%request.setAttribute("id", "id"); %>
<jsp:include page="includeTest2.jsp">
	<jsp:param name="name" value="hongkildong"/>
</jsp:include>
<br>
includeTest 1 : <%=request.getAttribute("id") %>
</body>
</html>