<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<c:set var="reqeustVar" value="리퀘스트영역저장" scope="request" />
<h3>자바 코드로 리다이렉트</h3>
<%
response.sendRedirect(request.getContextPath()+"/Study/JSTL/inc/ImportPage.jsp?user_id="
		  +URLEncoder.encode("KOREA[한국]")+"&user_pw="+URLEncoder.encode("Fighting[화이팅]"));
%>

<h3>JSTL로 리다이렉트</h3>
<c:redirect url="/Study/JSTL/inc/ImportPage.jsp">
  <c:param name="user_id" value="KOREA[한국]" />
  <c:param name="user_pw" value="GERMANY[독일]" />
</c:redirect>
</body>
</html>