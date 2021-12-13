<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uploadPath = application.getRealPath("/upload");
//	request.getServletContext().getRealPath("/upload");
//	String uploadPath = request.getRealPath("/upload"); -> 책에있는 구문. 이거 옛날거라 이제 안씀. 

	int size=10*1024*1024;
	String name = "";
	String subject = "";

	
	try{
		MultipartRequest multi = 
				new MultipartRequest(request, uploadPath, size, "utf-8", 
										new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();

//기존 fileUpload.jsp랑 비슷하게 작성하면 되는데, 여기서는 파일이 여러개 추가될 수도 있으니까
//아래와 같이 filename1, 2, 정의해서 작성하는게  안됨. 
//아래 input 태그에다가 붙여서 작성할거임. 그래서 아래는 삭제. 
/* 		String file1 = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		origfilename1=multi.getOriginalFileName(file1);
		
		String file2 = (String)files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2); */

		
		//원랜 이 위치에 catch가 있었는데, 아래 인풋태그까지 잡아줘야하니까 catch를 아래로 내림 	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="filecheck" action="multiFileCheck2.jsp" method="post">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="subject" value="<%=subject %>">
		
<% 		while(files.hasMoreElements()) {
			String file = (String)files.nextElement();
%>
		<input type="hidden" name="filename1" value="<%=multi.getFilesystemName(file) %>">
		<input type="hidden" name="origfilename1" value="<%=multi.getOriginalFileName(file) %>">
<% } %>
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>

<%
	} catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>