<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = null;
	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		//id가 없거나(로그인을 안했거나) || 관리자가 admin이 아니면 다시 로그인 하시오
		if(!((String)session.getAttribute("id")).equals(request.getParameter("id"))){
		//지가 지아이디 찾아갔는가 보고	
		out.println("<script>");
		out.println("alert('관리자로 로그인하세요');");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>");
		}	
	}

	String mod_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
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
<%
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, mod_id);
		rs = pstmt.executeQuery();
		if(rs.next()){			
%>

<form action = "modifyProcess.jsp" name="modform" method="post">
<table border=1>
	<tr>
		<td colspan="2" class="td_title"> 회원 정보 수정 페이지 </td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString("id") %>
		<input type="hidden" name="id" id="id">
		</td>
	</tr>
	<tr>
		<td>패스워드 : </td>
		<td><input type="password" name="pass" id="pass" value="<%=rs.getString("password") %>"></td>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" id="name" value="<%=rs.getString("name") %>"></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type="text" name="age" id="age" value="<%=rs.getString("age") %>"></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>
			<input type="radio" name="gender" value="남" id="gender1"
						<%=rs.getString("gender").equals("남")?"checked":"" %>>남자 
						
			<input type="radio" name="gender" value="여" id="gender2"
						<%=rs.getString("gender").equals("여")?"checked":"" %>>여자
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td><input type="text" name="email" id="eamil" value="<%=rs.getString("email") %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="전송">
			<a href="javascript:modform.submit();">수정하기</a> &nbsp;&nbsp;
			<a href="javascript:modform.reset();">다시작성</a>
		</td>
	</tr>
</table>	
</form>
<%		
	}else{
		out.println("<script>");
		out.println("alert('선택한 회원정보가 없습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
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
%>	
</body>
</html>
