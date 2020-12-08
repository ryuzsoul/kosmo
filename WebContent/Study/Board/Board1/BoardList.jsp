<%@page import="javax.management.Query"%>
<%@page import="util.PagingUtil"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

// BbsDAO dao = new BbsDAO(drv, url);
Map<String, Object> param = new HashMap<String, Object>();

BbsDAO dao = new BbsDAO();

String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
String queryStr="";
if(searchWord!=null){
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	queryStr += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}

// int totalRecordCount = dao.getTotalRecordCount(param);
int totalRecordCount = dao.getTotalRecordCountSearch(param);  //join적용 작성자 검색용

/* Pagination */
int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE")); 
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
// 파라미터가 없을때는 무조건 1페이지 지정, 값이 있을때는 페이지 값을 얻어옴
int nowPage = (request.getParameter("nowPage")==null || request.getParameter("nowPage").equals("")) ?
		1 : Integer.parseInt(request.getParameter("nowPage"));
int start = (nowPage-1)*pageSize+1; //한 페이지에 출력할 게시물 범위 지정
int end = nowPage * pageSize;
param.put("start", start);
param.put("end", end);

// List<BbsDTO> bbs = dao.selectList(param);
// List<BbsDTO> bbs = dao.selectListPage(param); // 페이지네이션 처리용
List<BbsDTO> bbs = dao.selectListSearch(param); // 페이지네이션+회원이름 검색
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
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<!-- 옵션에 따라 검색 설정 -->
						<select name="searchColumn" class="form-control">
							<option value="title" 
								<%=(searchColumn!=null && searchColumn.equals("title")) ? "selected" : "" %>>
								제목
							</option>
							<option value="content" 
								<%=(searchColumn!=null && searchColumn.equals("content")) ? "selected" : "" %>>
								내용
							</option>
							<option value="name" 
                <%=(searchColumn!=null && searchColumn.equals("name")) ? "selected" : "" %>>
                작성자
              </option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:20px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
<!-- 					<col width="60px"/> -->
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133);" class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
<!-- 					<th>첨부</th> -->
				</tr>
				</thead>
								
				<tbody>
<% 
if(bbs.isEmpty()){ //데이터가 없을때 true반환
%>
				<tr><td colspan="5" align="center">등록된 게시물이 없습니다.</td></tr>	
<%
} else{
	int vNum = 0;	//게시물 가상번호
	int countNum = 0;
	
// 	전체게시물수 108개
// 	페이지사이즈(web.xml에 10설정)
// 	현재 1페이지 일때
// 	 첫번째 게시물: 108-(((1-1)*10)+0)=108
// 	 두번째       : 108-(((1-1)*10)+1)=107
	for(BbsDTO dto : bbs){
// 		vNum = totalRecordCount--;
      vNum = totalRecordCount-(((nowPage-1)*pageSize)+countNum++);
%>
				<tr>
					<td><%=vNum %></td>
					<td><a href="BoardView.jsp?num=<%=dto.getNum() %>&nowPage=<%=nowPage %>&<%=queryStr %>"><%=dto.getTitle() %></a></td>
					<td><%=dto.getId() %></td>
					<td><%=dto.getPostDate() %></td>
					<td><%=dto.getVisitcount() %></td>
				</tr>
<%
	}
}
%>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
<!-- 					<button type="button" class="btn">Basic</button> -->
					<button type="button" class="btn btn-primary">
						<a href="BoardWrite.jsp">글쓰기</a>
					</button>
<!-- 					<button type="button" class="btn btn-secondary">수정하기</button> -->
<!-- 					<button type="button" class="btn btn-success">삭제하기</button> -->
<!-- 					<button type="button" class="btn btn-info">답글쓰기</button> -->
<!-- 					<button type="button" class="btn btn-warning">리스트보기</button> -->
<!-- 					<button type="button" class="btn btn-danger">전송하기</button> -->
<!-- 					<button type="button" class="btn btn-dark">Reset</button> -->
<!-- 					<button type="button" class="btn btn-light">Light</button> -->
<!-- 					<button type="button" class="btn btn-link">Link</button> -->
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<%=PagingUtil.pagingBS4(totalRecordCount, pageSize, blockPage, nowPage, "BoardList.jsp?"+queryStr) %>
						
<!-- 						(게시물전체개수, 한페이지에 출력할 게시물, 한블록에 표시할 페이지, 현재페이지번호, 실행 파일명) -->
<!-- 						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link">1</a></li>     -->
<!--             <li class="page-item active"><a href="#" class="page-link">2</a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link">3</a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link">4</a></li>     -->
<!--             <li class="page-item"><a href="#" class="page-link">5</a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li> -->
<!--             <li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li> -->
					</ul>
				</div>				
			</div>
			<div class="text-center">
					<%=PagingUtil.pagingTxt(totalRecordCount, pageSize, blockPage, nowPage, "BoardList.jsp?"+queryStr) %>
			</div>
			<!-- 게시판 body 종료 -->		
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="../common/BoardBottom.jsp"></jsp:include>

</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

	아~~~~힘들다...ㅋ
 -->