<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.removeAttribute("id"); %> <!--속성 하나하나 삭제  --> 
<%//session.invalidate(); %>	<!--세션 자체 초기화  --> 
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content = "text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("로그아웃 되었습니다.");
	location.href="sessionLogin1.jsp"; // 로그인 또는 메인페이지로 자동 이동
</script>
<h3>로그아웃 되었습니다.</h3>
<a href="sessionLogin1.jsp">로그인 페이지로 이동</a>
</body>
</html>