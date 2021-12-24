<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
		out.println("alert('관리자로 로그인하세욧')");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>");
	}
	
	String delete_id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("delete from member where id=?");
		pstmt.setString(1, delete_id);
		int result = pstmt.executeUpdate();
		
		if(result > 0){	//이 값이 들어오면 삭제를 하고 + 알람 
			out.println("<script>");
			out.println("alert('"+delete_id+"님이 삭제되었습니다.')");
			out.println("location.href='member_list.jsp'");
			out.println("</script>");
			
		}else{	//0값이 들어오면 삭제가 안되는거고  + 알람 
			out.println("<script>");
			out.println("alert('회원 정보가 삭제되지 않았습니다.')");
			out.println("history.back();");
			out.println("</script>");
			
		}
			
	}catch(Exception e){
		out.println("<script>");
		out.println("alert('오류')");
		out.println("history.back();");
		out.println("</script>");
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