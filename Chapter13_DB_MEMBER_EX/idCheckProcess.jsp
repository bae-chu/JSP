<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String chk_id = request.getParameter("id");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id=?";
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, chk_id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			response.sendRedirect("idCheck.jsp?chk_id=" + chk_id + "&useble=no");
		}else{
			response.sendRedirect("idCheck.jsp?chk_id=" + chk_id + "&useble=yes");
		}		
	}catch(Exception e){
		out.println("<h3>데이터 베이스 연결에 문제가 발생하였습니다.</h3>");
		e.printStackTrace();
	}finally{
		try{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
			
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