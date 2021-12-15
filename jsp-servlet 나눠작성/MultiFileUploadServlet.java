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