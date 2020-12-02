<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
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
<h2>+를 숫자가 아닌 문자열 연결에 사용시</h2>

<h2>특수문자가 포함된 속성에 .으로 접근시</h2>
\${header.user-agent } 에러
<br />
\${header["user-agent" } 정상

<h2>인덱스로 접근시 배열,리스트컬렉션</h2>
<%
String ms[] = {"한라산", "지리산"};
List list = new Vector();
for(String m: ms) list.add(m);
%>
<c:set var="elArray" value="<%=ms %>" />
<c:set var="elCollection" value="<%=list %>" />
<ul>
	<li>\${elArray[0] } 정상</li>
	<li>\${elCollection[0] } 정상</li>
	<li>\${elArray.0 } 500에러</li>
	<li>\${elArray.0 } 500에러</li>
</ul>

<h2>배열과 리스트계열 컬렉션 출력</h2>
<c:forEach items="${elArray }" var="m" >
  ${m }
</c:forEach>
<c:forEach items="${elCollection }" var="m" >
  ${m }
</c:forEach>

<h2>인덱스를 벗어난 경우</h2>
\${elArray[3] } 에러없고 미출력
<br />
\${elCollection[3] } 에러없고 미출력

<h2>없는 속성이거나, getter가 존재하지 않는 경우(자바빈)</h2>
<%
MemberDTO member = new MemberDTO("SUNG", "1234", "성길동", null);
%>
<c:set var="eldto" value="<%=member %>" />
<ul>
	<li>존재하지 않는 속성: \${eldto.addr } PropertyNotFoundException</li>
	<li>속성존재 getter 부재: \${eldto.id } 500에러</li>
	<li>el변수명 틀림: \${eldto.pwd } 에러없고 미출력</li>
</ul>

<h2>내장객체의 없는 속성으로 접근</h2>
\${requestScope.nop } 에러없고 미출력, 속성명은 개발자 마음대로 정할수 있어서
<br />
\${pageContext.nop } 컴파일오류, 내장객체명은 정해져 있어서


<h2>내장객체중 사용자가 정의한 속성에 접근하는 내장객체 및 맵컬렉션인 경우</h2>
<%
request.setAttribute("reqProperty", "리퀘스트영역저장");
Map map = new HashMap();
map.put("mapKey", "맵에 저장한 문자열");
%>
<c:set var="elMap" value="<%=map %>" />
<ul>
	<li>\${requestScope.reqProperty } 정상</li>
	<li>\${requestScope.REQProperty } 에러없이 미출력</li>
	<li>\${elMap.mapKey } 정상</li>
	<li>\${elMap.MAPkey } 에러없이 미출력</li>
</ul>

<h2>숫자를 0으로 나누면 무한</h2>

<h2>EL변수에 값 할당시 톰캣8부터는 정상, 이전버전은 에러</h2>
<c:set var="number" value="100" scope="request" />
데이터저장전: ${number }
<br />
데이터 저장후: ${number=1 }
</body>
</html>