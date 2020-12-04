<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- 파일명 : Download1.jsp --%>
<%
request.setCharacterEncoding("UTF-8");

 
String root = request.getSession().getServletContext().getRealPath("/");
String savePath = root + "Study/FileUpload";

// 서버에 원본파일명을 저장해두었다가 다운시에 
String filename = request.getParameter("fileName"); 

String orgfilename = request.getParameter("fileName"); 


InputStream in = null;
OutputStream os = null;
File file = null;
boolean skip = false;
String client = "";

try{
  try{
    file = new File(savePath, filename);
    in = new FileInputStream(file);
  }
  catch(FileNotFoundException fe){
    skip = true;
  }

  // 사용자 웹브라우저 정보 반환
  client = request.getHeader("User-Agent");

  // 파일 다운로드를 위한 응답헤더 설정
  // 웹브라우저가 인식하지 못하는 컨텐츠타입을 응답헤더에 설정하면 다운로드 실행
  response.reset() ;
  response.setContentType("application/octet-stream");
  response.setHeader("Content-Description", "JSP Generated Data");

  if(!skip){
    
	  // 브라우저가 익스플로러일때 한글 파일명 처리
    if(client.indexOf("MSIE") != -1){
      response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
      // 다운로드시 원본파일명으로 변경 
    }else{
      orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
      response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
      response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
    } 
     
    response.setHeader ("Content-Length", ""+file.length() );
    
    os = response.getOutputStream();
    byte b[] = new byte[(int)file.length()];
    int leng = 0;
    
    // input스트림으로 파일내용을 읽어와서 output스트림으로 웹브라우저에 출력
    // 웹브라우저느느 해당파일의 MIME타입을 인시갛지 못하므로 다운로드창을 통해 파일을 다운로드 시킴
    while( (leng = in.read(b)) > 0 ){
      os.write(b,0,leng);
    }
  }else{
    response.setContentType("text/html;charset=UTF-8");
    out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
  }

  in.close();
  os.close();
}
catch(Exception e){
  e.printStackTrace();
}
%>
