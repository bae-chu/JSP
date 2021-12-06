<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>자바빈 session scope 테스트</title>
</head>
<jsp:useBean id="testsession" class="scope.Counter" scope="session"/>
<body>
현재 방문자 수 : 
<jsp:getProperty property="cnt" name="testsession"/>
<input type="button" value="초기화" onclick="location.href='cntReset.jsp?page=sessionScope';">
</body>
</html>