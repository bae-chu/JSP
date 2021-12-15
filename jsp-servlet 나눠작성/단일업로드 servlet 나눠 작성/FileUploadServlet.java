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
		String uploadPath = request.getServletContext().getRealPath("/upload");
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
			
			UploadInfoValue uiv = new UploadInfoValue(); //UploadInfoValue.java 랑 연결되는 부분 
			uiv.setName(name);
			uiv.setSubject(subject);
			uiv.setFilename1(filename1);
			uiv.setFilename2(filename2);
			uiv.setOrigfilename1(origfilename1);
			uiv.setOrigfilename2(origfilename2);	
			//이케 만들고나서 얘를 attribute로 만듦 . 왜냐면.. 저쪽에 getAttribute가 있짜나. 그러니까 여기에 set을 해줘야함. 
			
			request.setAttribute("uiv", uiv);	//이케하고 fileUploadServlet.jsp 에다가 객체를 만들어줘야 함. 왜냐면 
			
			/*
			request.setAttribute("name", name);
			request.setAttribute("subject", subject);
			request.setAttribute("filename1", filename1);
			request.setAttribute("filename2", filename2);
			request.setAttribute("origfilename1", origfilename1);
			request.setAttribute("origfilename2", origfilename2);
			*/
			RequestDispatcher dispatcher = request.getRequestDispatcher("/fileUploadServlet.jsp");
			dispatcher.forward(request, response);
			
/*		
 * 	실제로 이렇게 작성하면 하나도 수정시 효율적이지 못하기 때문에(프론트 엔드 개발자가 손을 못댐) 좀더 효율적으로 작성. 
 * 
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
			
*/
	}
}







