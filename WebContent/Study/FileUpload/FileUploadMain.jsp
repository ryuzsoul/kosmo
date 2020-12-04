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
<script type="text/javascript">
var isValidate = function(frm) {
	if(frm.title.value==""){
		frm.title.focus();
		return false;
	}
	if(frm.chumFile1.value==""){
		frm.chumFile1.focus();
		return false;
	}
}
</script>


  <h2>파일 업로드 폼(DB처리X)</h2>
  
  <h4 style="color:red;">${errorMessage }</h4>
  
  <a href="FileList.jsp">파일목록 바로가기</a>
  
  <form name="fileFrm" method="post" action="UploadProc.jsp" enctype="multipart/form-data"
      onsubmit="return isValidate(this);">
    
    작성자 : <input type="text" name="name" value="정우성" />
    <br />
    제목 : <input type="text" name="title" value="파일업로드 Test" />
    <br />
    관심사항 : 
      <input type="checkbox" name="inter" 
        value="정치" checked="checked" />정치
      <input type="checkbox" name="inter" 
        value="경제" checked="checked" />경제
      <input type="checkbox" name="inter" 
        value="문화" />문화
    <br />
    첨부파일1 :
      <input type="file" name='chumFile1' />
    <br />
    첨부파일2 : 
      <input type="file" name="chumFile2" />
    <br />
    <input type="submit" value="파일업로드GoGo" />
  </form>
  
  
  
  
  
<h2>파일 업로드 폼(DB처리X)</h2>
  
  <h4 style="color:red;">${errorMessage }</h4>
  
  <a href="FileList.jsp">파일목록 바로가기</a>
  
  <form name="fileFrm2" method="post" action="UploadProc2.jsp" enctype="multipart/form-data"
      onsubmit="return isValidate(this);">
    
    작성자 : <input type="text" name="name" value="정우성" />
    <br />
    제목 : <input type="text" name="title" value="파일업로드 Test" />
    <br />
    관심사항 : 
      <input type="checkbox" name="inter" 
        value="정치" checked="checked" />정치
      <input type="checkbox" name="inter" 
        value="경제" checked="checked" />경제
      <input type="checkbox" name="inter" 
        value="문화" />문화
    <br />
    첨부파일1 :
      <input type="file" name='chumFile1' />
    <br />
    첨부파일2 : 
      <input type="file" name="chumFile2" />
    <br />
    <input type="submit" value="파일업로드GoGo" />
  </form>
  
  
  
  
  <h2>파일 업로드 폼(DB처리X)</h2>
  
  <h4 style="color:red;">${errorMessage }</h4>
  
  <a href="FileList.jsp">파일목록 바로가기</a>
  
  <form name="fileFrm3" method="post" action="UploadProc3.jsp" enctype="multipart/form-data"
      onsubmit="return isValidate(this);">
    
    작성자 : <input type="text" name="name" value="정우성" />
    <br />
    제목 : <input type="text" name="title" value="파일업로드 Test" />
    <br />
    관심사항 : 
      <input type="checkbox" name="inter" 
        value="정치" checked="checked" />정치
      <input type="checkbox" name="inter" 
        value="경제" checked="checked" />경제
      <input type="checkbox" name="inter" 
        value="문화" />문화
    <br />
    첨부파일1 :
      <input type="file" name='chumFile1' />
    <br />
    <input type="submit" value="파일업로드GoGo" />
  </form>
</body>

</html>