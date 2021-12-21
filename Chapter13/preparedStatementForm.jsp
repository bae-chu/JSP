<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script language = "javascript">
var oTb1;
function insRow(){
	oTb1 = document.getElementById("addTable");
	var oRow = oTb1.insertRow();
	oRow.onmouseover = function(){
		oTb1.clickedRowIndex = this.rowIndex
		};//clickedRowIndex 클릭한 row의 
	var oCell = oRow.insertCell();
	//삽입될 form tag
	
	var frmTag = " 번호 : <input type = text name = num id=num> ";
	frmTag += " 이름 : <input type = text name =name id = name> ";
	frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
	oCell.innerHTML = frmTag;
	}
	//Row 삭제
	function removeRow(){
		oTb1.deleteRow(oTb1.clickRowIndex);
	}
	function frmCheck(f){
		for(var i = 0; i<f.elements.length; i++){
			if(f.elements[i].name == "num"){
				if(f.elements[i].value==""){
					alert("번호를 입력하세요!");
					f.elements[i].focus();
					return false;
				}
			}
		}
		
	}

</script>
<body>
<form action = "preparedStatementTest1.jsp" method="post"
				onsubmit="return frmCheck(this);">
<table border="1" cellpadding="0" cellspacint="0">
	<tr>
		<td bgcolor="#fff" height="25" align="left">
			<input type="button" name="addButton" style="cursor:hand" 
					onclick="insRow()" value="입력창 추가"></td>
	</tr>
	<tr>
		<td height="25">
			<table id = "addTable" cellspacing="0" cellpadding="0" bgcolor="#fff" border="1" bordercolor="yellow">
				<tr>
				<td> 번호 : <input type="text" id="num" name="num">
					 이름 : <input type="text" id="name" name="name"></td>
				</tr>
			</table>
		</td>
		</tr>
		<tr><td align="center"><input type="submit" name="button" value="전송"></td></tr>
			
</form>
</table>				
</body>
</html>