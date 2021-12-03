<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, member.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
</style>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");

ArrayList<Member> memberList = 
	(ArrayList)application.getAttribute("memberList");	//ArrayList 만들고요 

//memberList가 null인지 아닌지부터 확인해야함. 
if(memberList != null){

%>
<table class="list" border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>전번</th>
	</tr>
	
<% 	
	for(int i=0; i<memberList.size(); i++){
		Member m = memberList.get(i);
%>
	<tr>
		<td><%=i+1 %></td>
		<td><%=m.getId() %></td>
		<td><%=m.getName() %></td>
		<td><%=m.getTel() %></td>
	</tr>
<%
}	
%>
</table>
	 
<%	
		
} else {
	out.print("회원 목록이 없습니다.");
	
}

%>
</body>
</html>