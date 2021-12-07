<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name;
	if(session.getAttribute("name")!=null){
		name=(String)session.getAttribute("name");
	}else{
			name="세션 값 없음.";
	}
	session.setMaxInactiveInterval(10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session test</title>
</head>
<body>
<h2>session test</h2>
<input type="button" onclick="location.href='sessionSet.jsp'" value="세션 값 저장">
<input type="button" onclick="location.href='sessionDel.jsp'" value="세션 값 삭제">
<input type="button" onclick="location.href='sessionInvalidate.jsp'" value="세션 초기화">
<h3><%=name %></h3>
<%=session.getId() %> <br>
세션 유지시간 : <%=session.getMaxInactiveInterval() %>초
</body>
</html>