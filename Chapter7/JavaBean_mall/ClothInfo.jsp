<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pinfo" class="mall.Cloth"/>
<jsp:setProperty property="*" name="pinfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>옷 정보가 저장되었습니다. </h3>
<hr>
<jsp:include page="ProductInfo.jsp"/>
<!--  
코드명 : <jsp:getProperty property="code" name="pinfo"/><br>
제품명 : <jsp:getProperty property="name" name="pinfo"/><br>
가격 : <jsp:getProperty property="price" name="pinfo"/><br>
-->
사이즈 : <jsp:getProperty property="size" name="pinfo"/><br>
색상 : <jsp:getProperty property="color" name="pinfo"/><br><br>
<input type="button" value="돌아가기" onclick="history.back()">
</body>
</html>