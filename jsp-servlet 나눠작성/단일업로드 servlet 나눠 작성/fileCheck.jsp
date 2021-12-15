<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String origfilename1 = request.getParameter("origfilename1");
	String origfilename2 = request.getParameter("origfilename2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인 및 다운로드 </title>
</head>
<body>
<!-- 책에 있는 대로 코딩하면 파일 업로드 안해서 null 값일때 다운로드 클릭하면 에러 500뜸. 
그래서 파일이 있는지 없는지 if 로 돌려줘야함.  -->
올린 사람 : <%=name %><br>
제목 : <%=subject %><br>
<% if(!filename1.equals("null")){ %>
파일명 1 : <a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a><br>
<%} %>
<% if(!filename2.equals("null")){ %>
파일명 2 : <a href="file_down.jsp?file_name=<%=filename2 %>"><%=origfilename2 %></a><br>
<%} %>
</body>
</html>
