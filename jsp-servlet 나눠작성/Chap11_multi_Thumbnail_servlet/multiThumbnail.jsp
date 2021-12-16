<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ServletContext context = request.getServletContext();
	String imagePath = context.getRealPath("image");
	int size = 10*1024*1024;
	String filename = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request,
									imagePath,
									size,
									"utf-8",
									new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();	//다중파일 업로드를 위해선 요 아래부터 while문 들어감. 	
		//아래 while문 부터는 <body>안으로 집어넣어 줌. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		while(files.hasMoreElements()){ //아래 String file 요기서부터 IMGIO 요기까지 파일 1개짜리 생성하는 구문임.
			//다른건 손 댈 필요없고, file 객체 겹치는 부분만 수정해 주면 됨. 
			
			String fileE = (String)files.nextElement();	//아래 File file = new File 이랑 객채 겹치니까 
			filename = multi.getFilesystemName(fileE);	//여기있는 file을 fileE(element)로 변경. 
						
			ParameterBlock pb = new ParameterBlock();
			pb.add(imagePath+"/"+filename);
			RenderedOp rOp = JAI.create("fileload",pb);
			
			BufferedImage bi = rOp.getAsBufferedImage();
			BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumb.createGraphics();
			g.drawImage(bi, 0, 0, 100, 100, null);
			File file = new File(imagePath+"/sm_"+filename);
			ImageIO.write(thumb, "jpg", file);			 
			//다중파일 업로드하고싶으면 나머지 부분을 묶어서 while로 돌려야되기때문에 위 덩어리는 body 밑으로 뺌
			%>

-썸네일이미지 ; 클릭하여 원본 보기 - <br>
<a href = "image/<%=filename %>"><img src="image/sm_<%=filename %>"></a>
<a href = "detailView.jsp?image=<%=URLEncoder.encode(filename, "utf-8") %>">
	<img src = "image/sm_<%=filename %>"></a>

<% //while문+catch는 파일 하나 생성하고+썸네일 표시하는데까지 표시해줘야하니까, 밑으로 뺌 (위에 썸네일이미지보기까지 while문으로 둘러쌈)
	
	} //while문이 썸네일 이미지 생성 부분까지 돌아가야되기때문에 while 괄호 여기까지 와야 함.
	
	}catch(Exception e){
		e.printStackTrace();
	}	//catch도 썸네일 이미지 생성부분까지 돌려야되기때문에 맨 밑으로 뺌. 
%>

</body>
</html>