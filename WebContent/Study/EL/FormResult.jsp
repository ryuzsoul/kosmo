<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>파라미터 값 받기</h2>
<h3>JSP로 받기</h3>
<ul>
	<li>이름: <%=request.getParameter("name") %></li>
	<li>성별: <%=request.getParameter("gender") %></li>
	<li>관심사항:
<%
String[] inters = request.getParameterValues("inter");
for(String s : inters){
	out.println(s+" ");
}
%>
  </li>
	<li>학력: <%=request.getParameter("grade") %></li>
  
</ul>

<h3>EL로 받기</h3>
<ul>
	<li>이름: ${param.name }</li>
	<li>성별: ${param.gender }</li>
	<li>관심사항: 
	 <c:forEach items="${paramValues.inter }" var="s">
	   ${s }&nbsp;
	 </c:forEach>
	</li>
	<li>학력: ${param.grade }</li>
</ul>
</body>
</html>