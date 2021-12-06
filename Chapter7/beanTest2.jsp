<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"></jsp:useBean>
<jsp:setProperty name="beantest" property="name" value="BeanTest!"></jsp:setProperty>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>자바빈 사용에제</b>
<h3><%=beantest.getName() %></h3>"
</body>
</html>