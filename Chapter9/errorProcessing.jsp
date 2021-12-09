<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
발생한 예외 종류 : <%=exception.getClass().getName() %>
<!-- 
사용 브라우저가 IE 일 경우에는 에러페이지 크기가 513 바이트 이상 되어야 인식된다. 
513 바이트 이상을 주석으로 만들어 주자. 
 -->
</body>
</html>