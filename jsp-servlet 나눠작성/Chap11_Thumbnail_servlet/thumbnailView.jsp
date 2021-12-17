<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
//	String filename = (String) request.getAttribute("filename"); //dispatcher 방식
	String filename = request.getParameter("filename");	//direct 방식
	//parameter라도 문자객체만 전송 가능하므로, 문자가 아닌경우에는 parameter 사용 불가능. 
%>

-썸네일이미지-<br>
<a href = "image/<%=filename %>"><img src="image/sm_<%=filename %>"></a>
<a href = "detailView.jsp?image=<%=URLEncoder.encode(filename, "utf-8") %>">
	<img src = "image/sm_<%=filename %>"></a>
</body>
</html>