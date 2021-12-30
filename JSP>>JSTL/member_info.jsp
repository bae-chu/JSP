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
<title>회원 관리 시스템 관리자 모드(회원 정보 보기)</title>
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
</style>
</head>
<body>
<%-- 
getAttribute가 하나밖에 없으면(id 값이 그거 뿐이면) sessionScope.id 라고 안적고 생략해서 id만 적어도 무방함.
근데 만약에 getParameter 값이나 다른 request 값이 있으면 무조건 구분해서 적어줘야 함. param.id 이케나 sessionScope.id 이케  
--%>
<c:if test="${sessionScope.id == null or sessionScope.id != 'admin' }">
	<c:if test="${sessionScope.id != param.id }">
		<script>
			alert('관리자로 로그인 하세요');
			location.href='loginForm.jsp';
		</script>
	</c:if>
</c:if>

<c:set var="info_id" value="${param.id }"/>
<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
	select * from member where id=?
	<sql:param>${info_id}</sql:param>
</sql:query>

<c:choose>
<c:when test="${rs.rows[0] ne null}">
<c:set var="row" value="${rs.rows[0]}"/>
<table>
	<tr>
		<td>아이디 : </td>
		<td>${rs.rows[0].id }</td> <%--c:set 설정 안하면 이렇게 적어도 됨. --%>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>${row.password}</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>${row.name }</td>
	</tr>	
	<tr>
		<td>나이 : </td>
		<td>${row.age }</td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>${row.gender }</td>
	</tr>
	<tr>
		<td>이메일주소 : </td>
		<td>${row.email }</td>
	</tr>

	<tr>
		<td colspan="2">
		<c:choose>
			<c:when test="${sessionScope.id == 'admin' }">		
				<a href="member_list.jsp">리스트로 돌아가기</a> &nbsp;&nbsp;&nbsp;
			</c:when>
			<c:otherwise>			
				<a href="main.jsp">메인으로 돌아가기</a>		
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
</table>
</c:when>
<c:otherwise>
	<script>
	alert('선택한 회원정보가 없습니다.');
	history.back();
	</script>
</c:otherwise>
</c:choose>

</body>
</html>