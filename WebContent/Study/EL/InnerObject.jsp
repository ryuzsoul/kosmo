<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopeVar", "페이지영역");
request.setAttribute("scopeVar", "리쿼스트영역");
session.setAttribute("scopeVar", "세션영역");
application.setAttribute("scopeVar", "에플리케이션영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!--
영역에 저장된 속성 접근시
  xxxScope.속성명 xxxScope['속성명']
  속성명이 유일할 경우 내장객체 생략 가능
  속성명이 동일하면 작은 scope의 속성 로드
 -->
  <h2>EL에서 내장객체사용하기 scope계열</h2>
  <h3>각 영역에 저장된 속성 읽기</h3>
  <ul>
    <li>페이지 영역: ${pageScope.scopeVar }</li>
  	<li>페이지 영역: ${scopeVar }</li>  <!-- 내장객체 생략가능 -->
  	<li>리퀘스트 영역: ${requestScope.scopeVar }</li>
  	<li>세션 영역: ${sessionScope.scopeVar }</li>
  	<li>어플리케이션 영역: ${applicaionScope.scopeVar }</li>
  </ul>
  
  <h3>xxxScope미지정 후 속성읽기</h3>
  <ul>
  	<li>가장좁은 영역 읽음: ${scopeVar }</li>
  	<li>위처럼 영역부분을 생략한 후 읽으면 가장 좁은 영역인 page영역이 읽힌다.</li>
  </ul>
  
  <jsp:forward page="InnerForward.jsp" />
</body>
</html>