<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL sql 라이브러리 사용예제</title>
</head>
<body>
<!--  
<sql:setDataSource var="conn"
						driver="oracle.jdbc.driver.OracleDriver"
						url="jdbc:oracle:thin:@localhost:1521:XE"
						user="java"
						password="java"/> 
						
위와 같이 작성할 수도 있고, 아래와 같이 간단하게 dataSource="jdbc/OracleDB" 이렇게만 적어도 됨. 	
단. 아래와 같이 하려면 META-INF 폴더안에  context.xml 파일이 반드시 잇어야 함. 			
-->
<sql:setDataSource var = "conn" dataSource="jdbc/OracleDB"/>
						
				

<sql:update dataSource="${conn }"
		sql = "insert into test(num, name) values(?,?)">
		<sql:param value="6"/>
		<sql:param value="둘리"/>
</sql:update>

<sql:update dataSource="${conn }">
	insert into test values (7, '도우너')
</sql:update>
<sql:update dataSource="${conn }">
	insert into test values (8, '또치')
</sql:update>

<sql:query var="rs" dataSource="${conn }">
	select * from test where name=?
	<sql:param>홍길동</sql:param>
</sql:query>

<c:forEach var ="data" items="${rs.rows }">
	<c:out value="${data['num'] }"/>
	<c:out value="${data['name'] }"/>
</c:forEach>
</body> 
</html>