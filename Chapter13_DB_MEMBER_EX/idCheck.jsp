<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String openInit = "false";
	if(request.getParameter("openInit")!=null){
		openInit="true";
	}
%>
<script>
function init() {
	if(<%=openInit%>){
		document.getElementById("id").value=opener.document.getElementById("id").value;
	}
}

function ok(v) { <%--오류 찾을 때 alert('!'); 넣어서 뒤져보면 찾기 쉬움. --%>
	opener.idcheck=v.trim(); 	
	opener.document.getElementById("id").value=v; 
	opener.chkId=true;
	window.close();
	
	
}

function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    opener.document.userInfo.idDuplication.value ="id";
    // 회원가입 화면의 ID입력란에 값을 전달
    opener.document.userInfo.id.value = document.getElementById("id").value;
    
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
}   

</script>
<body onload = "init()">
<form action = "idCheckProcess.jsp" method="post" name=f>
	<input type="text" name="id" id="id">
	<input type="submit" value="중복확인">
</form>
<%
	if(request.getParameter("chk_id")!=null){
		String chk_id = request.getParameter("chk_id");
		String useble = request.getParameter("useble");
		out.print("<hr>");
		if(useble.equals("yes")){
			out.print("<h3>" + chk_id + " 는 사용 가능한 아이디 입니다.");
			out.print(" <a href='#' onclick=\"ok('"+chk_id+"')\">사용하기</a></h3>");
		}else{
			out.println("<h3>"+chk_id+" 는 사용 불가능한 아이디 입니다. 다시 검색하세요. </h3>");
		}
	}
%>

</body>
</html>