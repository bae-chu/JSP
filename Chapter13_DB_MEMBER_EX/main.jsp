<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	
	if(session.getAttribute("id")!=null){ 
		id=((String)session.getAttribute("id")).trim();
	}else{ //null 이면 로그인 
		out.println("<script>");
		out.println("alert('로그인을 하세요.'');");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지 </title>
</head>
<body>
<h3><%=id %>로 로그인 하셨습니다.</h3>
	<a href="logout.jsp">로그아웃</a> &nbsp; &nbsp;
	<a href="member_mod.jsp">회원 정보 수정</a>&nbsp; &nbsp;
	<%if(id!=null && id.equals("admin")){ //접속 아이디가 admin이 아니면 관리자 모드 접속이 안보임. %> 	
		<a href="member_list.jsp"> 관리자 모드 접속(회원 목록 보기) </a> &nbsp; &nbsp;
	<%}else if (id!=null){ %>
		<a href=member_info.jsp?id=<%=id %>">내 정보 보기</a>
	<%} %>
</body>
</html>