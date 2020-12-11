<%@page import="util.JavascriptUtil"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/isLogin.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");

BbsDTO dto = new BbsDTO();
BbsDAO dao = new BbsDAO(application);
dto = dao.selectView(num);

String session_id = session.getAttribute("USER_ID").toString();
// String session_id = (String)session.getAttribute("USER_ID");
int affected = 0;
if(session_id.equals(dto.getId())){
	dto.setNum(num);
	affected = dao.delete(dto);
} else{
	JavascriptUtil.jsAlertBack("본인만 삭제가능합니다.", out);
	return;
}

if(affected==1){
	JavascriptUtil.jsAlertLocation("삭제되었습니다.", "BoardList.jsp", out);
} else{
	out.println(JavascriptUtil.jsAlertBack("삭제 실패"));
}
%>