<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<fmt:requestEncoding value="utf-8"/>
<c:choose> 
	<c:when test="${(id == null or id != 'admin')and id != param.id }">
					<%--앞 부분 만족하고 나서 뒤에 만족해야하므로 앞에 반드시 괄호 넣어줌. 안그럼 뒤에꺼 먼저 실행되어버림. --%>
		<script>
			alert('관리자로 로그인하세요');
			location.href='loginForm.jsp';
		</script>
	</c:when>
<c:otherwise> 
		<c:set var="id" value="${param.id }"/>	
		<c:set var="pass" value="${param.pass }"/>
		<c:set var="name" value="${param.name }"/>		
		<c:set var="age" value="${param == null or fn:trim(param.age) == '' ? '0' : param.age }"/>
		<%-- age 값이 없으면 0이 들어가고, 있으면 그 숫자를 쓰고.  --%>
		<c:set var="gender" value="${param.gender }"/>		
		<c:set var="email" value="${param.email }"/>
	
	<c:catch var="err">
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
 <%--	<sql:transaction dataSource="${con }">트랜잭션 넣고싶을 경우. 트랜잭션 할때 데이터 소스값은 한번만 적기.  --%>
	
		<sql:update var="result"  dataSource="${con }">
			update member set PASSWORD=?, NAME=?,  AGE=?, GENDER=?, EMAIL=? where ID=?
			<sql:param>${param.pass }</sql:param>
			<sql:param>${param.name }</sql:param>
			<sql:param>${age }</sql:param>
			<sql:param>${param.gender }</sql:param>
			<sql:param>${param.email }</sql:param>
			<sql:param>${param.id }</sql:param>
		</sql:update>
	</c:catch>
	<c:choose>
		<c:when test="${err == null}">
			<c:choose>
				<c:when test="${result > 0 }">
					<script>
						alert('회원 정보 수정이 완료되었습니다.');											
						location.href='member_info.jsp?id=${param.id}';
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert('정보 수정이 완료되지 않았습니다. 다시 작성하세요');
						history.back();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<script>
				alert('정보 수정에 오류가 발생하였습니다.');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</c:otherwise>
</c:choose>


	