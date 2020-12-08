<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// JNDI Java Naming and Directory Interface
// 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아서 참고하는 API
// 외부의 객체를 이름으로 찾아오기 위한 기술

// DBCP Database Connection Pool
// 커넥션 객체를 미리 만들어 풀에 저장하고 쓰고 반납
// DB의 부하를 줄이고 자원을 효율적으로 관리
// 게임에서는 풀링시스템이라는 용어로 사용


//커넥션풀을 사용하기 위한 절차
//InitialContext 객체 생성
Context initctx = new InitialContext(); 

//JNDI 서비스 구조의 초기 ROOT 디렉토리 접근
//톰갯의 루트디렉토리 java:comp/env 로 접근
Context ctx = (Context)initctx.lookup("java:comp/env"); 

//Server.xml에 등록한 네이밍을 lookup하여 DataSource를 얻어옴
//해당소스는 DB연결 정보를 가지고 있다
DataSource source = (DataSource)ctx.lookup("jdbc/myoracle"); 

//연결은 되어있고 가지고 오기만 한다
//커넥션풀에 톰캣이 생성해놓은 커넥션 개게를 가져온다
Connection conn = source.getConnection();


if(conn!=null) out.println("<h2>DBCP연결</h2>");
else out.println("<h2>DBCP실패</h2>");
//DB작업이 완료된 후에는 풀에 객체만 반납
conn.close();
%>

<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>