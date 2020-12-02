<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

BbsDAO dao = new BbsDAO(application);
int affected = dao.updateEdit(dto);
if(affected==1){
	response.sendRedirect("BoardView.jsp?num="+dto.getNum());
} else{
%>	
	<script>
	 alert('수정 실패');
	 history.go(-1);
	</script>
<%	
}
%>
