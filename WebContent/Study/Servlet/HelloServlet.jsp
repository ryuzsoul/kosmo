<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>서블릿만들기</h2>
<pre>
1.서블릿을 호출하기 위한 요청명 결정
  상대경로이므로 컨텍스트루트와는 무관
2.web.xml에서 서블릿 매핑, 패키지 포함 클래스명으로 지정
  url-pattern 속성에 경로지정
3.java 요청을 처리할 클래스 생성

HttpServlet클래스를 상속받아 서블릿으로 정의한다
사용자의 요청을 받기 위해 doGet혹은 doPoast베소드를 오버라이딩
View(jsp파일)없이 서빌릿에서 내용을 출력하고자 할때
컨텐츠타입을 지정한 후 출력할 내용을  print()를 통해 출력
</pre>
<h3></h3>
<a href="./NoJSPServlet.do">
  JSP파일없이 화면에 결과출력(Servlet에서 바로 출력)-상대경로
</a>
<a href="/Study/Servlet/NoJSPServlet.do">절대경로</a>

<h3>HelloServlet</h3>
<pre>
web.xml에서 매핑후
그에 맞는 클래스에서 포워드로 리퀘스트 전달

</pre>
${message } - ${HELLO }
<%=request.getAttribute("message") %>
<a href="HelloServlet.do">JSP에서 출력</a>


<h3>@WebServlet 어노테이션으로 서블릿 매핑</h3>
<a href="./AnnoWebServlet.do">Annowebservlet.do바로가기</a>


<h3>어노테이션을 이용한 간단한 계산기</h3>
  <form method="get" action="<%=request.getContextPath()%>/Study/Servlet/Cal.kosmo">
    <input type="text" name="firstNum" size="5" />
    <select name="operator">
      <option value="+">+</option>
      <option value="-">-</option>
      <option value="*">*</option>
      <option value="/">/</option>      
    </select>
    <input type="text" name="secondNum" size="5" />
    <input type="submit" value="연산결과는?" />
    <h4 style="color:red; font-size:1.5em;">
      ${calResult }   
    </h4>
  </form>

</body>
</html>