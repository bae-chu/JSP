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
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("addname");
	String value=request.getParameter("addvalue");
	
	if(value!=null & name!=null && !name.trim().equals("")){
//	if(name!=null && value!=null && name!="" && value!=""){
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(600);
		response.addCookie(cookie);
		response.sendRedirect("cookieTest2.jsp");
	}else{
%>
		<script>
			alert('쿠키이름이 없습니다.');
			history.back();
		</script>
<%
}
%>
</body>
</html>