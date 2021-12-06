<%@page import="scope.RequestScopeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="req" class="scope.RequestScopeBean" scope="request"/> <!-- scope=request 이케 적혀있기 때문에 데이터가 넘어감 -->
<jsp:setProperty property="*" name="req"/>

<%-- 위에꺼랑 똑같이  활용 가능함
	<jsp:setProperty property="header" name="req" param="hedear"/>
	<jsp:setProperty property="footer" name="req" param="footer"/>
 --%>
 
	 <!-- 머릿말 드가는 부분 -->
	 <jsp:include page="header.jsp"/>
		 <hr/>
		 
		 <h1>머릿말과 꼬릿말을 직접 입력해서 설정</h1>
		 <form action="requestScope.jsp" method="post">
		 	머릿말에 들어갈 내용 : <br/>
		 	<textarea rows="2" cols="60" name="header"></textarea><p/>
		 	꼬릿말에 들어갈 내용 : <br/>
		 	<textarea rows="2" cols="60" name="footer"></textarea><p/>
		 	<input type="submit" value="적용하기"/>
		  </form>
		  <hr/>
	  <!-- 꼬릿말 드가는 부분 -->
	  <jsp:include page="footer.jsp"/>
 </body>
</html>