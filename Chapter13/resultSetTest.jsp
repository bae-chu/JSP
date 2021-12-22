<%@page import="oracle.net.aso.p"%>
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
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); // executeQuery의 리턴값은 ResultSet
		
		while(rs.next()){
			out.println("<H3>"+rs.getInt(1)+", " +rs.getString(2)+"</h3>"); //getString 써도 ㅇㅋ 
		} //일반적으로 java 배열은 0부터 스타트인데, 이거 는 1번부터 시작함. 
	}catch (Exception e){
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	}finally{
		try{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
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