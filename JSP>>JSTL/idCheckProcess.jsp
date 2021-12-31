<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<fmt:requestEncoding value="UTF-8"/>

<c:set var="chk_id" value="${param.id }"/>
<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
	select * from member where id=?
	<sql:param>${chk_id }</sql:param>
</sql:query>
<c:choose>
	<c:when test="${rs.rows[0] != null }">
		<c:redirect url="idCheck.jsp?chk_id=${chk_id }&useble=no"/>
	</c:when>
	<c:otherwise>
		<c:redirect url="idCheck.jsp?chk_id=${chk_id }&useble=yes"/>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>