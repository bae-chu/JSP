<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page"/>
<jsp:useBean id="appscope" class="scope.AppScope" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>java bean test</title>
</head>
<body>
<b>자바빈 사용 예제 - 애플리케이션 scope 에서 카운터 하기</b>
<h3><%=beantest.getName() %></h3>
<jsp:setProperty property="name" name="beantest" value="test"/>
<h3><%=beantest.getName() %></h3>
<jsp:setProperty property="cnt" name="appscope" value="1"/>
방문자 수 : <jsp:getProperty property="cnt" name="appscope"/>
<input type="button" value="초기화" onclick="location.href='resetAppScope.jsp'">
</body>
</html>
