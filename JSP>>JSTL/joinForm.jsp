<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>
<style>
	table{
		margin:auto;
		width:500px;
		border:1px solid #ccc;
		text-align: left;
		border-collapse:collapse;
	}
	
	td{
		font-weight : bold;
		padding:10px;
		padding-left:10px;
	}	
	
	.td_title{
		text-align : center;
		font-weight: bold;
		font-size: xx-large;
	}
	input{
		align:left;
	}
</style>
</head>
<body>
<form action="joinProcessJstl.jsp" name="joinform" method="post">
<table border=1>
	<tr>
		<td colspan="2" class="td_title"> 회원 가입 페이지 </td>
	</tr>
	<tr>
		<td><label for="id">아이디 : </label></td>
		<td><input type="text" name="id" id="id">
			<input type="button" name="idcheck" id="idcheck" value="아이디 중복확인" 
				onclick="window.open('idCheck.jsp','idchk','width=430,height=500,location=no,status=no,scrollbars=yes');">
		</td>
	</tr>
	<tr>
		<td><label for="pass">비밀번호 : </label></td>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
		<tr>
		<td><label for="passcheck">비밀번호 확인 : </label></td>
		<td><input type="password" name="passcheck" id="passcheck"></td>
	</tr>
	<tr>
		<td><label for="name">이름 : </label></td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td><label for="age">나이 : </label></td>
		<td><input type="text" name="age" id="age"></td>
	</tr>
	<tr>
		<td><label for="gender1">성별 : </label></td>
		<td>
			<input type="radio" name="gender" value="남" checked id="gender1">남자 
			<input type="radio" name="gender" value="여" id="gender2">여자
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td><input type="text" name="email" id="eamil"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<a href="javascript:chkForm(document.joinform);">회원가입</a> &nbsp;&nbsp;
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
<script>
	function chkForm(f){
		if(f.id.value== ""){
			alert("아이디를 입력하세요");
			f.id.focus(); // 커서 자동 이동 
			return false;
		}
		if(f.pass.value== ""){
			alert("비밀번호를 입력하세요");
			f.pass.focus()
			return false;
		}
		if(f.pass.value != f.passcheck.value){	//pass랑 passCheck이랑 다르면 
			alert("비밀번호가 일치하지 않습니다.");
			f.pass.value = ""; // 칸에 적혀있는거 지워주고
			f.passcheck.value = ""; //비번확인칸도 지워주고 
			f.pass.focus();	//커서를 비번으로 옮김.
			return false;
		}
		if(f.name.value== ""){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.age.value== ""){
			alert("나이를 입력하세요");
			f.age.focus();
			return false;
		}
		if(f.email.value== ""){
			alert("이메일 주소를 입력하세요");
			f.email.focus();
			return false;
		}
		
	f.submit();	
	}
		
		
	
</script>
</form>
</body>
</html>
