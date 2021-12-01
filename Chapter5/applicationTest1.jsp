<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application test</title>
</head>
<body>
<h2>application test</h2>
<table border = "1">
	<tr>
		<td>jsp version</td>
		<td><%=application.getMajorVersion() %>.<%=application.getMinorVersion() %></td>
	</tr>
	<tr>
		<td>container info</td>
		<td><%=application.getServerInfo() %></td>
	</tr>
	<tr>
		<td>web application file system real path</td>
		<td><%=application.getRealPath("/") %></td>
	</tr>
	<tr>
		<td>getResource("/")</td>
		<td><%=application.getResource("/") %></td>
	</tr>
</table>
</body>
</html>