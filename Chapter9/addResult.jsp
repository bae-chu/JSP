<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dataError.jsp"%> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 출력 <br>
<%
	//getParameter는 항상 String으로 받기 때문에, 숫자 받으려면 형변환 해줘야 함. 
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int result = num1 + num2;
	
/*
	이렇게 적어도 되는데, 한번에 적으려면 위와 같이 적으면 됨. 
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	int num3 = Integer.parseInt(num1);
	int num4 = Integer.parseInt(num2);
	int result = num1 + num2;
*/
	out.println(num1 + " + " + num2 + " = " + result);

%>
</body>
</html>