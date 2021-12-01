<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out test</title>
</head>
<body>
<h2>out test</h2>
<table border="1">
	<tr>
		<td>autoflash 여부</td>
		<td><%=out.isAutoFlush() %></td>
	</tr>
	<tr>
		<td>출력 버퍼의 크기</td>
		<td><%=out.getBufferSize() %>바이트</td>
	</tr>
	<tr>
		<td>출력 버퍼의 남은 양</td>
		<td><%=out.getRemaining() %>바이트</td>
	</tr>
	

</table>
</body>
</html>