<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body onload = "init()">
<form action = "idCheckProcess.jsp" method="post">
	<input type="text" name="id" id="id">
	<input type="submit" value="중복확인">
</form>

<c:set var="openInit" value="${param.openInit ne null?'true':'false'}"/>
<c:if test="${param.chk_id != null && param.chk_id != '' }">
	<c:set var="chk_id" value="${param.chk_id }" />
	<c:set var="useble" value="${param.useble }"/>
	<hr>
	<c:choose>
		<c:when test="${useble == 'yes' }">
			
			<h3>${chk_id }는 사용 가능한 아이디입니다. 
			<a href="javascript:ok('${chk_id }')">사용하기</a></h3>
		</c:when>
		<c:otherwise>
			<h3>${chk_id }는 사용 불가능한 아이디입니다. 다시 검색하세요.</h3>
		</c:otherwise>
	</c:choose>	 
</c:if>

<script>
function init() { 
	if(${openInit}){
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
</body>
</html>