<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name="";
	String value="";
	String cookie=request.getHeader("Cookie");
	
	if(cookie!=null){
		Cookie cookies[]=request.getCookies();
		
		for(int i=0; i<cookies.length; i++){
/* 			if(cookies[i].getName().equals("name")){
				name=cookies[i].getName();
				value=cookies[i].getValue();
			}
*/
		out.print("<h3>쿠키 이름 = " +cookies[i].getName() + "</h3>");
		out.print("<h3>쿠키 값 = " + cookies[i].getValue()+"</h3>");		
			
		}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
<h2>cookie = <%=cookie %></h2>
<h2>쿠키 이름 = <%=name %></h2>
<h2>쿠키 값 = <%=value %></h2>
--%>
<form action="cookieModify.jsp" name="f" method="post">
<h3>쿠키선택 : <select name="cname">
<% for(int i=0; i<cookies.length; i++) { 
		if(!cookies[i].getName().equals("JSESSIONID")){
%>
			<option value="<%=cookies[i].getName()%>"><%=cookies[i].getName()%></option>
	
<%
		} 
	} 
%>
</select>
변경값 : <input type="text" name="cvalue"/></h3> <br>
<input type="submit" value="쿠키값 수정하기">
<input type="button" value="쿠키값 삭제하기" 
	onclick="this.form.action='cookieDel.jsp';this.form.submit();">
<% 
}
%>
</form>


<form action="cookieAdd.jsp" name="f" method="post">
<br>
<h2>쿠키추가 <br>
쿠키 이름 : <input type="text" name="addname">
쿠키 값 : <input type="text" name="addvalue"></h2>
<input type="button" value="쿠키 추가하기" 
	onclick="checkAddCookie(this.form);">	<!-- 한글입력 오류 처리를 위한 --> 
</h2>
</form>
<script>
function checkAddCookie(f) {	//this.form을 f 변수로 받음 
	var eng = /^[a-zA-Z]*$/; //a~z,A~Z 영문자만 들어오게 하는 구문
//	alert(eng.test(f.addname.value));	//알람 제대로 뜨는지 확인하는 구문. 실제로는 필요 없음. 
	if(!eng.test(f.addname.value)){
		alert("영어만 입력하세요!");
		f.addname.value="";
		f.addname.focus();
		return false;
	}
	f.submit();
}
</script>
</body>
</html>