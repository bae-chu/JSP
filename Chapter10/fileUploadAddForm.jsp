<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#uploadFormArea{
	margin:auto;
	width:400px;
	border:1px solid black;
}
.td_title{
	font-size:xx-large;
	text-align: center;
}
</style>
</head>
<script>
	var cnt=1;
	var oTbl;
	//row 추가
	
	function insRow(){
		cnt++; //파일업로드 폼 추가하면 전송되는 파일명이 fileName1, 2, 3, 4, 로 바껴야되니까 그거 하기위한 카운터 추가.
		oTbl = document.getElementById("addTable");	//파일업로드폼 추가용 테이블 이름이 addTable 
		var oRow = oTbl.insertRow(); //자바스크립트 제공 메소드. 요거 하면 한줄 추가됨. 
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex //index 번호 설정. 폼 삭제할때 필요함. 
			}; //clickedRowIndex - 클릭한 Row의 위치를 확인(클릭한 줄이 삭제되야되니까 몇번재 줄인지 알아야 함)
		var oCell1 = oRow.insertCell(); // 파일폼추가 누르면 2칸 추가로 생기잖음. 그거 셀1,셀2칸 뜻하는 거. 
		var oCell2 = oRow.insertCell();
		//삽입 될 Form tag 
		var frmTag1 = "<label for='fileName" + cnt + "'>파일명 : <label>";
		var frmTag2 = "<input type='file' name = 'fileName" + cnt + "'id = 'fileName" + cnt + "'>";
		frmTag2 += "<input type=button value = '삭제' onClick = 'removeRow()' style = 'cursor:hand'>";
		oCell1.innerHTML = frmTag1;	//파일폼추가가 되면 위에 frmTag1,2가 생성되서 cell에 들어가짐. 
		oCell2.innerHTML = frmTag2;
		}
		
	function removeRow(){ 	//row 삭제
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	//파일 오류 체크 위한 부분. 파일 업로드부분에서 onsubmit 누를때 파일이 없거나 등등 문제있으면 아래 구문이 뜸. 
	function frmCheck() {	
		var frm = document.f;
		for(var i = 0; i<=frm.elements.length -1; i++){
			if(frm.elements[i].name.indexOf("fileName")>-1){
				if(!frm.elements[i].value){
					alert("업로드 할 파일을 선택하세요");
					frm.elements[i].focus();
					return false;
				}
			}
		}
		
	}
</script>
<body>
	<section id = "uploadFormArea">
	<form name ="f" action="multiFileUpload.jsp" method="post"
		enctype="multipart/form-data" onsubmit="return frmCheck()">
		<table width="100%">
			<tr>
				<td colspan="2" class="td_title">파일 업로드 폼</td>
			</tr>
			<tr>
				<td><label for="name">올린 사람 : </label></td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td><label for="subject">제목 : </label></td>
				<td><input type="text" name="subject" id="subject"></td>
			</tr>
			<tr>
				<td colspan="2">
				<table id="addTable" border="1">
					<tr>
						<td><label for="fileName1">파일명 : </label></td>
						<td><input type="file" name="fileName1" id="filename1"></td>
					</tr>
				</table></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="업로드"></td>
			</tr>
		</table>
	</form>
		<input name="addButton" type="button" style="cursor:pointer" onClick="insRow()" value="입력창 추가">
	</section>
</body>
</html>