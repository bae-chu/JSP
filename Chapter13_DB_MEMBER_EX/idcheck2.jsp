<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%	
	request.setCharacterEncoding("UTF-8");
	String openInit="false";
	if(request.getParameter("openInit")!=null){
		openInit="true";
	}
%>
<script>
function init(){
	if(<%=openInit%>){
		document.getElementById("id").value=opener.document.getElementById("id").value;
	}
}
function ok(v){
	opener.idcheck=v.trim();
	opener.document.getElementById("id").value=v;
	opener.chkId=true;
	window.close();
}
</script>
<body onload="init()">
<form action = "idcheck2.jsp" method="post" name="f">
	<input type="text" name="id" id="id"/>
	<input type="submit" value="중복확인"/>
</form>
<% 
	if(request.getParameter("id")!= null && 
			!request.getParameter("id").trim().equals("")){
	request.setCharacterEncoding("utf-8");
	String chk_id = request.getParameter("id");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql="select * from member where id=?";
	try{
		DataSource ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, chk_id);
		rs =  pstmt.executeQuery();
		
		out.print("<hr>");
		if(rs.next()){
			out.println("<h3>"+chk_id+"는 사용 불가능한 아이디입니다.</h3>");
		}else{
			out.print("<h3>"+chk_id+"는 사용 가능한 아이디입니다. ");
			out.print("<a href='#' onclick=\"ok('"+chk_id+"')\">사용하기</a></h3>");
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
	}
%>

</body>