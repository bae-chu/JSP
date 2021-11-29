<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
	public int sum(){
		int total = 0;
		for(int i=1; i<=100; i++){
			total+=i;
		}
		return total;
	}
%>
<%
	String str = "1부터 100까지의 합";
%>
<html>
<head>
<meta charset="UTF-8">
<title>expression Test</title>
</head>
<body>
<H2><%=str %>은 <b><%=sum() %></b>입니다. </H2>
<br>
<h2><%=str %>을 1000으로 나누면 <B><%=sum()/1000. %></B> 가 됩니다 </h2>
</body>
</html>