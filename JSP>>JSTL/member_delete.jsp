<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
c:if로만 해놓으면, 주소창에서 직접 입력해서 삭제가능함.
관리자로 로그인하라고 에러메세지는 뜨는데, 실제로는 삭제가 되어버림. 
그래서 c:if 말고, choose로 해서 아래구문을 째로 묶어줘야 함.
관리자가 아니면 아예 못하게 하도록.  
 --%>
<c:choose>
	<c:when test="${sessionScope.id == null or sessionScope.id ne 'admin' }">
		<script>
			alert('관리자로 로그인 하세요.');
			location.href='loginForm.jsp';
		</script>
	</c:when>  
<c:otherwise>
	<c:set var="del_id" value="${param.id }" />
	<c:catch var="err">
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
	
		<sql:update var="result" dataSource="${con }">
				delete from member where id=?
			<sql:param>${del_id }</sql:param> <%--parameter 값 있으니 적어줌. --%>
		</sql:update>
	</c:catch>
	<c:choose>
	<c:when test="${err eq null }">
		<c:choose>
			<c:when test="${result > 0 }">
				<script>
					alert('${del_id} 님이 삭제되었습니다.'); <%-- EL 형식은 ''안에 적어도 괜춘 --%>
					location.href='member_list.jsp';
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert('회원 정보가 삭제되지 않았습니다.');
					history.back();
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<script>
			alert('오류가 발생하였습니다.');
			history.back();
		</script>
	</c:otherwise>
		
	</c:choose>

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