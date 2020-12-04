<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- var속성 미지정시 해당위치에 바로 출력 -->
<h3>Var속성 미지정</h3>
<c:url value="/Study/JSTL/inc/ImportPage.jsp">
  <c:param name="user_id" value="Gasan" />
  <c:param name="user_pw">Digital</c:param>
</c:url>

<h3>속성지정</h3>
<c:url value="/Study/JSTL/inc/ImportPage.jsp" var="url">
  <c:param name="user_id" value="World" />
  <c:param name="user_pw">메르디앙2차</c:param>
</c:url>

<h3>속성 지정후 원하는 위치에 url설정</h3>
<a href="${url }">Import.jsp바로가기</a>


<h3>HTML태그에 직접 경로지정</h3>
<a href="<c:url value='/Study/JSTL/inc/ImportPage.jsp?user_id=Lee&user_pw=7777' />">
  ImportPage.jsp바로가기
</a>


<h3>DB응용하기</h3>
<c:url value="/Study/JSTL/inc/ImportPage.jsp" var="makeUrl">
<%
String id = request.getParameter("id");
String paramId = "", paramPass = "", paramName = "";
if(id != null){
	MemberDAO dao = new MemberDAO();
	Map<String, String> maps = dao.getMemberMap(id);
	paramId = maps.get("id");
	paramName = maps.get("name");
	paramPass = maps.get("pass");
%>
  <c:param name="user_id" value="<%=paramId %>" />
  <c:param name="user_pass" value="<%=paramPass %>" />
  <c:param name="user_name" value="<%=paramName %>" />

<%
}
%>
</c:url>
아이디의 정보를 가져와서 뿌려줌
DB연동한 URL: ${makeUrl }
</body>
</html>