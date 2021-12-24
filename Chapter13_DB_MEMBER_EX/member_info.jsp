<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		//id가 없거나(로그인을 안했거나) || 관리자가 admin이 아니면 다시 로그인 하시오
		if(!((String)session.getAttribute("id")).equals(request.getParameter("id"))){
			
		out.println("<script>");
		out.println("alert('관리자로 로그인하세요')");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>");
		
		}
	}
	String info_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, info_id);
			rs = pstmt.executeQuery();
			if(rs.next()){	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자 모드(회원 정보 보기)</title>
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
</style>
</head>
<body>
<table>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=rs.getString("password") %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=rs.getString("name") %></td>
	</tr>	
	<tr>
		<td>나이 : </td>
		<td><%=rs.getString("age") %></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td><%=rs.getString("gender") %></td>
	</tr>
	<tr>
		<td>이메일주소 : </td>
		<td><%=rs.getString("email") %></td>
	</tr>
	<tr>
		<td colspan="2">
		<%if(((String)session.getAttribute("id")).equals("admin")){ %>
			<a href="member_list.jsp">리스트로 돌아가기</a> &nbsp;&nbsp;&nbsp;
		<%}else{ %>
			<a href="main.jsp">메인으로 돌아가기</a>
		<%} %>
		</td>
	</tr>
</table>
<%
		
	}else{
		out.println("<script>");
		out.println("alert('선택한 회원정보가 없습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
	}catch(Exception e){
	e.printStackTrace();
	
	}finally{
		try{
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>