<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>java bean Test</title>
</head>
<body>
<b>자바빈 사용 예제</b>
<h3><%=beantest.getName() %></h3>
<%beantest.setName("홍길동");%>
<h3><%=beantest.getName() %></h3>
${beantest.name='고길동' }
</body>
</html>