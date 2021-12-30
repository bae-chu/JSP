<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자 모드(회원 목록 보기)</title>
<style>
	table{
		margin:auto;
		width:500px;
		border:1px solid #ccc;
		text-align: left;
		border-collapse:collapse;
	}
	
	td{
		font-weight : bold;
		padding:10px;
		padding-left:10px;
	}	
	
	.td_title{
		text-align : center;
		font-weight: bold;
		font-size: xx-large;
	}
</style>
</head>
<body>
 
<%--else if 가 있으면 c:choose를 써야하지만, 그냥 if만 있으면 c:if 사용  --%>    
<%-- <c:if test="${id ne admin }"> 내가 우너래 작성했던 것 --%>
<c:choose>
	<c:when test="${sessionScope.id == null or sessionScope.id != 'admin' }">
		<script>
			alert('관리자로 로그인 하세요');
			location.href='loginForm.jsp';
		</script>
	</c:when>   
<c:otherwise>
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
	<sql:query var="rs" dataSource="${con }">
	select * from member
	</sql:query>
</c:otherwise>  
</c:choose>

<table>
	<tr>
		<td colspan="2" class="td_title">회원목록</td>
	</tr>
	<c:forEach var="row" items="${rs.rows }">
	<%--var 이름을 row라 붙여줍니다.
		item의 rs는 데이터 소스에서 갖고오는 rs 이고,  
		item의 rs.rows는 우리가 여러 행 값을 갖다 쓰는거라서 rows를 붙여줍니다.forEach의 row랑은 상관없음.  
		그냥 여러 행값을 쓸때에는 rows를 붙여줌. 
		items는 꼭 필요한건 아니지만, 우리는 객체를 사용해야하기 때문에 변수 만들어줘야 함.  --%>
	<tr>
		<td>
			<a href="member_info.jsp?id=${row.id }">${row.id }</a>
		</td>
		<td>
			<a href="member_mod.jsp?id=${row.id }">수정</a> &nbsp;&nbsp;
			<a href="javascript:deleteChk('${row.id }')">삭제</a>
		</td>
	</tr>

	</c:forEach>
</table>
<%-- 스크립트는 그대로 써도 됨. --%>
<script> 
function deleteChk(id) {
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="member_delete.jsp?id="+id;
	}
	
}
</script>
</body>
</html>