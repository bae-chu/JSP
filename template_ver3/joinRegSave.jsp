<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- member class 만든거랑 Arraylist 사용해서 만듦. 우선 import 먼저 시킴  -->
<%@ page import="java.util.ArrayList, member.Member"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 이 페이지는 데이터 받아서 처리하는 페이지기때문에 가장먼저 인코딩.
서버에서 제일먼저 처리하는 건 데이터처리. 그다음 응답내용. 이 순서대로 작성.  -->
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
/*	여기까지 데이터를 받았음. 이제 처리해야함. 
	그 다음은 ArrayList로 처리해야함.
	멤버형을 array로 하는 자료형 리스트 작성 
	밑에 ArrayList에다가 new를 선언해버리면 페이지 새로 들어갈때마다 새로고침해서 원래잇던 자료 사라짐...
	그래서 new 넣으면 앙댐 
	여러페이지에 걸쳐 데이터를 공유해야함. 우리는 여러페이지 다 사용하기때문에 어느 영역을 사용하면 데이터를 공유할 수 있을까.
	여러페이지 데이터 공유 : application, session  
	session의 경우 주어진 시간이 있음. 일정 시간 지나면  자동으로 사라짐. 
	그래서 여기에서는 application으로 만듦. 
	실제로 추후 pjt 할 때엔 db 사용하기때문에 이렇게 할 필요는 없음. */
%>

<%
	ArrayList<Member> memberList = 
		(ArrayList)application.getAttribute("memberList");
// attribute는 자료형이 아니고 object 이므로, 형변환 해줘야해서 앞에 (ArrayList) 붙임. 
// 맨 처음엔 아무값도 없는 상태이므로 null일거임. null일 때는 새로 리스트 생성을 해줘야함.

	if(memberList == null){
		memberList = new ArrayList<>(); // null 이면? 리스트 생성하새오. 
		//위에 getAttribute 이쓰니까 생성된 리스트 객체를 setAttribute 해줘야함. 
		application.setAttribute("memberList", memberList);
		//요까지하면 appl 속성으로 memberlist가 생김. 
	}
	boolean usebleId=true;
	for(Member m: memberList){
//	for(int i=0; i<memberList.size(); i++){} <-이거 쓰던가 위에꺼 쓰던가 
		if(id.equals(m.getId())){ //들어있는거랑 이 아이디랑 같으면? 알려줘야지? (사용가능여부 확인)
				//근데 현재는 있는 변수 가지고는 긴지 아닌지 확인을 못하니까, 변수 하나 더 추가. boolean. (for 위에)
			usebleId = false;
			break;
		}
	}
	if(usebleId){ //usebleId가 true이면? 아이디가 없으면? 새로생성해야지. 요 밑에줄은 아까전에 작성한거. 
		memberList.add(new Member(id, pass, name, tel));	//이케 추가해줌. 
		response.sendRedirect("template.jsp?page=login"); //정상 가입 후 로그인 화면으로 돌아감. 
	} else { //근데 아이디가 있으면? 알람띄워야지.
		out.print("<script>");
		out.print("alert('경고!!! 중복된 아이디입니다.');");
		out.print("location.href='template.jsp?page=join';"); //실패하면 아까 페이지 돌아가야지
		out.print("</script>");
	
		//요까지하고 나서 정상적으로 가입이 되고 데이터가넘어가면, 초기 화면으로 돌아가야함. 이게 위에 response.sendRed...
	}
//그런데 ArrayList는 중복을 허용함. 중복을 허용치않게하기위해서는 멀 더 추가해줘야함. 
//hash tag나 hash map 등등?  
//근데 arraylist 쓰고있으니까 이걸로 하자. 여기서 중복제거하려면 현재 있는 데이터랑 비교해보면 됨. 
//동일한 아이디가 있는지 없는지. 
//ArrayList랑 비교해서 만약에 동일아이디가 있으면 중복된 아이디라고 알람을 띄움. (memberList.add 위에)
%>

</body>
</html>