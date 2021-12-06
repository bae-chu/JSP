<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- RequestScopeBean 자바빈 객체의 getHeader()메서드를 이용하여 
 	자바빈 객채 내부에 저장되어있는 <form> 태그에 입력한 header 값 전달 받음 --%>
<jsp:useBean id="req" class="scope.RequestScopeBean" scope="request"/>
<jsp:getProperty property="header" name="req"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>