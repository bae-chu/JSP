r<%@ page language="java" contentType="text/html; charset=UTF-8"
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
String id = request.getParameter("id").trim();
String passwd = request.getParameter("passwd").trim();
if(id.equals("java") && passwd.equals("java")){
	session.setAttribute("id", id);
	response.sendRedirect("template.jsp");
}else{
	out.print("<script>");
	out.print("alert('아이디와 비밀번호가 일치하지 않습니다.');");
	out.print("history.back();");
	out.print("</script>");
}
%>
</body>
</html>