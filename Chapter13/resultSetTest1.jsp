<%@page import="oracle.net.aso.p"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>

<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
//	String col = request.getParameter("col");
//	셀렉트를 위처럼 받을수도있지만, 빈칸이 올 수도 있기때문에 (선택 칸) null이 왔을때를 대비해서 작성 추가해야 함. 
	
	String col = "num"; //select 박스 기본 값을 num으로 해놓고. 
		if(request.getParameter("col") != null){ //select 박스 값이 null이 아니면? 
				col = request.getParameter("col"); // 셀렉트 박스값은 col 로 받음. 
		}
	
//	String value = request.getParameter("value");
//	옵션 밸류값의 경우, 쿼리문에서 like 값% <- 이케 검색할거기때문에 아예 %로만 적어주자. 
	String svalue="%";
		if(request.getParameter("svalue") != null){
			svalue = request.getParameter("svalue") + "%";
		}

	Connection conn = null;
//	String sql = "select * from student where ? num like ?";  쿼리문에서 옵션값 그냥 이렇게 ? 로 딸랑 처리하면 안됨. 
	String sql = "select * from student where " + col + " like ? "; // 이케 적어줘야함. 
//	?처리는 값만 가능. 열이름에 ? 넣으면 안됨.  
	System.out.println(sql);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql); //여기서 그냥 실행시키면 에러뜸. 쿼리문의 ? 값 안줫다고. setString 해야함.
		pstmt.setString(1, svalue);
		//검색때 들어오는 옵션 조건이 num일 수도있고 String일수도 잇잖아.
		//근데 setInteger로 해버리면 문자가 들어왔을때 오류가나서 안돌아갈거임. 
		//그래서 안전빵으로 setString으로 합니다. 
		
		rs = pstmt.executeQuery(); // executeQuery의 리턴값은 ResultSet
		
//		while(rs.next()){ // 이렇게만 적으면 검색결과에 해당하지 않는 값을 검색하면 걍 빈페이지만 뜸. 그래서 원래 while 대신 if로 바꿈.
		if(rs.next()){ //그래서 정식으로 검색결과가 나오면 아래문구가 뜨고, 아니면 else가 뜨고. 
			do {
				out.println("<H3>"+rs.getString(1)+", " +rs.getString(2)+"</h3>"); 
			} while(rs.next());
//		if(rs.next()){		이케쓰면 바로 안쓰고 do while로 나눠 쓰는 이유가, if에서 while로 넘어가면
//			while(rs.next()); 앞에 if 기억은 사라지고 while이 기준 되어버림. 캐서 그냥 while부터 시작하는셈 됨.  
//		그래서 do로 한번 찍고, while로 넘어가야 함.  

// 얻고자 하는 값(return값)이 몇개인지 알 수 없기때문에  while(rs.next())으로 반복문 돌려서 모든 값 얻을때까지 돌림. 
// 만약에 얻고자 하는 값이 1개로 특정되어있따면 if(rs.next())만 써서 돌리면 됨. 
// 근데 여러개 값을 얻으려면 무조건 while을 써줘야함. 

		}else{
			out.println("<h3>검색 결과가 없습니다.</h3>");
		}
	}catch (Exception e){
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	}finally{
		try{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
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