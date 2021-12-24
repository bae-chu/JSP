<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		pstmt = conn.prepareStatement("select * from member where id=?");
//		pstmt = conn.prepareStatement("select * from member where id=? and password=?");
		pstmt.setString(1, id);
//		pstmt.setString(2, pass);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){;
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
		}
		
		out.println("<script>");
		out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");

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
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>