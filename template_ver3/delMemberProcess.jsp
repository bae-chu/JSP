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
String id = (String)session.getAttribute("id");	//id는 세션에 저장되어있던 값이 넘어오므로 session.getattribute		
String pass = request.getParameter("pass");	//id는 앞페이지에서 입력한 값 받아오므로 request.



if(id != null){ 	// 그 다음에 id가 있는지 없는지 확인해봐야함.
	ArrayList<Member> memberList = 
			(ArrayList)application.getAttribute("memberList");
	
	for(Member m : memberList){	//id랑 pass랑 같은걸 찾아서 삭제해얗ㅁ. 
	// 	if(id.equals(m.getId()) && pass.equals(getPass())){ 이렇게 두개 동시에 작성하면 비번 틀렸을경우에 알람 못띄움. 
		if(id.equals(m.getId())){
			if(pass.equals(m.getPass())){
				memberList.remove(m);	//객체를 지워야하니까 remove(object)
				session.removeAttribute("id"); //다 했으니 세션에 있는 정보도 지움 
				out.print("<script>");	//탈퇴 완료 알람 띄우고, 첫 페이지로 이동
				out.print("alert('회원 탈퇴가 완료되었습니다.');");
				out.print("location.href='template.jsp'");
				out.print("</script>");
				break;	//다 했으면 브레이크 걸고. 브레이크는 항상 수행 다 끝나고 맨 마지막에 걸어야함. 
				
			} else {	
				out.print("<script>");
				out.print("alert('비밀번호가 일치하지 않습니다');");
				out.print("history.back();");
				out.print("</script>");
			}
		}
	}
					
	} else {	//id가 없다그럼 다시 로그인 하라고 띄워야지. 
		out.print("<script>");
		out.print("alert('로그인을 하세요');");
		out.print("location.href='template.jsp?page=login'");
		out.print("</script>");
		}


%>
</body>
</html>