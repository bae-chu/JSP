<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String[] filename1 = request.getParameterValues("filename1");
	String[] origfilename1 = request.getParameterValues("origfilename1");
	//파일을 getParameter 말고 getParameterValues 로 받아주고, String은 배열처리[]해줘야 함.  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인 및 다운로드 </title>
</head>
<body>

올린 사람 : <%=name %><br>
제목 : <%=subject %><br>
<%for(int i=0; i<filename1.length; i++){%>
<!--숫자 순서대로 파일이름 배열 출력해줘야하니까 for문 사용하고, 밑에 filename1은 배열출력이니까 [i] 넣어줘야 함.-->

파일명 : <a href="file_down.jsp?file_name=<%=filename1[i] %>"><%=origfilename1[i] %></a><br>

<%
}
%>

</body>
</html>
