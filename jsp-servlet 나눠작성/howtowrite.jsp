 //서블릿/뷰페이지 분리시키는 model 2 형식으로 만들기 

multiFileUpload.jsp 를 쪼갈라서 
multiFileUploadServlet.java 랑 
multiFileUploadServlet.jsp 로 만들기

fileUploadAddForm 의 
form action을 기존 액션에서 multiFileUploadServlet 으로 바꿈. 

<form name ="f" action="multiFileUploadServlet" method="post" 
		enctype="multipart/form-data" onsubmit="return frmCheck()">


------MultiFileUploadServlet.java 서블릿 파일 생성 --------------------------------------------
  
package vo;
//서블릿/뷰페이지 분리시키는 model 2 형식 
import java.io.IOException;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/multiFileUploadServlet")


public class MultiFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public MultiFileUploadServlet() {
        super();
	}
        protected void doPost(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{

	String uploadPath = request.getServletContext().getRealPath("/upload");
	System.out.println(uploadPath);

	int size=10*1024*1024;
	String name = "";
	String subject = "";

	MultipartRequest multi = 
				new MultipartRequest(request, uploadPath, size, "utf-8", 
										new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
//		Enumeration에다가  while 추가해서  FileValue를 거쳐서 데이터를 넘길거임. 
		Enumeration files = multi.getFileNames();	
		ArrayList<FileValue> list = new ArrayList<>();	
		//ArrayList 쓰는 이유 : db에서 값을 가지고 오잖아. 데이터 몇 개 올지 모르니까. 그래서 ArrayList 씀. 
		
		while(files.hasMoreElements()) {
			String file = (String) files.nextElement();
			FileValue fv = new FileValue();
			fv.setFilename(multi.getFilesystemName(file));
			fv.setOrigfilename(multi.getOriginalFileName(file));	//file 객체 만들어짐 
			list.add(fv);			
		}
		request.setAttribute("name", name);
		request.setAttribute("subject", subject);
		request.setAttribute("fileList", list);
		//넘겨줘야 하는 값들은 반드시 request 속성( setAttribute )값으로 넘겨줘야 함. 이렇게 해야 값이 넘어감. 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("multiFileUploadServlet.jsp");
		dispatcher.forward(request, response);
       }

}
  
-------multiFileUploadServlet.jsp 작성 ------------------------------------------------------------
  
  
맨 아래 dispatcher에서 값을 넘겨 줄 multiFileUploadServlet.jsp 지정했으니, 이 파일을 작성함. 

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>   
<%@ page import ="vo.FileValue"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 여기는 ArrayList 를 사용했기 때문에 while 말고 for문을 사용하는 것이 좋음 -->
<%ArrayList<FileValue> fileList = (ArrayList) request.getAttribute("fileList");  %>
	
	<form name="filecheck" action="multiFileCheck.jsp" method="post"> 
		<input type="hidden" name="name" value="<%=request.getAttribute("name")%>">
		<input type="hidden" name="subject" value="<%=request.getAttribute("subject")%>">

<!-- 만약 아랫줄에서 java.lang.NullPointerException 떴을때, 
null 값이 뜰 수 있는건 fileList 임. 앞에 얘가 값을 받아오는거니까. 
그럼 아래 콘솔창에 오류난거 보고, 
만약에 아래와 같은 오류가 떴다면? java:137 <- 이걸 찾아야 되니까 
at org.apache.jsp.multiFileUploadServlet_jsp._jspService(multiFileUploadServlet_jsp.java:137)
보통 이 경로에 있는 해당 파일(multiFileUploadServlet_jsp.java)을 열어서, 열어서 확인해봄 
C:\jsp\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Chapter10\org\apache\jsp
확인해보면 
	for(FileValue fv : fileList) {  얘가 말썽이라고 적혀있는데, 
위에서 말했듯이 보통 오류가나면 받는값이니까 fileList가문제겠지? 
그럼 다른 jsp나 servlet 파일들을 하나하나 추적해나가면서 봐야함. 
오탈자가 없는지. 
  -->
<%	for(FileValue fv : fileList) { %>
		<input type="hidden" name="filename1" value="<%=fv.getFilename()%>">
		<input type="hidden" name="origfilename1" value="<%=fv.getOrigfilename()%>">
<% } %>
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>
</body>
</html>

</body>
</html>


------FileValue.java  작성. ------------------------------------------------------------------------------

package vo;

public class FileValue {
	private String filename = "";
	private String origfilename = "";
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOrigfilename() {
		return origfilename;
	}
	public void setOrigfilename(String origfilename) {
		this.origfilename = origfilename;
	}
}

 --------뷰페이지인 fileUploadAddForm.jsp 수정(form action) 수정--------------------------------------------


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#uploadFormArea{
	margin:auto;
	width:400px;
	border:1px solid black;
}
.td_title{
	font-size:xx-large;
	text-align: center;
}
</style>
</head>
<script>
	var cnt=1;
	var oTbl;
	//row 추가
	
	function insRow(){
		cnt++; //파일업로드 폼 추가하면 전송되는 파일명이 fileName1, 2, 3, 4, 로 바껴야되니까 그거 하기위한 카운터 추가.
		oTbl = document.getElementById("addTable");	//파일업로드폼 추가용 테이블 이름이 addTable 
		var oRow = oTbl.insertRow(); //자바스크립트 제공 메소드. 요거 하면 한줄 추가됨. 
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex //index 번호 설정. 폼 삭제할때 필요함. 
			}; //clickedRowIndex - 클릭한 Row의 위치를 확인(클릭한 줄이 삭제되야되니까 몇번재 줄인지 알아야 함)
		var oCell1 = oRow.insertCell(); // 파일폼추가 누르면 2칸 추가로 생기잖음. 그거 셀1,셀2칸 뜻하는 거. 
		var oCell2 = oRow.insertCell();
		//삽입 될 Form tag 
		var frmTag1 = "<label for='fileName" + cnt + "'>파일명 : <label>";
		var frmTag2 = "<input type='file' name = 'fileName" + cnt + "'id = 'fileName" + cnt + "'>";
		frmTag2 += "<input type=button value = '삭제' onClick = 'removeRow()' style = 'cursor:hand'>";
		oCell1.innerHTML = frmTag1;	//파일폼추가가 되면 위에 frmTag1,2가 생성되서 cell에 들어가짐. 
		oCell2.innerHTML = frmTag2;
		}
		
	function removeRow(){ 	//row 삭제
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	//파일 오류 체크 위한 부분. 파일 업로드부분에서 onsubmit 누를때 파일이 없거나 등등 문제있으면 아래 구문이 뜸. 
	function frmCheck() {	
		var frm = document.f;
		for(var i = 0; i<=frm.elements.length -1; i++){
			if(frm.elements[i].name.indexOf("fileName")>-1){
				if(!frm.elements[i].value){
					alert("업로드 할 파일을 선택하세요");
					frm.elements[i].focus();
					return false;
				}
			}
		}
		
	}
</script>
<body>
	<section id = "uploadFormArea">	<!-- form action multiFileUpload.jsp에서 servlet으로 바꿨음   -->
	<form name ="f" action="multiFileUploadServlet" method="post" 
		enctype="multipart/form-data" onsubmit="return frmCheck()">
		<table width="100%">
			<tr>
				<td colspan="2" class="td_title">파일 업로드 폼</td>
			</tr>
			<tr>
				<td><label for="name">올린 사람 : </label></td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td><label for="subject">제목 : </label></td>
				<td><input type="text" name="subject" id="subject"></td>
			</tr>
			<tr>
				<td colspan="2">
				<table id="addTable" border="1">
					<tr>
						<td><label for="fileName1">파일명 : </label></td>
						<td><input type="file" name="fileName1" id="filename1"></td>
					</tr>
				</table></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="업로드"></td>
			</tr>
		</table>
	</form>
		<input name="addButton" type="button" style="cursor:pointer" onClick="insRow()" value="입력창 추가">
	</section>
</body>
</html>

----------------------------------------------------------------------------------------------------
