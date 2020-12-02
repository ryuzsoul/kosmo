<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String queryStr="";
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
String nowPage = request.getParameter("nowPage");
if(searchWord!=null){
	queryStr += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}
queryStr += "nowPage="+nowPage;

String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);
dao.updateVisitCount(num);
BbsDTO dto = dao.selectView(num);
dao.close();
%>
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
			<h3>게시판-<small>상세보기</small></h3>
			
      <div class="row mt-3 mr-1">
        <table class="table table-bordered">
        <colgroup>
          <col width="20%"/>
          <col width="30%"/>
          <col width="20%"/>
          <col width="*"/>
        </colgroup>
        <tbody>
          <tr>
            <th class="text-center table-active align-middle">아이디</th>
            <td><%=dto.getId() %></td>
            <th class="text-center table-active align-middle">작성일</th>
            <td><%=dto.getPostDate() %></td>
          </tr>
          <tr>
            <th class="text-center table-active align-middle">작성자</th>
            <td><%=dto.getName()%></td>
            <th class="text-center table-active align-middle">조회수</th>
            <td><%=dto.getVisitcount() %></td>
          </tr>
          <tr>
            <th class="text-center table-active align-middle">제목</th>
            <td colspan="3">
              <%=dto.getTitle() %>
            </td>
          </tr>
          <tr>
            <th class="text-center table-active align-middle">내용</th>
            <td colspan="3" class="align-middle" style="height:200px;">
               <%=dto.getContent().replace("\r\n", "<br />") %>
            </td>
          </tr>          
        </tbody>
        </table>
      </div>
      <div class="row mb-3">
        <div class="col-6">
<%    
// author only use for
if(session.getAttribute("USER_ID")!=null &&
    session.getAttribute("USER_ID").toString().equals(dto.getId())){
%>    
          <button type="button" class="btn btn-secondary"
            onclick="location.href='BoardEdit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
          <button type="button" class="btn btn-success"
            onclick="isDelete();">삭제하기</button>
<%
}
%>
        </div>
        <div class="col-6 text-right pr-5">         
          <button type="button" class="btn btn-warning" 
              onclick="location.href='BoardList.jsp?<%=queryStr %>';">리스트보기</button>
        </div>  
      </div>
<form name="deleteFrm">
  <input type="hidden" name="num" value="<%=dto.getNum() %>" />
</form>
<script>
function isDelete() {
	var c=confirm('삭제할까요?');
	if(c){
		var f=document.deleteFrm;
		f.method='post';
		f.action='DeleteProc.jsp';
		f.submit();
	}
}
</script>
			
			<!-- 게시판 body 종료 -->		
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/BoardBottom.jsp"></jsp:include>

</div>
</body>
</html>
