<%@page import="java.util.StringTokenizer"%>
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
</head>
<body>
<pre>
확장 for문
배열이나 컬렉션에서 값을 순차적으로 접근할 때 사용
varStatus는 인덱스ㅐ부터 시작
필수속성으로 items와 var이 있다
</pre>

<h2>확장for문형태의 forEach태그</h2>
<%
String[] colors = {"red", "green", "blue", "#573838"};
%>
<h3>JSP코드로 배열 출력</h3>
<% for(String c: colors){ %>
  <h4 style="color:<%=c %>;">JSP코드 출력</h4>
<% } %>

<h3>JSTL EL로 출력</h3>
<c:set var="colors" value="<%=colors %>" />
<c:forEach items="${colors }" var="c">
  <h4 style="color:${c};">JSTL로 출력</h4>
</c:forEach>

<h3>varStatus속성 알아보기</h3>
<c:forEach items="${colors }" var="c" varStatus="loopStatus">
  <h4>${loopStatus.count }번째 반복</h4>
  <ul>
  	<li>index: ${loopStatus.index }</li>
  	<li>first: ${looptSatus.first }</li>
  	<li>last: ${loopStatus.last }</li>
  	<li>current: ${loopStatus.current }</li>
  </ul>
</c:forEach>

<h3>리스트 계열의 컬렉션</h3>
<%  
List<MemberDTO> lists = new Vector();
lists.add(new MemberDTO("hong", "1111", "홍씨", null));
lists.add(new MemberDTO("park", "2222", "박씨", null));
lists.add(new MemberDTO("sung", "3333", "성씨", null));
%>
<c:set var="lists" value="<%=lists %>" />

<h3>일반 for문 형태의 JSTL의 forEach태그</h3>
<ul>
  <c:forEach begin="0" end="${lists.size()-1 }" var="i">
	<li>
	 아이디:${lists[i].id },
	 패스워드:${lists[i].pass },
	 이름:${lists[i].name },
	</li>
	</c:forEach>
</ul>

<h3>확장for 문형태의 jSTL forEach태그</h3>
<ul>
  <c:forEach items="${lists }" var="list">
  <li>
   아이디:${list.id },
   패스워드:${list.pass },
   이름:${list.name },
  </li>
  </c:forEach>
</ul>



<h3>맵계열 컬렉션 사용</h3>
<%
Map maps = new HashMap();
maps.put("first", lists.get(0));
maps.put("second", lists.get(1));
maps.put("third", lists.get(2));
%>
<c:set var="maps" value="<%=maps %>" />

<h4>키값을 알고 있을때 EL변수, 키값 혹은 EL변수["키값"]</h4>
<ul>
	 <li>
   아이디:${maps.first.id },
   패스워드:${maps.first.pass },
   이름:${maps.first.name },
  </li>
</ul>

<h4>키값을 모를때 확장for문 사용</h4>
<ul>
  <c:forEach items="${maps }" var="map">
  <li>
    키값:${map.key },
   아이디:${map.value.id },
   패스워드:${map.value.pass },
   이름:${map.value.name },
  </li>
  </c:forEach>
</ul>


<h2>forTokens태그</h2>
  <%
  String colorss = "red,green,blue,gray";
  StringTokenizer tokens = new StringTokenizer(colorss, ",");
  out.println("<h3>StringTokenizer클래스사용</h3>");
  out.println("<h4>토큰수:"+tokens.countTokens()+"</h4>");
  while(tokens.hasMoreElements()){
	  String token = tokens.nextToken();
	  out.println("<h5 style='color:"+token+"'>토큰</h5>");
  }
  
  String[] colorArr = colorss.split(",");
  out.println("<h3>String클래스 사용</h3>");
  for(String color: colorArr){
	  out.println("<h5 style='color:"+color+"'>TOKEN</h5>");
  }
%>
<h3>JSTL forToken태그 사용</h3>
<c:forTokens items="<%=colorss %>" delims="," var="color">
  <h5 style="color:${color };">JSTL</h5>
</c:forTokens>
</body>
</html>