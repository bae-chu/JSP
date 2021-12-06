<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="beantest" class="test.BeanTest2" scope="page"></jsp:useBean>
<jsp:setProperty name="beantest" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>java bean test</title>
</head>
<body>
<h1>자바빈 속성 값 출력</h1>
<b>이름 : </b> <%=beantest.getName() %><br>
<H3><jsp:getProperty name="beantest" property="name"/></H3>
<b>주소 : </b> <%=beantest.getAddr() %><br>
<h3><jsp:getProperty name="beantest" property="addr"/></h3>
<b>이메일 : </b> <%=beantest.getEmail() %><br>
<h3><jsp:getProperty name="beantest" property="email"/></h3>
<b>생년월일 : </b> <%=beantest.getBirthday() %><br>
<h3><jsp:getProperty name="beantest" property="birthday"/></h3>
</body>
</html>