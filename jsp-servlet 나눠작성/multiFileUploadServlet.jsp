<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>   
<%@ page import ="vo.FileValue"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 여기는 ArrayList 를 사용했기 때문에 while 말고 for문을 사용하는 것이 좋음 -->
<%ArrayList<FileValue> fileList = (ArrayList) request.getAttribute("fileList");  %>
	
	<form name="filecheck" action="multiFileCheck2.jsp" method="post"> 
		<input type="hidden" name="name" value="<%=request.getAttribute("name")%>">
		<input type="hidden" name="subject" value="<%=request.getAttribute("subject")%>">

<!-- 만약 아랫줄에서 java.lang.NullPointerException 떴을때, 
null 값이 뜰 수 있는건 fileList 임. 앞에 얘가 값을 받아오는거니까. 
그럼 아래 콘솔창에 오류난거 보고, 
만약에 아래와 같은 오류가 떴다면? java:137 <- 이걸 찾아야 되니까 
at org.apache.jsp.multiFileUploadServlet_jsp._jspService(multiFileUploadServlet_jsp.java:137)
보통 이 경로에 있는 해당 파일(multiFileUploadServlet_jsp.java)을 열어서, 열어서 확인해봄 
C:\jsp\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Chapter10\org\apache\jsp
확인해보면 
	for(FileValue fv : fileList) {  얘가 말썽이라고 적혀있는데, 
위에서 말했듯이 보통 오류가나면 받는값이니까 fileList가문제겠지? 
그럼 다른 jsp나 servlet 파일들을 하나하나 추적해나가면서 봐야함. 
오탈자가 없는지. 
  -->
<%	for(FileValue fv : fileList) { %>
		<input type="hidden" name="filename1" value="<%=fv.getFilename()%>">
		<input type="hidden" name="origfilename1" value="<%=fv.getOrigfilename()%>">
<% } %>
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>
</body>
</html>

</body>
</html>
