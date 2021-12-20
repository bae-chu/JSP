<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");	
	String num = request.getParameter("num");	//쿼리문에서 문자로 들어가기때문에 int 형변환 안해줘도 무방함. 
	String name = request.getParameter("name");
	
	Connection con = null;
	String sql = "INSERT INTO student values(" + num + ",'" + name + "')";
	//num이랑 name은 변수값 들어가줘야 하기 때문에 " " 이거 잘 맞춰서 넣어줘야 함... 
	
	System.out.println(sql); //쿼리문 제대로 출력되는지 보기 위해서 찍어보는거 
	
	Statement stmt = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection(); // 요기까지 connection 만듦 		
		stmt = con.createStatement();	

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
					if(con!=null)
						con.close();

			} catch(Exception e){
				e.printStackTrace();
		}	
	}
	
%>