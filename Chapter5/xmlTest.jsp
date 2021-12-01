<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름
<jsp:element name="input">
	<jsp:attribute name = "type">text</jsp:attribute>
	<jsp:attribute name= "name">id</jsp:attribute>
</jsp:element>
<br>
<jsp:element name="input">
	<jsp:attribute name="type">radio</jsp:attribute>
	<jsp:attribute name="name">gender</jsp:attribute>
	<jsp:attribute name="value">남</jsp:attribute>
	<jsp:attribute name="checked"/>
	<jsp:body>남자</jsp:body>
</jsp:element>

<jsp:element name="input">
<jsp:attribute name="type">radio</jsp:attribute>
<jsp:attribute name="name">gender</jsp:attribute>
<jsp:attribute name="value">여</jsp:attribute>
<jsp:body>여자</jsp:body>
</jsp:element>
<br>
<jsp:element name="input">
<jsp:attribute name="type">submit</jsp:attribute>
<jsp:attribute name="value">전송</jsp:attribute>

</jsp:element>

</body>
</html>