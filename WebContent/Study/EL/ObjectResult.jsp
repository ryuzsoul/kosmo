<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  <h2>EL의 param내장객체로 파라미터 읽기</h2>
  <h3>자바코드로 영역 및 파라미터 읽기</h3>
  영역에 저장된 값
<%
MemberDTO member = (MemberDTO)request.getAttribute("dtoObj");
%>
<ul>
	<li>memberDto객체:<%=String.format("아이디:%s, 비번:%s, 이름:%s",
			member.getId(), member.getPass(), member.getName()) %></li>
	<li>String객체: <%=request.getAttribute("strObj") %></li>
	<li>Integer객체: <%=request.getAttribute("integerObj") %></li>
</ul>

파라미터로 전달된 값 읽기
<%
int fNum = Integer.parseInt(request.getParameter("firstNum"));
int sNum = Integer.parseInt(request.getParameter("secondNum"));
%>
두 파리미터의 합: <%=fNum+sNum %>

<h3>EL로 영역과 파라미터로 전달된 값 읽기</h3>
영역에 저장된 값
<ul>
  <li>memberDto객체: 아이디:${dtoObj.id }, 비번:${dtoObj.pass }, 이름:${dtoObj.name }</li>
  <li>String객체: ${reqeustScope.strObj }</li>
  <li>Integer객체: ${integerObj }</li>
</ul>

파라미터로 전달된 값의 합
<ul>
	<li>${param.firstNum + param['secondNum'] }</li>
	<li>${param.firstNum} + ${param['secondNum'] }</li>
</ul>
</body>
</html>