<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String saveDirectory = application.getRealPath("/Study/FileUpload");
File file = new File(saveDirectory);
File[] fileList = file.listFiles();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>업로드된 파일 리스트 보기</h2>
<ul>
  <%
  int fileCnt = 1;
  for(File f:fileList){
  %>
	<li>
	 파일명: <%=f.getName() %>
	 파일크기: <%=(int)Math.ceil(f.length()/1024.0) %>kb
	 <a href="Download1.jsp?fileName=<%=URLEncoder.encode(f.getName(), "UTF-8") %>">[다운로드1-1]</a>
	</li>
	<%
	 fileCnt++;
  }
	%>
</ul>
</body>
</html>