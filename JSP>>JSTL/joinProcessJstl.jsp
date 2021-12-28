<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<fmt:requestEncoding value="utf-8"/><!--인코딩 먼저 설정해주고 -->
<c:set var="id" value="${param.id }"/><!-- request.getParameter 값들 설정 -->
<c:set var="pass" value="${param.pass }"/>
<c:set var="name" value="${param.name }"/>
<%--
<c:set var="age" value="${param.age }"/> 요렇게만 하면 나이에 빈칸 넣어버리면 오류남. 
아래와 같이 빈칸이나 null값에 대한 조건식 삽입. 
 --%>
<c:set var="age" value="${param.age eq null or fn:trim(param.age) eq '' ? '0' : param.age }"/>
<c:set var="gender" value="${param.gender }"/>
<c:set var="email" value="${param.email }"/>

<c:catch var="err">
<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>

	<sql:update dataSource="${con }" var="result">
		insert into member values(?,?,?,?,?,?)
		<sql:param value="${id }"/>
		<sql:param value="${pass }"/>
		<sql:param value="${name }"/>
		<sql:param value="${age }"/>
		<sql:param value="${gender }"/>
		<sql:param value="${email }"/>
	
	<%-- <sql:param>${id }</sql:param> 이케 넣어도 됨 --%>

</sql:update>
</c:catch>


<%--  요기는 내가 작성한 부분. 알람띄우고 페이지백은 안됨. 
<c:choose>
	<c:when test="${empty err}"><h3>회원 가입이 완료되었습니다.</h3></c:when>
	<c:otherwise><h3>${err}<br>회원 가입이 완료되지 않았습니다. 다시 작성하세요.</h3></c:otherwise>
</c:choose>
 --%>
<c:choose>
 	<c:when test="${err ne null }">
 		<script>
 			alert(${err}"회원가입에 오류가 발생하였습니다. 다시 작성하세요.");
 			location.href="joinForm.jsp";
 		</script>
 	</c:when>
<c:otherwise>
	<c:choose>
		<c:when test="${result > 0 }">
			<script>
				alert("회원 가입이 완료되었습니다.");
				location.href="loginForm.jsp";
			</script>
		</c:when>
	<c:otherwise>
		<script>
			alert("회원 가입이 완료되지 않았습니다. 다시 작성하세요.");
			history.back();
		</script>
	</c:otherwise>
 	</c:choose>
</c:otherwise>
</c:choose>


</body>
</html>