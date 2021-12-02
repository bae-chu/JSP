<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
%>	
	아이디 : <%=id%><br>
	비밀번호 : <%=pass%><br>
	이름 : <%=name%><br>
	전화번호 : <%=tel%><br>
<!-- 
	out.print("아이디 = " + id + "<br>");
	out.print("비밀번호 = " + pass + "<br>");
	out.print("이름 = " + name + "<br>");
	out.print("전화번호 = " + tel + "<br>");
 -->
 
<a href="javascript:saveData()">전송</a> 
<!--a태그 사용 시  jsp 연결할때는 javascript 사용. 
아래 script부터는 이거 저장할거임? 하고 컨펌창 띄우는 용도. 
컨펌창 값 yes=true, no=false값 나옴. 
아래 function saveData()를 작성해놨기때문에, 
컨펌 값이 yes로 들어오면 saveData 메소드 실행됨. 
그래서 a href=javascript:saveData() 로 작성.  -->
<script>
function saveData(){
	if(confirm("데이터를 저장하시겠습니까?")){
		document.f.submit();
	}
}
</script>

<form name="f" action="joinRegSave.jsp" method="post"> 
<!--이건 저장하는거라 새로 페이지 열리는거 아니라서 템플릿 페이지 주소 안넣어도 됨.    --> 
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="pass" value="<%=pass %>">
<input type="hidden" name="name" value="<%=name %>">
<input type="hidden" name="tel" value="<%=tel %>">


</form>
</body>
</html>