
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="model.MemberDTO"%>
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
<h2>set 태그</h2>
1.value 속성에 직접 값 대입
<c:set var="directVar" value="100" />
<br />
2.value 속성에 EL로 값 대입
<c:set var="elVar" value="${directVar mod 5 }" />
<br />
3.value 속성에 표현식으로 값 대입
<c:set var="expVar" value="<%=new Date() %>" />
4.시작태그와 종료태그 사이에 값 설정
<c:set var="betweenVar">변수값 설정</c:set>

<h2>set태그로 설정한 데이터 표현시그올 출력</h2>  
directVar: <%=pageContext.getAttribute("directVar") %>
elVar: <%=pageContext.getAttribute("elVar") %>
expVar: <%=pageContext.getAttribute("expVar") %>
betweenVar: <%=pageContext.getAttribute("betweenVar") %>

<h3>EL로 출력</h3>
directVar: ${pageScope.directVar }
elVar: ${pageScope.elVar }
expVar: ${pageScope.expVar }
betweenVar: ${pageScope.betweenVar }


<h2>인자생성자로 설정</h2>
<c:set var="argsMember" value='<%=new MemberDTO("KIM", "1111", "김태희", null) %>' scope="request" />

<h3>jsp코드로 출력</h3>
아이디: <%=((MemberDTO)request.getAttribute("argsMember")).getId() %>
이름: <%=((MemberDTO)request.getAttribute("argsMember")).getName() %>

<h3>EL로 출력</h3>
아이디: ${requestScope.argsMember.id }
<br />
이름: ${argsMember.name }


<h3>target속성과 property속성</h3>
<c:set var="defaultMember" value="<%=new MemberDTO() %>" scope="request" />
<c:set target="${defaultMember }" property="id" value="Jung" />
<c:set target="${defaultMember }" property="pass" value="1234" />
<c:set target="${defaultMember }" property="name" value="정지훈" />

<h3>속성설정 후 출력</h3>
아이디: ${requestScope.defaultMemeber.id }
아이디: ${defaultMemeber.pass }
아이디: ${defaultMemeber.name }


<h2>리스트 컬렉션 이용하기</h2>
<%
List list = new Vector();
list.add(request.getAttribute("defaultMemeber"));
list.add(request.getAttribute("argsMember"));
%>

<h4>1.set태그로 리스트계열 컬렉션 설정</h4>
<c:set var="list" value="<%=list %>" scope="request" />

<h4>target property 속성으로 미설정 후 출력</h4>
아이디: ${requestScope.list[0].id }
비번: ${requestScope.list[0].pass }
이름: ${requestScope.list[0].name }

<h4>2.target property 속성으로 속성값 변경</h4>
<%-- <c:set target="${list[0] }" property="id" value="BTS" /> --%>
<%-- <c:set target="${list[0] }" property="pass" value="0000" /> --%>
<%-- <c:set target="${list[0] }" property="name" value="방탄소년단" /> --%>

<h3>속성설정 후 출력</h3>
아이디: ${requestScope.list[0].id }
비번: ${list[0].pass }
이름: ${list[0].name }

<h2>맵컬렉션 이용하기</h2>
<%
Map map = new HashMap();
map.put("def", request.getAttribute("defaultMemeber"));
map.put("args", request.getAttribute("argsMemeber"));
%>

<h4>1단계: set태그로 맵컬렉션 설정</h4>
<c:set var="map" value="<%=map %>" scope="request" />

<h4>2단계: target 및 property 속성으로 속성값 설정</h4>
<%-- <c:set target="${map.args }" property="id" value="AOA" /> --%>
<%-- <c:set target="${map.args }" property="pass" value="7777" /> --%>
<%-- <c:set target="${map.args }" property="name" value="설현" /> --%>

<h4>속성값 변경후 출력</h4>
아이디: ${map.args.id }
아이디: ${map.args.pass }
아이디: ${map.args.name }
</body>
</html>