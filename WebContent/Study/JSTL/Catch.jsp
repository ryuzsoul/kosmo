<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>catch태그</h2>
<c:set var="fnum" value="100" />
<c:set var="snum" value="0" />

<h3>에러가 안나는 경우: 에러내용이 저장 안됨</h3>

<h4>catch태그 밖에서 실행</h4>
fnum / snum : ${fnum/snum }
<c:catch var="errorMessage">
  fnum / snum : ${fnum/snum }
</c:catch>
<br />
에러내용: ${errorMessage }


<c:catch var="errorMessage">
  ${"100"+100 }
</c:catch>
</body>
</html>