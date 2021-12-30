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
<title>회원 정보 수정 페이지</title>
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

<fmt:requestEncoding value="utf-8"/>

<c:choose>
	<c:when test="${sessionScope.id==null or sessionScope.id ne 'admin' }">
			<script>
				alert('관리자로 로그인하세요');
				location.href='loginForm.jsp';
			</script>
	</c:when>
<c:otherwise>
<c:set var="mod_id" value="${param.id }"/>

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
	select * from member where id=?
	<sql:param>${mod_id }</sql:param>
</sql:query>

<c:choose>
	<c:when test="${rs.rows[0] ne null }" >
	<c:set var="row" value="${rs.rows[0] }"/>

<form action = "modifyProcess.jsp" name="modform" method="post">
<table border=1>
	<tr>
		<td colspan="2" class="td_title"> 회원 정보 수정 페이지 </td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td>${row.id}
		<input type="hidden" name="id" id="id">
		</td>
	</tr>
	<tr>
		<td>패스워드 : </td>
		<td><input type="password" name="pass" id="pass" value="${row.password}"></td>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" id="name" value="${row.name}"></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type="text" name="age" id="age" value="${row.age}"></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>
			<input type="radio" name="gender" value="남" id="gender1"
						${row.gender == '남'?checked : '' }>남자 
						
			<input type="radio" name="gender" value="여" id="gender2"
						${row.gender == '여'?checked : '' }>여자
						<%--gender 가 여 이면(?) 체크, 아니면(:) 빈칸. --%>
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td><input type="text" name="email" id="eamil" value="${row.email}"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송">
			<a href="javascript:modform.submit();">수정하기</a> &nbsp;&nbsp;
			<a href="javascript:modform.reset();">다시작성</a>
		</td>
	</tr>	
</table>	
</form>
</c:when>
	<c:otherwise>
		<script>
			alert('선택한 회원정보가 없습니다.');
			history.back();
		</script>
	</c:otherwise>
	</c:choose>
</c:otherwise>
</c:choose>
</body>
</html>