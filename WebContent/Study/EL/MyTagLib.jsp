<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/MyTagLib.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>자바코드로 메소드 호출</h3>
MyTagLib.isNumber("100") => <%=MyTagLib.isNumber("100") %>
<br />
my:isNumber("100") => ${my:isNumber("100") }
<br />
my:isNumber("백20") => ${my:isNumber("백20") }


<h2>연습문제</h2>
  <h3>EL에서 getGender 함수 호출하기</h3>
  <pre>
    주민번호를 매개변수로 전달하면 성별을 판단하여 반환하는 메소드를
    EL에서 호출할수 있도록 절차대로 작성하시오.
    함수명 : getGender("123456-1000000") => 남자
         getGender("123456-2000000") => 여자
    클래스 : eltag.MyTagLib 하위에 메소드 생성
  </pre>

${my:getGender("123456-2000000") }
${my:getGender("123456-1000000") }
${my:getGender("123456-5000000") }
</body>
</html>