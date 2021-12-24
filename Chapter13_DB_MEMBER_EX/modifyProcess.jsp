<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("id")==null || !((String)session.getAttribute("id")).equals("admin")){ 
		//id가 null이거나 (스트링 형변환해서)받아온 id가 admin이 아니면 ==> 관리자 로그인 
		if(((String)session.getAttribute("id")).equals(request.getParameter("id"))){
			//memeber_mod에서 히든값으로 넘어오는게 id니까 getp도 id	
			out.println("<script>");
			out.println("alert('관리자로 로그인하세요');");
			out.println("location.href='loginForm.jsp';");
			out.println("</script>");
		}
		
	}
	//패러미터 id 만들고 Connection PreparedStatement 만들어주고 
	String mod_id = request.getParameter("id");
	String pass =request.getParameter("pass");
	String name =request.getParameter("name");
	int age= Integer.parseInt((request.getParameter("age")==null 
			|| request.getParameter("age").trim().equals(""))?"0" : request.getParameter("age").trim());
	String gender =request.getParameter("gender");
	String email =request.getParameter("email");
	
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String sql = "update member set PASSWORD=?, NAME=?,  AGE=?, GENDER=?, EMAIL=? where ID=?";
	System.out.println(sql);
	
	try{	//가능한 update insert delete는 트랜젝션 구문 넣어주는게 좋음 
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		conn.setAutoCommit(false);	//트랜젝션
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(6, mod_id);
		pstmt.setString(1, pass);
		pstmt.setString(2, name);
		pstmt.setInt(3, age);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		//쿼리문 순서대로 숫자 부여 
				
		int result = pstmt.executeUpdate();//result 값을 만들어줘서 
		if(result > 0) {
			conn.commit();
			out.println("<script>");
			out.println("alert('회원 수정이 완료되었습니다.');");
			out.println("location.href='member_info.jsp?="+mod_id+"';"); //member Info 페이지로 가서 제대로 수정햇는지 보고
			out.println("</script>");
		
		}else{ //아니면(문제시)
			conn.rollback();
			out.println("<script>");
			out.println("alert('정보 수정이 완료되지 않았습니다. 다시 작성하세요');");
			out.println("history.back();");
			out.println("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		conn.rollback();
		out.println("<script>");
		out.println("alert('정보 수정에 오류가 발생하였습니다. 다시 작성하세요');");
		out.println("history.back();");
		out.println("</script>");
	
	}finally{
		try{
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