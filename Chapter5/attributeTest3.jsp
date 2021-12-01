<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute Test</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
<table border="1">
	<tr>
		<td colspan="2">application 영역에 저장된 내용들</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=application.getAttribute("name") %></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=application.getAttribute("id") %></td>
	</tr>
</table>
<br>>
<table border="1">
	<tr>
		<td colspan="2">Session 영역에 저장된 내용들 </td>
	</tr>
<%
	Enumeration e=session.getAttributeNames();
	while(e.hasMoreElements()){
		String attributeName=(String)e.nextElement();
		String attributeValue=(String)session.getAttribute(attributeName);
%>
	<tr>
		<td><%=attributeName %></td>
		<td><%=attributeValue %></td>
	</tr>
<%
}
%>
</table>
<br> 
<%-- <table border="1">
	<tr>
		<td colspan="2">Application 영역에 저장된 내용들</td>
	</tr>
	<% 
	Enumeration<String> ea = application.getAttributeNames();
		while(ea.hasMoreElements()){
			String.attributeName=(String)ea.nextElement();
		
			if(application.getAttribute(attributeName) instanceof String &&
					!attributeName.startWith("org")){
			String attributeValue=
					(String)application.getAttribute(attributeName);
	%>
	<tr>
		<td><%=attributeName %></td>
		<td><%=attributeValue %></td>
	</tr>
	<%
		}
		}
		 %>
	
</table> --%>
</body>
</html>