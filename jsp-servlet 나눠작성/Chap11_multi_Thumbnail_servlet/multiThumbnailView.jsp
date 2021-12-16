<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.FileValue" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


- 썸네일이미지 - <br>
<%	//MultiThumbnailServlet에서 ArrayList 만들었으니까 여기도 만들어줘야함. 
	//MultiThumbnailServlet에서 만든 "thumnailList"를 = 앞에다가 지정해주고 (아까 만든거 먼저 넣고)
	
	ArrayList<String> thumbnailList = (ArrayList) request.getAttribute("thumbnailList");
	//위의 객체에 대해서 for문 돌려줘야 함. 
	//for문 돌려줘야 하는건  아래 a태그  친구들.
	
	for(int i=0; i<thumbnailList.size(); i++){
		String filename= thumbnailList.get(i);
	
%>
<a href = "image/<%=filename%>"><img src="image/sm_<%=filename%>"></a>
<a href = "detailView.jsp?image=<%=URLEncoder.encode(filename, "utf-8") %>">
	<img src = "image/sm_<%=filename %>"></a>
<%
	}	//for문 요까지 돌려줘야지 
%>
</body>
</html>