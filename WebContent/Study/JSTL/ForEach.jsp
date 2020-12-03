<%@page import="javax.swing.event.ListSelectionEvent"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>일반 for문 형태의 forEach태그</h2>
<h3>JSTL 및 EL로 Hn태그 출력하기</h3>
<c:forEach begin="1" end="6" var="i">
  <h${i }>난 H${i }태그입니다.</h>h${i }>
</c:forEach>


<h3>varStatus속성</h3>
<c:forEach begin="3" end="5" var="i" varStatus="loop">
  <h4>${loop.count }번째 반복입니다</h4>
  <ul>
  	<li>index: ${loop.index }</li>
  	<li>first: ${loop.first }</li>
  	<li>last: ${loop.last }</li>
  	<li>current: ${loop.current }</li>
  </ul>
</c:forEach>

<h3>1에서 100까지 정수중 홀수의 합</h3>
<c:forEach begin="1" end="100" var="a">
  <c:if test="${a mod 2 ne 0 }">
    <c:set var="sum" value="${sum+a }" />
  </c:if>
</c:forEach>
합: ${sum }


<h3>중첩된 for문 활용하기</h3>
  <!-- 
  연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach와 if문을 
  활용하시오.
  1 0 0 0 0
  0 1 0 0 0
  0 0 1 0 0
  0 0 0 1 0
  0 0 0 0 1
  -->
  <h4>if문 사용하기</h4>
<c:forEach begin="1" end="5" var="i">
  <c:forEach begin="1" end="5" var="j">
	  <c:if test="${i==j}" var="print">1&nbsp;</c:if>
	  <c:if test="${not print }">0&nbsp;</c:if>
  </c:forEach>
  <br />
</c:forEach>

 <h4>choose문 사용하기</h4>
 <!-- JSTL 사이에 HTML 주석 사용시 에러가 날 수 있다, 태그도 에러난다-->
<c:forEach begin="1" end="5" var="i">
  <c:forEach begin="1" end="5" var="j">
    <c:choose>
      <c:when test="${i==j }">1</c:when>
      <c:otherwise>0</c:otherwise>
    </c:choose>
  </c:forEach>
  <br />
</c:forEach>


<h2>구구단 출력하기</h2>
  <!-- 
  시나리오] JSTL의 forEach문을 이용하여 구구단을 출력하시오.
    table태그를 사용해야 하고, 짝수행에 마우스 오버시 빨간색으로
    홀수행에 마우스 오버시 노란색으로 바뀌게 코드를 작성하시오.
   -->
<h3>JSTL로 출력하기</h3>

<table>
  <c:forEach begin="1" end="9" var="i">
		<tr>
		  <c:forEach begin="1" end="9" var="j">
			  <c:choose>
			    <c:when test="${i mod 2 ==0 }">
			      <td onmouseover="this.style.backgroundColor='yellow';" onmouseout="this.style.backgroundColor='white';">
			      ${i }X${j }=${i*j }
			      </td>
			    </c:when>
	        <c:otherwise>
		        <td onmouseover="this.style.backgroundColor='red';" onmouseout="this.style.backgroundColor='white';">
		        ${i }X${j }=${i*j }
		        </td>
	        </c:otherwise>
        </c:choose>
			</c:forEach>
		</tr>
	</c:forEach>
</table>


</body>
</html>