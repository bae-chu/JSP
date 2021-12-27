<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
</head>
<%
String id =  request.getParameter("id");
String openInit = "false";
if(request.getParameter("openInit")!=null){
	openInit=request.getParameter("openInit");
}
%> 
<script>
function init(){
	if(<%=openInit%>){
		document.getElementById("id").value
			=opener.document.getElementById("id").value;
	}
}
function useId(v){
	opener.chkId=true;
	opener.idcheck=v.trim();
	opener.document.getElementById("id").value=v;
	window.close();
}
</script>
<body onload="init()">
<form action = "idCheck.jsp" method="post" name="f">
	<input type="text" name="id" id="id"/>
	<input type="submit" value="중복확인"/>
</form>

<%
	if(!(id == null || id.equals(""))){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			pstmt= con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){%>
		<h3><%=id %>는 사용 불가능한 아이디입니다. 다시 검색하세요.</h3>
<% 			}else{%>
		<h3><%=id %>는 사용 가능한 아이디입니다. <a href="javascript:useId('<%=id %>')">사용하기</a></h3>
<%			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
%>
</body>
</html>