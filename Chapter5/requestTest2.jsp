<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request Test2</title>
<style>
h1{text-align:center;}
table{
	margin:auto;	
	border:1px solid red;
	border-collapse:collapse;
	
	}
td{
	border:1px solid red;
	padding:5px;
}
</style>
</head>
<body>
	<H1>헤더정보 예제</H1>
	<table>
		<tr>
			<td>헤더이름</td>
			<td>헤더값</td>
		</tr>
		<%
		Enumeration e=request.getHeaderNames();
		while(e.hasMoreElements()){
			String headerName=(String)e.nextElement();
			%>
			<tr>
				<td><%=headerName %></td>
				<td><%=request.getHeader(headerName) %></td>
				<%} %>
			</tr>	
	</table>
</body>
</html>