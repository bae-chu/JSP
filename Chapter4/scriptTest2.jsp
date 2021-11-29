<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Calendar" %>
<%
Calendar c = Calendar.getInstance();
int hour = c.get(Calendar.HOUR_OF_DAY);
int minute = c.get(Calendar.MINUTE);
int second = c.get(Calendar.SECOND);
%>
<html>
<head>
<meta charset="UTF-8">
<title>script test 2</title>
</head>
<body>
<h1>현재시간은<%=hour %>시 <%=minute %>분 <%=second %>초 </h1>
<% if(hour>=12) { %>
	<h2>오후입니니다.</h2>
	<% } else { %>
		<H2>오전입니다.</H2>
	<%} %>
	
<%-- 위와 같이 코드 작성 할 경우 괄호닫기 헷갈릴 수 있으므로 아래와같이 적는 것이 편할수 도 있다. --%>
	
<%
	if(hour>=12) { 
		out.print("<h2>오후입니다.</h2>");
	} else {
		out.print("<h2>오전입니다 </h2>");
	}
%>
</body>
</html>