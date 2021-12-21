<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");	
	String[] num = request.getParameterValues("num");	//패러미터 값이 둘 다 배열로 넘어옵니다. 그래서 그냥 String으로 함.int 안해도 됨. 
	String[] name = request.getParameterValues("name");

	Connection conn = null;
	String sql = "insert into student values(?,?)"; //두번째 물음표 안에 작은따옴표 포함되어있음. 값이 2개면 ?*2개, 값이 4개면 ?*4개
	System.out.println(sql); //쿼리 올케 나오는가 찍어보기	
	PreparedStatement pstmt = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		for(int i=0; i<num.length; i++){	//PK가 num이므로  num, name중에 num을 for문에 넣어서 작성. 
//			pstmt.setInt(1, Integer.parseInt(num[i]); int는 왼족처럼 형변환 해줘야하니까, 그냥 String으로 해주기 
			pstmt.setString(1, num[i]);	//배열로 들어오니까 그냥 i 아니고 num[i]
			pstmt.setString(2, name[i]);//배열로 들어오니까 name[i]로 작성.  
			if(pstmt.executeUpdate()!=0){	//결과가 0이 아니면 
				out.println("<h3>"+num[i]+"번 레코드를 등록하였습니다.</h3>");
			}
		}
		
	}catch(SQLIntegrityConstraintViolationException e) {
			out.println("<h3>기본키 오류(레코드 중복 등록)</h3>");

	}catch(Exception e){
			out.println("<h3>레코드 등록에 실패하였습니다</h3>");
			e.printStackTrace();
	} 
	finally{
		try{
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
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