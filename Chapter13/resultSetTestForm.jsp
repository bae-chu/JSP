<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "resultSetTest1.jsp" method="post">
<select name="col">
	<option value="num">번호</option>
	<option value="name">이름</option>
</select>
<input type="text" name="svalue"/>
<input type="submit" value="검색"/>
</form>
</body>
</html>