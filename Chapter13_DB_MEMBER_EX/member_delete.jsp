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

//스크립트를 빼고 바로 리다이렉트 쏴주면 서버가 순서대로 진행을 하기때문에 문제가 발생하지 않음. 
//근데 스크립트 부분은 응답을 클라이언트에서 진행을 하기때문에, 서버에서 동작할거 다 하고 나서 클라이언트가 진행을 해버림. 
//원래 순서 우선순위가 서버-> 클라기때문에? 
//그래서 사용자 아이디로 로그인해서 주소창에다가 직접 입력해서 삭제를 시도하면 관리자로 로그인하라고 알람은 뜨지만,
//이미 서버에서 동작 다 하고나서 클라에서 움직이는거라 실제로는 삭제가 되어버림. 
//그래서 이런식으로 동작 하지 못하도록 아래 else if로 짜서 if에 스크립트 부분 넣고, 남은 부분은 통째로 else로 묶음. 
	}else{
	
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