<%@page import="java.util.List"%>
<%@page import="model.MyFileDAO"%>
<%@page import="model.MyfileDTO"%>
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


<h2>DB에 등록된 파일 리스트 보기</h2>
<a href="FileUploadMain.jsp">파일업로드</a>
<%
MyfileDTO dto = new MyfileDTO();
MyFileDAO dao = new MyFileDAO(application);
List<MyfileDTO> fileLists = dao.myfileList();
%>

<table border="1">
<% for(MyfileDTO f : fileLists){ %>
  <tr>
    <td><%=f.getIdx() %></td>
    <td><%=f.getName() %></td>
    <td><%=f.getTitle() %></td>
    <td><%=f.getInter() %></td>
    <td><%=f.getOfile() %></td>
    <td><%=f.getSfile() %></td>
    <td><%=f.getPostdate() %></td>
    <td>
      <a href="Donwload2.jsp?oName=<%=URLEncoder.encode(f.getOfile(), "UTF-8") %>&sName=<%=URLEncoder.encode(f.getSfile(), "UTF-8") %>">
   		  [다운로드]
 		  </a>
    </td>
  </tr>
<% } %>
</table>
</body>
</html>