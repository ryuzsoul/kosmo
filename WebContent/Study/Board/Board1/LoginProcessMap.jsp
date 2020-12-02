<%@page import="model.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

MemberDAO dao = new MemberDAO(drv, url);

Map<String, String> maps = dao.getMemberMap(id, pw);
if(maps.get("id")!=null){
	session.setAttribute("USER_ID", maps.get("id"));
	session.setAttribute("USER_PW", maps.get("pass"));
	session.setAttribute("USER_NAME", maps.get("name"));
	response.sendRedirect("Login.jsp");
} else{
	request.setAttribute("ERROR_MSG", "회원이 아닙니다.");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>