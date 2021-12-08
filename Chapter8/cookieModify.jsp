<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("cname");
String value=request.getParameter("cvalue");
/*
//아래 방식은 기존의 쿠키값에 덮어 씌워짐. 
Cookie cookie;

if(name!=null && value != null){ //이름이나 값이 null이 아닌지 확인하고
	cookie=new Cookie(name, value);
		response.addCookie(cookie);
		response.sendRedirect("cookieTest2.jsp");
	}else{
		out.print("<script>");
		out.print("alert('쿠키 값이 없습니다.')");
		out.print("history.back();");
		out.print("</script>");
	}

*/
//아래와 같이 짤 수도 있음.
	String cookieCheck = request.getHeader("Cookie");
	if(cookieCheck != null) {
		Cookie cookies[] = request.getCookies();
		for(int i = 0; i<cookies.length; i++){
			if(cookies[i].getName().equals(name)){
				cookies[i].setValue(value);
				response.addCookie(cookies[i]);
			}
		}
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	location.href="cookieTest2.jsp";
</script>
</body>
</html>