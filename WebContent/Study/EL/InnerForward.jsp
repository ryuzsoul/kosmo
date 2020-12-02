<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap4 CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<h2>포워드된 페이지</h2>
<h3>자바코드를 통해 속성 읽기</h3>
<ul>
	<li>
	 pageContext.getAttribute("scopeVar"):<%=pageContext.getAttribute("scopeVar") %>
	</li>
	<li>
	 request.getAttribute("scopeVar"):<%=request.getAttribute("scopeVar") %>
	</li>
	<li>
	 session.getAttribute("scopeVar"):<%=session.getAttribute("scopeVar") %>
	</li>
	<li>
	 application.getAttribute("scopeVar"):<%=application.getAttribute("scopeVar") %>
	</li>
</ul>

<h3>각 영역에 저장된 속성 읽기</h3>
  <ul>
    <li>페이지 영역: ${pageScope.scopeVar }</li>
    <li>리퀘스트 영역: ${requestScope.scopeVar }</li>
    <li>세션 영역: ${sessionScope.scopeVar }</li>
    <li>어플리케이션 영역: ${applicaionScope.scopeVar }</li>
  </ul>
  
   <h3>xxxScope미지정 후 속성읽기</h3>
  <ul>
    <li>가장좁은 영역 읽음: ${scopeVar }</li>
    <li>위처럼 영역부분을 생략한 후 읽으면 가장 좁은 영역인 page영역이 읽힌다.</li>
  </ul>
</body>
</html>