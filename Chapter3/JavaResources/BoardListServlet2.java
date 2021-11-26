

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoradListServlet
 */
@WebServlet("/boardList1")
public class BoardListServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		String page = request.getParameter("page");
		String size = request.getParameter("size");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(page+" 페이지 게시판 목록 출력<br>");
		out.println("<script>");
		out.println("var page="+page+";");
		out.println("var list = 100;");
		out.println("var size ="+size+";");
		out.println("var pagesize=list/size;");
		out.println("for(var i=1; i<=size; i++){");
		out.println("document.write(i+(page-1)*size+'<br>')}");
		
		out.println("for(var i=1; i<=pagesize; i++){");
		out.println("if(i!="+page+")");
		out.println("document.write(\"<a href='boardList1?"
					+"page=\"+i+\"&size=\"+size+\"'>\"+i+\"</a> \");");
		out.println("else");
		out.println("document.write(i+\" \")}");
		out.println("</script>");	
		
	}
}
