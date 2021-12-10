<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.File" %>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String fileName = request.getParameter("file_name");
 
 	String savePath = "upload"; 
 	ServletContext context = getServletContext();
 	String sDownloadPath = context.getRealPath(savePath);
 	String sFilePath = sDownloadPath + "\\" +  fileName;
 	byte b[] = new byte[4096];
 	FileInputStream in = new FileInputStream(sFilePath); //inputstream으로 파일 받음 
 	String sMimeType = getServletContext().getMimeType(sFilePath);
 	System.out.println("sMimeType>>>" + sMimeType);
 	
 	if(sMimeType == null)
 		sMimeType = "application/octet-stream";
 	
 	response.setContentType(sMimeType);
 	String agent = request.getHeader("User-Agent");
 	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident")>-1);
 	
 	if(ieBrowser) {
 		fileName = URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20");
 		//익스플로러는 파일경로에 쓰는 \ 를 인식 못함. 그래서 %20을 씀. 
 		//캐서 ie 용으로 쓸수있또록 \\를 %20으로 일괄 변경하라는 replaceAll 구문. 
 		
 	}else{
 		fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
 	}
 	
 	response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
 	
 	ServletOutputStream out2 = response.getOutputStream();
 	int numRead;
 	
 	while((numRead=in.read(b, 0, b.length)) != -1){
 		out2.write(b, 0, numRead);
 	}
 	out2.flush();
 	out2.close();
 	in.close();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>