<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
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
		
		if(rs.next()){
			response.sendRedirect("idCheck1.jsp?chk_id="+chk_id+"&useble=no");
		}else{
			response.sendRedirect("idCheck1.jsp?chk_id="+chk_id+"&useble=yes");
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
%>