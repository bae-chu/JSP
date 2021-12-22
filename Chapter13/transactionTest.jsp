<%@page import="javax.naming.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into student values(13, '홍길동')";
	String sql2 = "select * from student where num=12"; //12 값이 있어야 첫번째 쿼리 실행댐 
	//num=12 값이 있으면 정상처리. 값이 없으면 롤벡 처리. (13값 입력 안됨)
	System.out.println(sql);
	System.out.println(sql2);
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2); //노란줄 : 앞에 쿼리문 하나 만들었는데 또 있으니까 뜨는겨 
		rs=pstmt.executeQuery();
		
		if(!rs.next()){ //num=12값 없을 경우
			conn.rollback();
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백하였습니다.</h3>");
		}else{ //num = 12값 있을경우 
			conn.commit();
			out.println("<h3>데이터 삽입이 모두 완료되었습니다.</h3>");
			
		}
			conn.setAutoCommit(true);
		
	}catch(Exception e){ //실제로는 여기 catch에도 rollback을 넣어줌 
//			conn.rollback(); 바로 이렇게 적으면 안되고 if 붙여줘야 함. 
			if(conn!=null) conn.rollback();//null이 아닐 경우에만 rollback하도록 해야함. 
			//오류나는 위치가 connection 객체 생성할때. try 3째줄 시작하면서 생성되는데, 
			//try 세번재줄에 conn = ds.getConnection()이 생성안되면 null이잖음.
			//객체가 생성이 되어야지 메서드를 사용할 수 있는데, 객체 생성 안된상테선 메서드 사용 못하잖아.
			//근데 만약에 try 두번째줄 전에 오류가 되버리면 이 값 자체가 null 이잖음?
			//근데 실행시켜버리면 아까 객체가 null이니까  현재 캐치 위치에서 nullPointException이 발생함.
			//아래 finally의 try에 있는 구문도 마찬가지임. 
			//rs.close(); 이것만 적어놓으면, 만약에  null이 들어왔을때 close()가 안되니까 이게 계속 열려서 
			//접속수 오버되서 멈춤..... 그래서..if(rs!=null) rs.close(); 요케 항상 셋트로 만듦
			
			out.println("<h3>데이터 삽입에 실패하였습니다.</h3>");
			e.printStackTrace();
		
	}finally{
		try{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null);
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