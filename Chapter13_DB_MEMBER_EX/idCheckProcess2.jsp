<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String chk_id = request.getParameter("idCheck");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "select * from member where id = ?";
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	con = ds.getConnection();
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, chk_id);
	rs = pstmt.executeQuery();
	if(rs.next()){//아이디 사용 불가
		response.sendRedirect("idcheck3.jsp?chk_id="+chk_id+"&useble=no");
	}else{// 아이디 사용 가능
		response.sendRedirect("idcheck3.jsp?chk_id="+chk_id+"&useble=yes");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
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