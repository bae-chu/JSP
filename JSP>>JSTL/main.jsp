<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

	<fmt:requestEncoding value="utf-8"/>
<%--	
	<c:set var="id"/>
	
 이 주석은 기존 main.jsp 그대로 옮겨서 jstl로 번역한거. 
	<c:choose>
		<c:when test="${sessionScope.id ne null }">
			<c:set var="id" value="${fn:trim(sessionScope.id) }"/>
		</c:when>
		<c:otherwise>
			<script>
				alert('로그인 하세요');
				location.href='loginForm.jsp';
			</script>
		</c:otherwise>
	</c:choose>
아래와 같이 사용도 가능함. 
--%>
<c:if test="${id==null }">
	<script>
		alert('로그인 하세요');
		location.href='loginForm.jsp';
	</script>
</c:if>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지 </title>
</head>
<body>

<h3>${id }로 로그인 하셨습니다.</h3>
	<a href="logout.jsp">로그아웃</a> &nbsp; &nbsp;
	<a href="member_mod.jsp">회원 정보 수정</a>&nbsp; &nbsp;
	
<c:choose>
	<c:when test="${id == 'admin'}">
		<a href="member_list.jsp">관리자 모드 접속(회원 목록 보기)</a>
	</c:when>
	<c:otherwise>
		<a href="member_info.jsp?id=${id }">내 정보 보기</a>
	</c:otherwise>
</c:choose>
