package vo;

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
import com.sun.org.apache.xerces.internal.impl.xpath.regex.RegularExpression;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	String uploadPath = request.getServletContext().getRealPath("/upload");
	System.out.println(uploadPath);
	int size = 10*1024*1024;
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";
	
	MultipartRequest multi = new MultipartRequest(request, 
											uploadPath,
											size,
											"utf-8",
											new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		
		String file1=(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1=multi.getOriginalFileName(file1);
		
		String file2=(String)files.nextElement();
		filename2=multi.getFilesystemName(file2);
		origfilename2=multi.getOriginalFileName(file2);
	
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		UploadInfoValue uiv = new UploadInfoValue();
			uiv.setName(name);
			uiv.setSubject(subject);
			uiv.setFilename1(filename1);
			uiv.setFilename2(filename2);
			uiv.setOrigfilename1(origfilename1);
			uiv.setOrigfilename2(origfilename2);
			request.setAttribute("uiv", uiv);
			
	RequestDispatcher dispatcher = request.getRequestDispatcher("/FileUploadServlet.jsp");
	dispatcher.forward(request, response);
	
/*
		request.setAttribute("name", name);
		request.setAttribute("subject", subject);
		request.setAttribute("filename1", filename1);
		request.setAttribute("filename2", filename2);
		request.setAttribute("origfilename1", origfilename1);
		request.setAttribute("origfilename2", filename2);
*/		
	}
}
