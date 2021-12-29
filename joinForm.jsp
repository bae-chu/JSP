<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리 시스템 회원 가입 페이지</title>
<style>
	table{
		margin:auto;
		width:550px;
		border:1px solid gray;
		text-align:center;}
	.td_title{
		font-weight:bold;
		font-size:x-large;}
</style>
</head>
<script>
var chkId=false;
var idcheck;
function chkForm(f){
	if(!chkId || idcheck!=f.id.value.trim()){
		alert("아이디 중복확인을 하세요!!!");
		return false;
	}
	
	if(f.pass.value.trim()==""){
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return false;	
	}
	if(f.pass.value.trim()!=f.passChk.value.trim()){
		alert("비밀번호가 일치하지 않습니다.");
		f.pass.value="";
		f.passChk.value="";
		f.pass.focus();
		return false;
	}
	
	f.submit();
}
</script>
<body>
<form action="joinProcess.jsp" name="joinform" method="post" onsubmit="return chkForm(this);">
<table border="1">
	<tr>
		<td colspan="2" class="td_title">회원 가입 페이지</td></tr>
	<tr>
		<td><label for="id">아이디 : </label></td>
		<td align=left><input type="text" name="id" id="id" required/>
		<input type="button" name="idCheck" value="아이디 중복확인" id="idCheck" 
		onclick="window.open('idCheck.jsp?openInit=true','','width=300, height=200')"/>
		</td>
	</tr>
	<tr>
		<td><label for="pass">비밀번호 : </label></td>
		<td align=left><input type="password" name="pass" id="pass"  required/></td>
	</tr>
	<tr>
		<td><label for="passChk">비밀번호 확인 : </label></td>
		<td align=left><input type="password" name="passChk" id="passChk"  required/></td>
	</tr>
	<tr>
		<td><label for="name">이름 : </label></td>
		<td align=left><input type="text" name="name" id="name"/></td>
	</tr>
	<tr>
		<td><label for="age">나이 : </label></td>
		<td align=left><input type="text" name="age" id="age"/></td>
	</tr>
	<tr>
		<td><label for="gender1">성별 : </label></td>
		<td align=left><input type="radio" name="gender" value="남" checked id="gender1"/>남자
			<input type="radio" name="gender" value="여" id="gender2"/>여자
		</td>
	</tr>	
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td align=left><input type="text" name="email" id="email"/></td>
	</tr>
	<tr>
		<td><label for="zip">우편번호 : </label></td>
		<td align=left><input type="text" name="zip" id="zip" size=6 readonly/>
			<input type="button" name="zipSearch" value="검색" id="zipSearch" onclick="window.open('zip1.jsp','','width=800, height=600')"/>
		</td>
	</tr>
		<tr>
		<td><label for="addr1">주소 : </label></td>
		<td align=left><input type="text" name="addr1" id="addr1" size=50 readonly/>
		</td>
	</tr>
		<tr>
		<td><label for="addr2">주소상세 : </label></td>
		<td align=left><input type="text" name="addr2" id="addr2" size=50/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="가입">
		<input type="button" value="가입" onclick="chkForm(this.form)">
		<a href="#" onclick="chkForm(document.joinform);">회원 가입</a>&nbsp;&nbsp;
		<a href="javascript:joinform.reset()">다시 작성</a>
		</td>
	</tr>	
</table>
</form>
</body>
</html>