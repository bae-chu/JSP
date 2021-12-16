package vo;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class MultiThumbnailServlet
 */
@WebServlet("/MultiThumbnail")
public class MultiThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MultiThumbnailServlet() {
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
	
//		ServletContext context = request.getServletContext();
//		String imagePath = context.getRealPath("image"); 
//		위에 두줄 줄여서 아래 요거 한줄로 쓸 수 있음.
		String imagePath = request.getServletContext().getRealPath("/image");  
		System.out.println(imagePath);
		int size = 10*1024*1024;
		String filename = "";
		
		//원래있떤 try는 위에 throws가 대신 처리하기때문에 삭제해도 됨. 
		MultipartRequest multi = new MultipartRequest(request,
										imagePath,
										size,
										"utf-8",
										new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();	//다중파일 업로드를 위해선 요 아래부터 while문 들어감. 	
			ArrayList<String> list = new ArrayList<String>();
			//ArrayList를 <String>으로 받은 이유! 
			//저번에 작성할때는 받아줘야하는 변수가 여러개였잖음. filename1, filename2, name, subject 이런식으로 
			//근데 이번에 코드 짤때는 받아줘야하는 변수가 filename 딱 하나밖에 없기때문에, 
			//저번처럼 FileValue.java 만들어서 getter setter 해줘야 할 필요없이 
			//그냥 ArrayList<String> 으로 해서 받아주고 치우면 됨. 
			//만약에 하고싶으면 getter setter 셋팅해서 만들어도 무방함. 
			//이번에는 받아야 할게 하나밖에 없었기 때문에 <String>으로 받은 것 뿐. 
	
			while(files.hasMoreElements()){ //아래 String file 요기서부터 IMGIO 요기까지 파일 1개짜리 생성하는 구문임.
				//다른건 손 댈 필요없고, file 객체 겹치는 부분만 수정해 주면 됨. 
				
				String fileE = (String)files.nextElement();	//아래 File file = new File 이랑 객채 겹치니까 
				filename = multi.getFilesystemName(fileE); //여기있는 file을 fileE(element)로 변경. 
				System.out.println(filename);
				list.add(filename); //filename이 생성이 되면 list에다가 생성해줌. 
				
//				FileValue fv = new FileValue();	이걸 간단하게 줄여서 윗 문단과 같이 처리. 
//				fv.setFilename(multi.getFilesystemName(fileE));
//				list.addfilename);
							
				ParameterBlock pb = new ParameterBlock();
				pb.add(imagePath+"/"+filename);
				RenderedOp rOp = JAI.create("fileload", pb);
				
				BufferedImage bi = rOp.getAsBufferedImage();
				BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
				Graphics2D g = thumb.createGraphics();
				g.drawImage(bi, 0, 0, 100, 100, null);
				File file = new File(imagePath+"/sm_"+filename);
				ImageIO.write(thumb, "jpg", file);			 
				
				//위 구문까지 처리 다 끝냈으면, setAttribute 만들어주기. 
				
				request.setAttribute("thumbnailList", list);	
				
				//setAttribute 만들고나면 반드시 Dispatcher 만들어서 연결해줘야함. 
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("multiThumbnailView.jsp");
				dispatcher.forward(request, response);
				
				}
		}
}
