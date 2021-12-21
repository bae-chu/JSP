<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	CallableStatement cs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		cs = conn.prepareCall("{call Get_Annual_Income(?,?)}");
		cs.setString(1, "코끼리"); // 1은 첫번째 물음표, ""는 두번재 물음표
		cs.registerOutParameter(2, java.sql.Types.VARCHAR); 	//출력값
		cs.execute();
		out.println("<h3>"+cs.getInt(2)+"</h3>");
		
	}catch (Exception e){
		out.println("<h3>Procedure 호출에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
	finally{
		try{
			if(cs != null)
				cs.close();
			if(conn != null)
				conn.close();
		}
		catch (Exception e){
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