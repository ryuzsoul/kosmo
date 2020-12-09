<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
  <c:when test="${param.mode=='edit' }">
    <c:set var="moveUrl" 
      value="/Study/DataRoom/DataEdit?idx=${param.idx }&nowPage=${requestScope.nowPage }" />
  </c:when>
  <c:otherwise>
    <c:set var="moveUrl" 
      value="/Study/DataRoom/DataDelete?idx=${param.idx }&nowPage=${nowPage }" />
  </c:otherwise>

</c:choose>
<script>
<c:choose>
<c:when test="${PASS_CORRECT}">
  alert("패스워드검증완료");
  location.href='<c:url value="${moveUrl}" />';
</c:when>
<c:otherwise>
alert("패스워드 검증실패, 뒤로이동");
history.back();
  </c:otherwise>

</c:choose>

</script>