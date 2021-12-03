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
<h2>나의 정보</h2>
<% 
request.setCharacterEncoding("utf-8");	//인코딩 기본으로 해주고 
String id = (String)session.getAttribute("id"); //세션에 있는 id를 가지고 오고  

if(id != null){ //세션 만료전이라 id가 널이 아니라면? 아래 꺼 수행. 
		
	ArrayList<Member> memberList =
		 (ArrayList) application.getAttribute("memberList");	// arrayList 만들어주고 
		 //여기는 로그인 한 상태에서 보는 페이지이므로, null 처리를 해주지 않아도 무방함(생략)
	
	for(int i=0; i<memberList.size(); i++){	//향상된 for문 아니고 일반 for문 
		//여기서 id가 같은걸 찾아야하니까 if 사용 ▼
		if(id.equals(memberList.get(i).getId())){
			Member m = memberList.get(i);
			// 아래에다가  아이디 : <%= memberList.get(i).getId()이거 그대로 써도 되는데, 
			//일일히 다 쓰기엔 좀 기니까  Member m 으로 변수 설정해줌. 
%>
		아이디 : <%=m.getId() %><br> 
		비밀번호 : <%=m.getPass() %><br>
		이름 : <%=m.getName() %><br>
		전화번호 : <%=m.getTel() %><br><br>
		
		<a href="template.jsp?page=modifyMyInfoForm">정보수정</a>
		<a href="template.jsp?page=delMemberForm">회원탈퇴</a>
<% 
		}
	}
} else { //세션 만료되서 로그인 정보 날아가서 null 이면?  
	out.print("<script>");
	out.print("alert('로그인을 하세요');");
	out.print("location.href='tempplate.jsp?page=login'");
	out.print("</script>");
}
/* 
세션은 일정시간이 지나면 꺼짐.(로그인 세션) 
캐서 일정시간후에 다시 들어갔을때  String id = (String)session.getAttribute("id"); 자체가 null이 될 수도 있음. 
그게 오류가나면 if(id.equals(memberList.get(i).getId())){ 이 줄에서 오류가 남. 
if 안의 id값이 null이기 때문에. 
그래서 for문 실행시키기 전에  null 포인트값을 처리하는 내용을 넣어야 함. 
*/
%>
 
</body>
</html>
