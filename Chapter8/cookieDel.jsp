<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String name=request.getParameter("cname");

	if(name != null){ //if가 null이 아니면 
		Cookie cookie = new Cookie(name, "");	//쿠키 객체를 생성시키고 
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		response.sendRedirect("cookieTest2.jsp");
	}else {
%>
	<script>
		alert('쿠키가 선택되지 않았습니다.');
		history.back();
	</script>
<%
}

%>	


</body>
</html>