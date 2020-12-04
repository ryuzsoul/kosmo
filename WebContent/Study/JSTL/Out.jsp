<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
out태그
<c:set var="htmlStr">
  <h3>h3태그로 감싼 문자열</h3>
</c:set>

escapeXml=ture기본값일때
<c:out value="${htmlStr }" escapeXml="ture" />
<br />
\${htmlStr }


<c:out value="${htmlStr }" escapeXml="false" />
<br />
\${htmlStr }

<!-- null 일때 default속성값 출력
""빈문자열인경우 출력안됨
 -->
<h3>default속성</h3>
<h4>값이 빈 문자열: 값이 있는 경우에 해당</h4>
출력: <c:out value="" default="값이 빈 문자열" />
<h4>값이 null인경우: 값이 없는 경우에 해당</h4>
출력: <c:out value="${null }" default="값이 null 인 경우" />


<h3>페이지 링크에 응용</h3>
<c:out value="/Study/Board/Board1/BoardList.jsp?nowPage=" /><c:out value="${null }" default="1" />
<!-- 한줄로 써야 공백이 안들어간다 -->
<a href="<c:url value='/Study/Board/Board1/BoardList.jsp?nowPage=' /><c:out value='${param.nowPage }' default='1' />">
  회원제 게시판 리스트
 </a>

</body>
</html>