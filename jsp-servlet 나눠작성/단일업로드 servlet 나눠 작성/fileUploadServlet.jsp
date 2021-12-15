<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.UploadInfoValue" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadServlet</title>
</head>
<body>
<%UploadInfoValue uiv = (UploadInfoValue)request.getAttribute("uiv"); %>
<form name="filecheck" action="fileCheck.jsp" method="post">

<%--	<input type="hidden" name="name" value="<%=request.getAttribute(name)%>">
		UploadInfoValue.java 설정함으로써 아래와같이 uiv.getName() 변경 
  --%>	
		<input type="hidden" name="name" value="<%=uiv.getName()%>"> 
		<input type="hidden" name="subject" value="<%=uiv.getSubject()%>">
		<input type="hidden" name="filename1" value="<%=uiv.getFilename1() %>">
		<input type="hidden" name="filename2" value="<%=uiv.getFilename2() %>">
		<input type="hidden" name="origfilename1" value="${uiv.origfilename1}">	
		<input type="hidden" name="origfilename2" value="${uiv.origfilename2}">
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>
</body>
</html>