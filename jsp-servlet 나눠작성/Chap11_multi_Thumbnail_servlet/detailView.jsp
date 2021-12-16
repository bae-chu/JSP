<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	//가장 기본적으로 받아오는 구문
	//String filename = request.getParameter("image");

	//아래는 null 값 방지 추가했을 때 
	String filename = "";
	if(request.getParameter("image") != null &&	//image는 null 값이 아니어야 하고 
			!request.getParameter("image").trim().equals("")) {	//image가 빈문자가 아니면
		filename = request.getParameter("image");	//설정을 하는 것임 
	}else{
		response.sendRedirect("thumbnailForm.jsp");	//문제가 있으면 첫 페이지로 돌아가고. 
	}
%>
-원본 이미지 - <br>
<img src = "image/<%=filename %>">

</body>
</html>
