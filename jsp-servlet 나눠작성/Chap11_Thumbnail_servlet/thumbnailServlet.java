package vo;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class thumbnailServlet
 */
@WebServlet("/thumbnail")
public class thumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thumbnailServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String imagePath = request.getServletContext().getRealPath("image"); //경로 지정해주고
		int size = 10*1024*1024;
		String filename = "";
		
		//원래있던 try, catch 지우고 
		
		MultipartRequest multi = new MultipartRequest(request,
										imagePath,
										size,
										"utf-8",
										new DefaultFileRenamePolicy());
			
		Enumeration files = multi.getFileNames();
		String fileE = (String)files.nextElement();
		filename = multi.getFilesystemName(fileE); 
		//아래 File file = new File 이랑 겹치니  위 변수 fileE로 변경해줌. 
	
		ParameterBlock pb = new ParameterBlock();
		pb.add(imagePath+"/"+filename);
		RenderedOp rOp = JAI.create("fileload",pb);
		
		BufferedImage bi = rOp.getAsBufferedImage();
		BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi, 0, 0, 100, 100, null);
		File file = new File(imagePath+"/sm_"+filename);	// 요기 file 중복되서 겹침 
		ImageIO.write(thumb, "jpg", file);
			
		//thumbnailView.jsp랑 연결해주기 위해 attribute 만들어줌. 
		
		//여기서 중요한건 filename!!!!! 변수!!!!!! 
		
		request.setAttribute("filename", filename);
		
		//이 코드는 단일업로드고, 작성자 제목 이런거 없이 파일도 딱 하나만 보내니까 리스트 할 필요 없음. 
		//다른 코드는 여러개여서  ArrayList 받아서 add.list 했었는데 이건 그럴 필요 없음. 
		//그래서 그냥 filename만 보내주면 됨... 
		
		//딸랑 한 개기때문에 direct로도 보낼수있고 dispatcher로도 보낼 수 있음. 
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("thumbnailView.jsp");

		response.sendRedirect("thumbnailView.jsp?filename="+URLEncoder.encode(filename, "utf-8"));
		//sendRedirect는  attribute가 아니고 parameter로 보냄. 
		//서블릿에서는 direct로 parameter값을 보낼 수 있음. 
		
		//dispatcher로 옮기면 주소가 안바뀜. direct로 하면 주소가 바뀜. 그 차이 
	}

}
