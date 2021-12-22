<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	String sql = "select * from student";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs = pstmt.executeQuery();
		
		rs.last();
			out.println(rs.getInt(1)+", "+rs.getString(2)+"<br>");
		rs.first();
			out.println(rs.getInt(1)+", "+rs.getString(2)+"<br>");
		rs.absolute(3);
			out.println(rs.getInt(1)+", "+rs.getString(2)+"<br>");
		
		
	}catch(Exception e){
		out.println("<h3>데이터 가져오기에 실패하였습니다. </h3>");
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>