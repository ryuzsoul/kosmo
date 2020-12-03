<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<h2>import태그</h2>
<c:set var="requestVar" value="리퀘스트영역" scope="request" />

<h3>var속성미지정 해당위치에 바로 삽입</h3>
<c:import url="./inc/ImportPage.jsp" >
  <c:param name="user_id">KOSMO</c:param>
  <c:param name="user_pw" value="9876" />
</c:import>



<h3>var속성 지정- 선언후 원하는 위치에 삽입</h3>
<c:import url="./inc/ImportPage.jsp" var="contents">
  <c:param name="user_id" value="HOng" />
  <c:param name="user_pw" value="9876" />
</c:import>

<h3>import선언은 위에서 삽입은 아래에서 처리</h3>
${contents }


<h3>외부에 있는 내용 삽입</h3>
<iframe src="./inc/ImportNate.jsp" frameborder="1" style="width:100%; height:500px"></iframe>
</body>
</html>