<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String saveDirectory = application.getRealPath("/Study/FileUpload");
int maxPostSize = 1024*5000;
String encoding = "UTF-8";
FileRenamePolicy policy = new DefaultFileRenamePolicy();

MultipartRequest mr = null;
String name = null;
String title = null;
StringBuffer inter = new StringBuffer();
File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	mr= new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	String fileName = mr.getFilesystemName("chumFile1");
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	int idx = -1;
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	oldFile = new File(saveDirectory+oldFile.separator+fileName);
	newFile = new File(saveDirectory+oldFile.separator+realFileName);
	oldFile.renameTo(newFile);

	
	
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	for(String s: interArr){
		inter.append(s+",&nbsp;");
	}
} catch(Exception e){
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>파일업로드결과</h2>
<ul>
	<li>작성자:<%=name %></li>
	<li>제목:<%=title %></li>
	<li>관심사항:<%=inter %></li>
</ul>


<h2>첨부파일1</h2>
<ul>
	<li>원본파일명:<%=mr.getOriginalFileName("chumFile1") %></li>
	<li>서버에저장된파일명:<%=mr.getFilesystemName("chumFile1") %></li>
	<li>서버에저장된파일명:<%=realFileName %></li>
	<li>컨텐츠타입:<%=mr.getContentType("chumFile1") %></li>
	<li>파일크기:<%=(int)Math.ceil(mr.getFile("chumFile1").length() / 1024.0) %>kb</li>
	<li>이미지표현:<img src="../FileUpload/<%=mr.getFilesystemName("chumFile1") %>" width="200" /></li>
</ul>
<ul>
  <li>원본파일명:<%=mr.getOriginalFileName("chumFile2") %></li>
  <li>서버에저장된파일명:<%=mr.getFilesystemName("chumFile2") %></li>
  <li>컨텐츠타입:<%=mr.getContentType("chumFile2") %></li>
  <li>파일크기:<%=(int)Math.ceil(mr.getFile("chumFile1").length() / 1024.0) %>kb</li>
<%--   <li>이미지표현:<img src="../FileUpload/<%=mr.getFilesystemName("chumFile2") %>" width="200" /></li> --%>
  <li>이미지표현:<img src="../FileUpload/<%=realFileName %>" width="200" /></li>
</ul>

</body>
</html>