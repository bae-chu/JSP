<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id"); 
if(id != null) { //id가 null이 아닐 경우에 수행하는 폼 쭈우욱 form 액션까지 
		
ArrayList<Member> memberList =
(ArrayList) application.getAttribute("memberList");	
	
	for(Member m : memberList){ //향상된 for 문 사용시 
		if(id.equals(m.getId())){
			
		
//	for(int i=0; i<memberList.size(); i++){			//왼쪽 3줄은 일반 for문 사용시. 
//		if(id.equals(memberList.get(i).getId())){	
//			Member m = memberList.get(i);			//memberList.get(i)일일히 적기 힘드니 변수 m 만듦
%>

<h2>나의 정보 수정하기</h2>
<form action="modifyProcess.jsp" method="post" 
	onsubmit="return confirm('수정하시겠습니까?')">
	아이디 : <input type="text" name="id" value="<%=m.getId() %>" readonly/><br> <!-- 수정못하게 readonly -->
	비밀번호 : <input type="password" name="pass" value="<%=m.getPass() %>"/><br>
	이름 : <input type="text" name="name" value="<%=m.getName() %>"/><br>
	전화번호 : <input type="text" name="tel" value="<%=m.getTel() %>"/><br>
	<input type="submit" value="수정하기"/>
	<input type="button" value="돌아가기" onclick="history.back()"/>
</form>

<%	break;
		
} else { //세션 만료되서 로그인 정보 날아가서 null 이면?  
	out.print("<script>");
	out.print("alert('로그인을 하세요');");
	out.print("location.href='tempplate.jsp?page=login'");
	out.print("</script>");
	}
}
}
	
%>
</body>
</html>