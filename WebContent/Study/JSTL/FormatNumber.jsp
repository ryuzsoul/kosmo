<%@page import="java.util.Currency"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap4 CDN -->
</head>
<body>
formatNumber태그
<c:set var="money" value="10000" />

el로 출력
money : ${money }

jstl 국제화 태그로 출력
money: <fmt:formatNumber value="${money }" />
jstl 국제화 태그로 출력 천단위 콤마 생략
money: <fmt:formatNumber groupingUsed="false" value="${money }" />

type="currency"" currencySymbol생략
<fmt:formatNumber value="${money }" type="currency" currencySymbol="$" />

type="percent"
<fmt:formatNumber value="0.02" type="percent" />

var속성 원하는 위치에 출력
<fmt:formatNumber value="${money }" type="currency" var="price" />
가격이 ${price }

자바코드로 1000단위 콤마 표시

<!-- 
NumberFormat클래스는 싱글턴패턴
이미 생성된 static형태의 객체를 방환받아 사용
 -->
<%
String moneyStr = pageContext.getAttribute("money").toString();
int money = Integer.parseInt(moneyStr);
NumberFormat nf = NumberFormat.getInstance();

out.println("천단위 콤마 찍기전");
out.println(money);

out.println("천단위 콤마 찍은후");
String commaMoney = nf.format(money);
out.println(commaMoney);

Currency currency = nf.getCurrency();
String currencySymbol = currency.getSymbol();
out.println("통화기호 추가");
out.println(currencySymbol + commaMoney);
%>
</body>
</html>