<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content = "text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#loginArea{
		width:400px;
		margin:auto;
		border:1px solid black;
	}
	table{
		margin:auto;
	}
	td{
		text-align:center;
	}
</style>
</head>
<body>
<section id="loginArea">
	<form action = "sessionLogin2.jsp" method="post">
		<table>
			<tr>
				<td><label for="id">아이디 :  </label></td>
				<td><input type="text" name="id" id="id" required="required"></td>
			</tr>
			<tr>
				<td><label for="pass">패스워드 :  </label></td>
				<td><input type="password" name="pass" id="pass" required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인">
				<input type="reset" value="다시 작성">
				<input type="button" value="회원가입" onclick="location.href='join.jsp'">
				</td>
			</tr>
			
				
		</table>
	</form>
</section>
</body>
</html>