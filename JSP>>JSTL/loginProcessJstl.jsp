<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>
<c:set var="login_id" value="${param.id }" />
<c:set var="pass" value="${param.pass }" />

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
	<sql:query var="rs" dataSource="${con }"> <%--쿼리문 작성이므로 sql:query 사용  --%>
		select * from member where id=? 
		<sql:param>${login_id}</sql:param>
	</sql:query> <%-- rs를 갖고오기위해 for:Each 사용 --%>
	
<c:forEach var="row" items="${rs.rows }"> <%--열row을 rs.rows로 --%>
	<c:if test="${row.password eq pass }"> 
	<%-- if(pass.equals(rs.getString("password")) 이부분 --%>
		<c:set var="id" value="${login_id }" scope="session"/>
		<%-- session 속성으로 넣어야 하기 때문에 scope 붙여줘야 함. scope="session"으로 설정 --%>
		<c:redirect url="main.jsp"/><%--문제없다면 로그인 됨.  --%>
	</c:if>
</c:forEach>	
<script>
	alert("아이디나 비밀번호가 일치하지 않습니다.");
	location.href="loginForm.jsp";
</script>
