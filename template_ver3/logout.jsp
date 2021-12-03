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
if(session.getAttribute("id") != null){
	session.invalidate();
	//session.removeAttribute("id");

	out.print("<script>");
	out.print("alert('로그아웃 되었습니다.');");
	out.print("location.href='template.jsp';");
	out.print("</script>");
}else{
	out.print("<script>");
	out.print("alert('로그인을 하세요');");
	out.print("location.href='template.jsp?page=login';");
	out.print("</script>");
}
%>
</body>
</html>