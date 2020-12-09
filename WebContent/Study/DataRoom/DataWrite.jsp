<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../common/isLogin.jsp" %> --%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/BoardHead.jsp"/>

<body>
<div class="container-flude">
  <div class="row">   
    <jsp:include page="../common/BoardTop.jsp"/>
  </div>
  <div class="row">   
    <jsp:include page="../common/BoardLeft.jsp"/>
    <div class="col-9 pt-3">
      <!-- 게시판 body 시작 -->    
      <h3>게시판-<small>글쓰기</small></h3>
      <script>
//        내가해보던거
//        function checkValidate(fm) {
//          var elements = fm.getElementsByTagName('input');
//          for (var i) {
            
//            if(ele)
//          }
//        }
        function checkValidate(fm) {
          if(fm.title.value==""){
            alert("제목을입력하세욬");
            fm.title.focus();
            return false;
          }
          if(fm.content.value==""){
            alert("내용을입력하세욬");
            fm.content.focus();
            return false;
          }
        }
      </script>
      <form name="writeFrm" method="post" action="../DataRoom/DataWrite" 
          onsubmit="return checkValidate(this);" enctype="multipart/form-data">
        <div class="row mt-3 mr-1">
          <table class="table table-bordered table-striped">
              <colgroup>
                <col width="20%"/>
                <col width="*"/>
              </colgroup>
              <tbody>
              <tr>
                  <th class="text-center"
                    style="vertical-align:middle;">작성자</th>
                  <td>
                    <input type="text" class="form-control" 
                      name="name" />
                  </td>
                </tr><tr>
                  <th class="text-center"
                    style="vertical-align:middle;">비밀번호</th>
                  <td>
                    <input type="text" class="form-control" 
                      name="pass" />
                  </td>
                </tr>
                <tr>
                  <th class="text-center"
                    style="vertical-align:middle;">제목</th>
                  <td>
                    <input type="text" class="form-control" 
                      name="title" />
                  </td>
                </tr>
                <tr>
                  <th class="text-center"
                    style="vertical-align:middle;">내용</th>
                  <td>
                    <textarea rows="10" 
                      class="form-control" name="content"></textarea>
                  </td>
                </tr>
               <tr>
                 <th class="text-center"
                   style="vertical-align:middle;">첨부파일</th>
                 <td>
                   <input type="file" class="form-control" name="attachedfile" />
                 </td>
               </tr>
              </tbody>
          </table>
        </div>
        <div class="row mb-3">
          <div class="col text-right">
            <!-- 각종 버튼 부분 -->
            <!-- <button type="button" class="btn">Basic</button> -->
            <!-- <button type="button" class="btn btn-primary" 
              onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
            <!-- <button type="button" class="btn btn-secondary">수정하기</button>
            <button type="button" class="btn btn-success">삭제하기</button>
            <button type="button" class="btn btn-info">답글쓰기</button>
            <button type="button" class="btn btn-light">Light</button>
            <button type="button" class="btn btn-link">Link</button> -->
            <button type="submit" class="btn btn-danger">전송하기</button>
            <button type="reset" class="btn btn-dark">Reset</button>
            <button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
          </div>
        </div>
      </form>
      <!-- 게시판 body 종료 -->    
    </div>
  </div>
  <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
  <jsp:include page="../common/BoardBottom.jsp"></jsp:include>

</div>
</body>
</html>