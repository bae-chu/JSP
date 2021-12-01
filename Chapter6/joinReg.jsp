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
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
%>	
	아이디 : <%=id%><br>
	비밀번호 : <%=pass%><br>
	이름 : <%=name%><br>
	전화번호 : <%=tel%><br>
<!-- 
	out.print("아이디 = " + id + "<br>");
	out.print("비밀번호 = " + pass + "<br>");
	out.print("이름 = " + name + "<br>");
	out.print("전화번호 = " + tel + "<br>");
 -->

<a href="#">전송</a>


</body>
</html>