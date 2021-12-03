<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String pagefile=request.getParameter("page");
if(pagefile==null) {pagefile="newitem";}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Test</title>
<style type="text/css">
	#main{
		margin : auto;
		width : 960px;
		color : gray;
		border : 1px solid gray;
	}
	td{
		border:1px solid gray;
	}
	
	.list{
		width:400px;
		border : 1px solid gray;
		}
</style>
</head>
<body>
<table id="main">
	<tr>
		<td height="43" colspan="3" align="left">
			<jsp:include page="top.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" valign="top"><br>
			<jsp:include page="left.jsp"></jsp:include>
		</td>
		<td colspan="2" align="center">
			<jsp:include page='<%=pagefile+".jsp" %>'></jsp:include>
		</td>
	</tr>
	<tr>
		<td width="100%" height="40" colspan="3">
			<jsp:include page="bottom.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>