<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="smtp.SMTPAuth"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
SMTPAuth smtp = new SMTPAuth();

String mailContnets = "" 
+"<table>"
+"<tr>"
+"  <td>제목</td>"
+"  <td>"+request.getParameter("subject")+"</td>"
+"</tr>"
+"<tr>"
+"  <td>내용</td>"
+"  <td>"+request.getParameter("content")+"</td>"
+"</tr>"
+"<tr>"
+"  <td>이미지</td>"
+"  <td><img src=\"http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg\" /></td>"
+"</tr>"
+"</table>";

Map<String, String> emailContent = new HashMap<String, String>();
emailContent.put("from", request.getParameter("from"));
emailContent.put("to", request.getParameter("to"));
emailContent.put("subject", request.getParameter("subject"));
// emailContent.put("content", request.getParameter("content"));
emailContent.put("content", mailContnets);

if(request.getParameter("content")!=null){
	boolean emailResult = smtp.emailSending(emailContent);
	if(emailResult==true){
		out.print("메일발송성공");
	} else{
		out.print("메일발송실패");
	}
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h2>이메일 발송하기</h2>
<form method="post" name="mailForm">
<table border=1>
  <tr>  
    <td> 
      보내는사람 : 
      <input type="text" name="from" value="ryuzsoul@naver.com" />
    </td>
  </tr>
  <tr>  
    <td>
      받는사람 : 
      <input type="text" name="to" value="ryuzsoul@gmail.com" />
    </td>
  </tr>
  <tr>  
    <td>
      제목 : 
      <input type="text" name="subject" value="testes" />
    </td>
  </tr>
  <tr>
    <td>
      <textarea name="content" cols="30" rows="10">testes</textarea>
    </td>
  </tr>
  <tr>
    <td>
      <button type="submit">이메일발송</button>
    </td>
  </tr>
</table>
</form>
</body>

</html>