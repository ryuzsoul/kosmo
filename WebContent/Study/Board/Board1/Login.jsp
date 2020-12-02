<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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

<%@ include file="CommonLink.jsp" %>

<h2>로그인 페이지</h2>

<span style="color:red; font-size:1.5em;">		
	<%=request.getAttribute("ERROR_MSG")==null ?
		"" : request.getAttribute("ERROR_MSG") %>
</span>


<%
if(session.getAttribute("USER_ID")==null){
%>
	<script>
	function loginValidate(fn){
		if(!fn.user_id.value){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
		}
	}
	</script>
<!-- 	<form action="LoginProcessDTO.jsp" method="post" name="loginFrm" -->
	<form action="LoginProcessMap.jsp" method="post" name="loginFrm"
		onsubmit="return loginValidate(this);">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td> 
				<input type="text" name="user_id" tabindex="1" />
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="password" name="user_pw" tabindex="2" />
			</td>			
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="로그인하기" tabindex="4" />
			</td>			
		</tr>
	</table>		
	</form>
<% }else{ %>
	<!-- 로그인에 성공했을때 출력되는 화면 -->
	<table border='1'>
		<tr>
			<td style="text-align:center;">
				<%=session.getAttribute("USER_NAME") %> 회원님, 
					로그인 하셨습니다.
				<br />
				즐거운 시간 보내세요 ^^*
				<br />
				<a href="Logout.jsp">[로그아웃]</a>
			</td>
		</tr>
	</table>
<% } %>

</body>
</html>