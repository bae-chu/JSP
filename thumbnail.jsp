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
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		filename = multi.getFilesystemName(file);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	ParameterBlock pb = new ParameterBlock();
	pb.add(imagePath+"/"+filename);
	RenderedOp rOp = JAI.create("fileload",pb);
	
	BufferedImage bi = rOp.getAsBufferedImage();
	BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, 100, 100, null);
	File file = new File(imagePath+"/sm_"+filename);
	ImageIO.write(thumb, "jpg", file);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image thumbnail ex</title>
</head>
<body>
<%-- 
-원본이미지-<br>
<img src = "image/<%=filename %>"><p>
--%>

-썸네일이미지-<br>
<a href = "image/<%=filename %>"><img src="image/sm_<%=filename %>"></a>
<a href = "detailView.jsp?image=<%=URLEncoder.encode(filename, "utf-8") %>">
	<img src = "image/sm_<%=filename %>"></a>
</body>
</html>