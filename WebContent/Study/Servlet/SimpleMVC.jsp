<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap4 CDN -->
</head>
<body>
<h2>MVC패턴</h2>
<pre>
사용자가 요청할 때 타입 파라미터에 따라 서블릿은 각각 다른 처리
클라이언트의 요청방식에 상관없이 메소드를 새로 정의하여 모든 요청 처리 구현

doGet() doPost()의 요청을 전달받기 위해서는 request response 객체를 매개변수로
예외처리를 동일하게 구현

서블릿클래스에서 application내장객체를 사용하기 위해
getServletContext()를 이용해서 얻어온다
</pre>
<ul>
	<li><a href="SimpleMVC">simpleMVC</a></li>
	<li><a href="SimpleMVC?type=greeting&id=test1&pw=1234">simpleMVC</a></li>
	<li><a href="SimpleMVC?type=date">simpleMVC</a></li>
	<li><a href="../Servlet/SimpleMVC?type=noparam">simpleMVC</a></li>
</ul>
<h3>요청결과</h3>
<span>${result }</span>
</body>
</html>