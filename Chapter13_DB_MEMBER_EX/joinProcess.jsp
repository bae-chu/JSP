<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	
//	int age= Integer.parseInt(request.getParameter("age"));
	//만약에 나이가 null이거나 빈칸, 문자로  들어오면 오류남. 
	//그래서 숫자만 적을수있도록 만들어줘야 함. 
	//근데 if 문으로 쓰는 것 보다는 조건식으로 적어주는게 훨씬 심플함. 
	int age= Integer.parseInt(request.getParameter("age")==null 
		|| request.getParameter("age").trim().equals("")?"0" : request.getParameter("age").trim());
	//age가 null or 빈칸이 왔을때는 0으로 맞춰주고, 그렇지 않으면 age로 들어온 값을 인정함. 
	
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");

	
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?)");
		//테이블 구조에 맞춰서 물음표 순서랑 아래 넘버링이랑 딱 맞춰서 넣어줘야 함.  
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("alert('회원 가입이 완료되었습니다.');");
			out.println("location.href='loginForm.jsp';");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('회원 가입이 완료되지 않았습니다. 다시 작성하세요');");
			out.println("history.back();");
			out.println("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		
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