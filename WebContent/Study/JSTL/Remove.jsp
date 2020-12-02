<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h2>remove태그</h2>
<c:set var="pageVar" value="페이지영역" />
<c:set var="pageVar" value="리퀘스트영역1번" scope="request"/>
<c:set var="reqeustVar" value="리퀘스트영역2번" scope="request"/>
<c:set var="sessionVar" value="세션영역" scope="session"/>
<c:set var="appVar" value="어플리케이션 영역" scope="application"/>

<h3>삭제전 출력</h3>
페이지: ${pageVar } <br />
리퀘스트영역1: ${requestScope.pageVar } <br />
리퀘스트영역2: ${reqeustVar } <br />
세션영역: ${sessionVar } <br />
어플리케이션: ${appVar } <br />



<h3>remove로 삭제</h3>
<c:remove var="requestVar" scope="session" />

<h3>영역이 다른 속성명 삭제후 출력</h3>
페이지: ${pageVar } <br />
리퀘스트영역1: ${requestScope.pageVar } <br />
리퀘스트영역2: ${reqeustVar } <br />
세션영역: ${sessionVar } <br />
어플리케이션: ${appVar } <br />

<h3>remove로 삭제</h3>
<c:remove var="pageVar" scope="session" />
<h3>스코프 미지정 후 같은 속성명 삭제후 출력</h3>
페이지: ${pageVar } <br />
리퀘스트영역1: ${requestScope.pageVar } <br />
리퀘스트영역2: ${reqeustVar } <br />
세션영역: ${sessionVar } <br />
어플리케이션: ${appVar } <br />
</body>
</html>