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


	request.setCharacterEncoding("utf-8");	 		//1. 인코딩 먼저 하고 
	String id = request.getParameter("id");			//2. 파라미터 값 다 들어옴. 
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
//id가 null인지 확인 할 필요없이, 바로 저장하면됨. ArrayList 작성.

ArrayList<Member> memberList = (ArrayList)application.getAttribute("memberList");

boolean modifyOk = false;	// 수정이 안될경우를 위한 불리언. 

for(Member m : memberList){	//향상된 for문 이용. id 값이 같은걸 찾아서 고쳐야함. 
	if(id.equals(m.getId())){ //id 동일값 찾은 뒤에 수정해야지.. 
		m.setPass(pass);	//새로 셋팅해줄거니까 set 사용해서 입력. 
		m.setName(name);
		m.setTel(tel);
		modifyOk = true;
		break;
	}
}
if(modifyOk){ //ㅇㅋ뜨면 수정되었단 창 띄우고 넘어감. 
	out.print("<script>");
	out.print("alert('수정되었습니다.');");
	out.print("location.href='template.jsp?page=myPage'");
	out.print("</script>");
	
}else{	//잘 안되면 알람 창 띄움  
	out.print("<script>");
	out.print("alert('오류가 발생했습니다. 다시 진행하세요.');");
	out.print("location.href='template.jsp?page=myPage'");
	out.print("</script>");
}
%>	
</body>
</html>