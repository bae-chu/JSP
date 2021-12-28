<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- utf-8 인코딩 용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- 배열 size(function 용  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<fmt:requestEncoding value="utf-8"/> <!-- 인코딩을 먼저 짜주고, 그다음 변수 만들어 줌. -->
<c:set var="num" value="${param.Values.num}"/> <!-- getParameter = param.Values -->
<c:set var="name" value="${param.Values.name}"/> <!--  그다음엔 반복문 쓰게 배열로 짜야되는데, num.length 사용이 안될거임. -->
<!-- 반복문 돌리기 위해서는 사이즈를 설정해줘야 함미다. function 라이브러리를 이용함미다. 태그라이브러리도 추가해줍니다.   -->
<c:set var="size" value="${fn:length(num) }"/>

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/> <!-- db 연결해주고  -->

<c:catch var="err"> <!--  그다음 에러 설정 -->
	<!--  트랜젝션 사용하기 위해서는 쿼리문부터 짜야겠죠. 우선 트랜젝션 설정해주고   -->
	<sql:transaction dataSource="${con }" isolation="read_committed">
	<!--그다음 반복문 설정. for문 동작 할 수있게 forEach begin부터 end(크기-1 해야 제값나올거고), step(i++) 까지  -->
		<c:forEach begin="0" end="${size-1 }" step="1" varStatus="i">
		<!-- sql:update에 따로 DataSource안적어줘도 됨. sql:update가 트랜젝션 안에 포함되있기때문에. 쿼리문만 적어주고. -->
			<sql:update sql="insert into student values(?, ?)">
				<sql:param>${num[i.index] }</sql:param><!-- [i.index]가 배열 역할을 함.  -->
				<sql:param>${name[i.index] }</sql:param>
			</sql:update>
		</c:forEach>
	</sql:transaction>
</c:catch>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP->JSTL 변환해보기</title>
</head>
<body>

<c:choose>
	<c:when test="${empty err}"><h3>레코드를 등록하였습니다.</h3></c:when>
	<c:otherwise><h3>${err}레코드 등록에 실패하였습니다.</h3></c:otherwise>
</c:choose>

</body>
</html>