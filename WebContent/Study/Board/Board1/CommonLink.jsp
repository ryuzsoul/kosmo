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
	<h2>공통링크</h2>
	<table border="1" width="90%">
		<tr>
			<td>
				<% if(session.getAttribute("USER_ID")==null){ %>
				<a href="Login.jsp">로그인</a>
				<% } else{ %>
				<a href="Logout.jsp">로그아웃</a>
				<% } %>
				<a href="BoardList.jsp">회원제게시판1</a>
				<a href="BoardList2.jsp">회원제게시판2</a>
				<a href="DataList.jsp">자료실</a>
			</td>
		</tr>
	</table>
</body>
</html>