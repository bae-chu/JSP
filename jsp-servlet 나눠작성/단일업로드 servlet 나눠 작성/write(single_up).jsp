jsp 파일을 java servlet 파일로 바꾸기 
-----------------------------------------------------------------------------------
FileUpload.jsp <- 이거를 만져서 
FileUploadServlet.java <- 서블릿 파일로 바꾸기 .
FileUploadServlet.jsp 
 
---FileUploadServlet.java----------------------------------------------------------
@WebServlet("/fileUploadServlet")
public class FileUploadServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{


여기까지 적고 FileUpload.jsp에 있는 내용 복붙


<%
	String uploadPath = application.getRealPath("/upload");		//이부분 밑에가서 변경해줘야함 

	int size=10*1024*1024;
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";
	
	try{
		MultipartRequest multi = 
				new MultipartRequest(request, uploadPath, size, "utf-8", 
										new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		origfilename1=multi.getOriginalFileName(file1);
		
		String file2 = (String)files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);
	
	} catch(Exception e){
		e.printStackTrace();
	}
%>

try랑 catch는 지워주고, 아래와같이 java에 맞게 변경 

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vo.UploadInfoValue;

@WebServlet("/fileUploadServlet")
public class FileUploadServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String uploadPath = request.getServletContext().getRealPath("/upload");	// 아까 위에 String uploadPath = application.getRealPath("/upload"); 였던 부분 변경
		System.out.println(uploadPath);
		int size=10*1024*1024;
		String name = "";
		String subject = "";
		String filename1 = "";
		String filename2 = "";
		String origfilename1 = "";
		String origfilename2 = "";

			MultipartRequest multi = 
					new MultipartRequest(request, uploadPath, size, "utf-8", 
											new DefaultFileRenamePolicy());
			
			name = multi.getParameter("name");
			subject = multi.getParameter("subject");
			
			Enumeration files = multi.getFileNames();
			
			String file1 = (String)files.nextElement();
			filename1 = multi.getFilesystemName(file1);
			origfilename1=multi.getOriginalFileName(file1);
			
			String file2 = (String)files.nextElement();
			filename2 = multi.getFilesystemName(file2);
			origfilename2 = multi.getOriginalFileName(file2);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<form name=\"filecheck\" action=\"fileCheck.jsp\" method=\"post\">");
			out.println("<input type=\"hidden\" name=\"name\" value=\""+name+"\">");
			out.println("<input type=\"hidden\" name=\"subject\" value=\""+subject+"\">");
			out.println("<input type=\"hidden\" name=\"filename1\" value=\""+filename1+"\">");
			out.println("<input type=\"hidden\" name=\"filename2\" value=\""+filename2+"\">");
			out.println("<input type=\"hidden\" name=\"origfilename1\" value=\""+origfilename1+"\">");
			out.println("<input type=\"hidden\" name=\"origfilename2\" value=\""+origfilename2+"\">");
			out.println("</form>");
			out.print("<a href=\"#\" onclick=\"javascript:filecheck.submit()\">");
			out.print("업로드 확인 및 다운로드 페이지 이동 </a>");
		}
}
--------근데 out.print 부분을 이렇게 작성하면 수정시 효율적이지 못하기 때문에(프론트 엔드 개발자가 손을 못댐) 좀더 효율적으로 작성. ---------------------------------

			request.setAttribute("name", name);
			request.setAttribute("subject", subject);
			request.setAttribute("filename1", filename1);
			request.setAttribute("filename2", filename2);
			request.setAttribute("origfilename1", origfilename1);
			request.setAttribute("origfilename2", origfilename2);
		
-----------------------------------------------------------
변경하고 
fileUploadForm에 있는 Form action 을 servlet 이랑 연결해줘야함. 
<form action="fileUploadServlet" method="post" enctype="multipart/form-data">
요부분. 
----------------------------------------------------------------------------------------------------------------------
fileUpload.jsp 하단부분에 있는 form 복붙해서 
새로 fileuploadServlet.jsp 만든뒤에, 
<body> 안에 붙여넣음.

<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="subject" value="<%=subject %>">
		<input type="hidden" name="filename1" value="<%=filename1 %>">
		<input type="hidden" name="filename2" value="<%=filename2 %>">
		<input type="hidden" name="origfilename1" value="<%=origfilename1 %>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2 %>">
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>
</body>

위 부분. 
----------------------------------------------------------------------------------------------------------------------
vo 패키지에 UploadInfoValue.java 파일 만듦. 
변수선언하고, getter setter 만듦. 
변수 선언 시 nullpointException 발생하지 않도록 빈문자열 줌. 아니면 오류났을때 null값 넘어가서 오류뜸. 

package vo;

public class UploadInfoValue {
	String name="";	
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	//변수선언해주고, getter setter 만들어주기 
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getOrigfilename1() {
		return origfilename1;
	}
	public void setOrigfilename1(String origfilename1) {
		this.origfilename1 = origfilename1;
	}
	public String getOrigfilename2() {
		return origfilename2;
	}
	public void setOrigfilename2(String origfilename2) {
		this.origfilename2 = origfilename2;
	}
	
	}
----------------------------------------------------------------------------------------------------------------------
그 다음에 FileUploadServlet.java 으로 돌아와서, 
request.setAttribue 부분 모두 변경작성해줌. 
위에 UploadInfoValue.java 만들었으니까 맞춰서 uiv로 생성. 
UploadInfoValue.java 랑 연결.

UploadInfoValue uiv = new UploadInfoValue(); 
			uiv.setName(name);
			uiv.setSubject(subject);
			uiv.setFilename1(filename1);
			uiv.setFilename2(filename2);
			uiv.setOrigfilename1(origfilename1);
			uiv.setOrigfilename2(origfilename2);	

//이케 만들고나서 얘를 attribute로 만듦
//왜냐면.. 저쪽에 getAttribute가 있짜나. 그러니까 여기에 set을 해줘야함	
		
			request.setAttribute("uiv", uiv);	

//이케하고 fileUploadServlet.jsp 에다가 객체를 만들어줘야 함. 

	RequestDispatcher dispatcher = request.getRequestDispatcher("/fileUploadServlet.jsp");
			dispatcher.forward(request, response);

요것도 연결해주고 


----------fileUploadServlet.jsp ------------------------------------------------------------------------------------------------------------

원래는 <input type="hidden" name="name" value="<%=request.getAttribute(name)%>"> 였는데, 
UploadInfoValue.java 설정함으로써 아래와같이 uiv.getName() 변경해줘야 함. 

변경전에 page import 해주고 "패키지 위치. 클래스명"	

value="${uiv.origfilename2}"> <- ${} 은 EL 문자임. 이렇게 작성해도 됨. 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "vo.UploadInfoValue" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUploadServlet</title>
</head>
<body>
<%UploadInfoValue uiv = (UploadInfoValue)request.getAttribute("uiv"); %>
<form name="filecheck" action="fileCheck.jsp" method="post">


		<input type="hidden" name="name" value="<%=uiv.getName()%>"> 
		<input type="hidden" name="subject" value="<%=uiv.getSubject()%>">
		<input type="hidden" name="filename1" value="<%=uiv.getFilename1() %>">
		<input type="hidden" name="filename2" value="<%=uiv.getFilename2() %>">
		<input type="hidden" name="origfilename1" value="${uiv.origfilename1}">	
		<input type="hidden" name="origfilename2" value="${uiv.origfilename2}">
	</form>
<a href="#" onclick="javascript:filecheck.submit()"> 업로드 확인 및 다운로드 페이지 이동 </a>
</body>
</html>

---------------------------------------------------------------------
