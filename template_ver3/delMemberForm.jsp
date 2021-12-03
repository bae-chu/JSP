<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H2>회원탈퇴</H2>


<form action="delMemberProcess.jsp" method="post" 
onsubmit="return confirm('탈퇴하시겠습니까?')">
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="회원탈퇴"> 
<input type="button" value="돌아가기" onclick="history.back()"><br>

</form>
</body>
</html>