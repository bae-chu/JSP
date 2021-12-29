<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	
if((session.getAttribute("id")==null) || //id가 있는지 보고, or 
			(!((String)session.getAttribute("id")).equals("admin"))){ 
		//id가 admin이면 들어가짐(관리자모드)
	out.println("<script>");
	out.println("alert('관리자로 로그인하세요')"); //관리자로 로그인 안하면 뜸 
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
	}else{
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
		
		pstmt=conn.prepareStatement("select * from member");
		rs=pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자 모드(회원 목록 보기)</title>
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
</style>
</head>
<body>
<table>
	<tr>
		<td colspan="2" class="td_title">회원목록</td>
	</tr>
	<%while(rs.next()){ %>
	<tr>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a>
		</td>
		<td>
			<a href="member_mod.jsp?id=<%=rs.getString("id") %>">수정</a> &nbsp;&nbsp;
			<a href="javascript:deleteChk('<%=rs.getString("id") %>')">삭제</a>
		</td>
	</tr>
	<%} %>
</table>
<script>
function deleteChk(id) {
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="member_delete.jsp?id="+id;
	}
	
}
</script>
</body>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
%>
</html>