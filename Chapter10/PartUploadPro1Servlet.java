import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import jdk.nashorn.internal.runtime.UserAccessorProperty;

@WebServlet("/partUploadPro1")
@MultipartConfig(	//얘네들은 반드시 public class.클래스명 위에 적어줘야 함. 
		fileSizeThreshold=0,
		location="C:/jsp/upload"
		) 
public class PartUploadPro1Servlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public PartUploadPro1Servlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
		Part part = request.getPart("partFile1");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String contentDisposition = part.getHeader("content-disposition");
		System.out.println(contentDisposition);
		String browser = getBrowser(request); //브라우저 구분 
		String uploadFileName = getUploadFileName(browser, contentDisposition);
		part.write(uploadFileName);
		out.println("작성자 "+writer+"님이 "+uploadFileName+" 파일을 업로드 하였습니다.");
	}

	private String getUploadFileName(String browser, String contentDisposition) {
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";"); //따옴표로  구분하고 
		System.out.println(contentSplitStr[2]);
		int lastPathSeparatorIndex;
		if(browser.trim().equals("MSIE")) { //크롬이 아닐 경우
			lastPathSeparatorIndex = contentSplitStr[2].lastIndexOf("\\");
		}else { //크롬일 경우
			lastPathSeparatorIndex = contentSplitStr[2].indexOf("\"");
		}
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		uploadFileName = contentSplitStr[2].substring(lastPathSeparatorIndex + 1, lastQutosIndex);
		return uploadFileName;
		
	}	

/*
//IE ver.
	private String getUploadFileName(String contentDisposition) {
		// TODO Auto-generated method stub
		System.out.println(contentDisposition);
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");
		int lastPathSeparatorIndex = contentSplitStr[2].lastIndexOf("\\");
		int lastQutosIndex=contentSplitStr[2].lastIndexOf("\"");
		uploadFileName=contentSplitStr[2].substring(lastPathSeparatorIndex + 1, lastQutosIndex);
		return uploadFileName;
		
*/
		private String getBrowser(HttpServletRequest request) {
			String header = request.getHeader("User-Agent");
			if(header != null) {
				if(header.indexOf("Trident") > -1) {	//indexOf()안에 적은 값이 나오면  header안에 그 값이 있다는 뜻. 없으면 -1
					return "MSIE";
				}else if(header.indexOf("Chrome") > -1) {
					return "Chrome";
				}else if(header.indexOf("Opera") > -1) {
					return "Opera";
				}else if(header.indexOf("iPhone") > -1
						&& header.indexOf("mobile") > -1) {
					return "iPhone";
				}else if(header.indexOf("Android") > -1
						&& header.indexOf("Mobile") > -1) {
					return "Android";
				}
			}
			return "FireFox";
		}
	
	}	

	

