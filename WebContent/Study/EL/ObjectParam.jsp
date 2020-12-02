<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
request.setAttribute("dtoObj", new MemberDTO("KOSMO", "1234", "코스모", null));
request.setAttribute("strObj", "문자열객체");
request.setAttribute("integerObj", new Integer(100));
%>

<jsp:forward page="ObjectResult.jsp">
  <jsp:param value="200" name="firstNum"></jsp:param>
  <jsp:param value="300" name="secondNum"/>
</jsp:forward>
</body>
</html>