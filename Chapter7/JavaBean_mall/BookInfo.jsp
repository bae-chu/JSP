<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="pinfo" class="mall.Book" scope="request"/>
<jsp:setProperty name="pinfo" property="*"/>

<h3>책 정보가 저장되었습니다.</h3>
<hr>
<jsp:include page="ProductInfo.jsp"/>
<!-- 
코드명 : <jsp:getProperty property="code" name="pinfo"/><br>
제품명 : <jsp:getProperty property="name" name="pinfo"/><br>
가격 : <jsp:getProperty property="price" name="pinfo"/><br>
 -->
페이지 수 : <jsp:getProperty property="page" name="pinfo"/><br>
저자 : <jsp:getProperty property="writer" name="pinfo"/><br><br>
<input type="button" value="돌아가기" onclick="history.back()">
</body>
</html>
