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
String id = request.getParameter("id").trim();
String passwd = request.getParameter("passwd").trim();

ArrayList<Member> memberList = 
	(ArrayList)application.getAttribute("memberList"); 
//ArrayList 만들고, joinReg랑 동일하게 작성. application앞에는 형변환 (ArrayList)해줌.

//서버 초기화(껐다 킨) 상태에서 로그인 시도를 해보면, 데이터가 다 날아가서 없기때문에 null pointer exception이 뜸. 
//그래서 null일때 어떻게 할지를 처리해줘야함. 

if(memberList != null){

	boolean loginOk = false;
	for(Member m : memberList){ //for문 추가 
		if(id.equals(m.getId()) && passwd.equals(m.getPass())){ 
			//id-pass에 ArrayList에서 저장한 값을 가져와야하니 array랑 member class를  import 함. 
			
			session.setAttribute("id", id);
			loginOk = true;
			break;
		}
	}
		if(loginOk){
			response.sendRedirect("template.jsp") ;
		}else{
			out.print("<script>");
			out.print("alert('아이디와 비밀번호가 일치하지 않습니다.');");
			out.print("history.back();");
			out.print("</script>");
			}
//요기까지가 memberList != null 일 때. 

}else{
	out.print("<script>");
	out.print("alert('회원 목록이 없습니다. 회원가입을 하세요.');");
	out.print("location.href='template.jsp?page=join'");
	out.print("</script>");
}
%>
</body>
</html>