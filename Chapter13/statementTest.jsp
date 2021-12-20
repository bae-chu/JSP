<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Connection conn = null;
	String sql = "INSERT INTO student(num, name) VALUES (3, '고양이')";
	Statement stmt = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection(); // 요기까지 connection 만듦 
		
		stmt = conn.createStatement();	
		//여는 순서가 connection 하고 statement 이면, 닫을때는 반대순서로. statement하고 connection 순서로 닫음. 
		
		int result = stmt.executeUpdate(sql);
		if(result!=0){ //값이 0이 아니다 = 값이 있다 
			out.println("<h3>레코드가 등록되었습니다.</h3>");//레코드 올케 됐는지 확인할려고 실행해봄 
		}
		
		}	catch(SQLIntegrityConstraintViolationException e) {
	 			out.println("<h3>기본키 오류(레코드 중복 등록)</h3>");
		
		}	catch(Exception e){
				out.println("<h3>레코드 등록에 실패하였습니다</h3>");
				e.printStackTrace();
		} 	
			finally{
				try{
					if(stmt!=null)
						stmt.close();
					if(conn!=null)
						conn.close();
		//여는 순서가 connection 하고 statement 이면, 닫을때는 반대순서로. statement 닫고 connection 순서로 닫음. 
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