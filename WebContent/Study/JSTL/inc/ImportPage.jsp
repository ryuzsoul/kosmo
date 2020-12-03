<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<h4>포함된 페이지(ImportPage.jsp)</h4>
<h5>리퀘스트 영역에 저장된 속성값</h5>
저장된값: ${requestVar }<br>
방법2: ${requestScope.requestVar}

<h5>파라미터로 전달된 값</h5>
1: ${param.user_id } 2:${param.user_pw }
