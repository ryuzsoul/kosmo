<%@page import="java.util.Vector"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>EL연산자</h2>
<h3>null연산</h3>

<%
// 자바에서는 에러, EL에서는 0으로 처리
// int a = null + 10;
// param.myNumber는 0으로 간주
// null과 비교연산 불가 false 반환

// jsp에서 선언한 변수 직접사용 불가->null로 인식
// 기본영역객체에 저장된 속성만 사용가능
// 문자열 덧셈 불가, "100"은 자동으로 숫자로 변경됨
// 나눗셈에 div, %연산에 mod
// 비교연산 compareTo()로 첫번째 문자부터 비교
// 문자열 비교시 ==의 형태로 비교
%>
\${null+10} : ${null+10 }
<br />
\${param.myNumber+10 } : ${param.myNumber+10 }
<br />

\${param.myNum>10 } : ${param.myNum>10 }
<br />
\${param.myNum<10 } : ${param.myNum<10 }
<br />

<h3>JSTL로 EL에서 사용할 변수 선언</h3>
<%
String varScriptlet = "스크림트렛 안에서 번수선언";
%>
\${varScriptlet +100 } : ${varScriptlet + 100 }
<br />
<c:set var="elVar" value="<%=varScriptlet %>" />
\${elVar } : ${elVar }

<!-- tomcat8부터 EL에서 변수할당 가능 -->
<h3>EL변수에 값 할당</h3>
<c:set var="fnum" value="9" />
<c:set var="snum" value="5" />
\${fnum=99 } : ${fnum=99 }

<h3>EL의 비교연산자</h3>
<c:set var="fnum" value="100" />
<c:set var="snum" value="99" />
<ul>
	<li>\${fnum>snum } : ${fnum>snum }</li>
	<li>\${100>99} : ${100>99}</li>
	<li>\${"JAVA"=='JAVA'} : ${"JAVA"=='JAVA'}</li>
	<li>\${"Java"=='JAVA'} : ${"Java"=='JAVA'}</li>
</ul>

<h3>논리연산자</h3>
\${5>=5 && 10!=10 } : ${5 ge 5 and 10 ne 10 }
<br />
\${5>6 || 10<100 } : ${5 gt 6 or 10 lt 100 }
<br />

<h3>삼항연산자</h3>
\${10 gt 9 ? "참" : "거짓" } : ${10 gt 9 ? "참" : "거짓" }

<h3>empty연산자: null일때 true 반환</h3>
<%
String nullStr = null;
String emptyStr = "";
Integer[] lengthZero = new Integer[0];
Collection sizeZero = new Vector();

%>
<c:set var="elnullStr" value="<%=nullStr %>" />
<c:set var="elemptyStr" value="<%=emptyStr %>" />
<c:set var="ellengthZero" value="<%=lengthZero %>" />
<c:set var="elsizeZero" value="<%=sizeZero %>" />
<ul>
	<li>\${empty elnullStr } : ${empty elnullStr }</li>
	<li>\${not empty elemptyStr } : ${not empty elemptyStr }</li>
	<li>${empty ellengthZero ? "배열크기0" : "배열크기0아님"}</li>
	<li>${empty elsizeZero ? " 컬렉션에저장된 객체있음" : "컬렉션에저장된 객체없음"}</li>
</ul>

</body>
</html>