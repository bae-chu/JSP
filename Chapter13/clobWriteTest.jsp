<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	StringBuffer sb = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		String sql ="insert into clobtable values(1,?)";
		sb = new StringBuffer();
		
		for(int i = 0; i<10000; i++){
			sb.append("홍길동");
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sb.toString());
		pstmt.executeUpdate();
		out.println("데이터를 저장하였습니다.");
				
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
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