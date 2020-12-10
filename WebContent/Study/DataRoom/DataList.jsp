<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/BoardHead.jsp" />

<body>
	<div class="container-flude">
		<div class="row">
			<jsp:include page="../common/BoardTop.jsp" />
		</div>
		<div class="row">
			<jsp:include page="../common/BoardLeft.jsp" />
			<div class="col-9 pt-3">
				<!-- 게시판 body 시작 -->
				<h3>
					자료실 - <small>모델2방식 서블릿 게시판</small>
				</h3>
        <h4>매핑확인용:${test }</h4>
				<div class="row">
					<!-- 검색부분 -->
					<form class="form-inline ml-auto">
						<div class="form-group">
							<!-- 옵션에 따라 검색 설정 -->
							<select name="searchColumn" class="form-control">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
						</div>
						<div class="input-group">
							<input type="text" name="searchWord" class="form-control" />
							<div class="input-group-btn">
								<button type="submit" class="btn btn-warning">
									<i class='fa fa-search' style='font-size: 20px'></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="row mt-3">
					<!-- 게시판리스트부분 -->
					<table class="table table-bordered table-hover table-striped">
						<colgroup>
							<col width="60px" />
							<col width="*" />
							<col width="120px" />
							<col width="120px" />
							<col width="80px" />
							<col width="60px" />
						</colgroup>
						<thead>
							<tr style="background-color: rgb(133, 133, 133);"
								class="text-center text-white">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>첨부</th>
							</tr>
						</thead>

						<tbody>
						<c:choose>
						  <c:when test="${empty lists }">
						    <tr>
                  <td colspan="6" align="center">등록된 게시물이 없습니다.</td>
                </tr>
						  </c:when>
						  <c:otherwise>
						    <c:forEach items="${lists }" var="row" varStatus="loop">
						      <tr>
						        <td>
						          ${map.totalCount - (((map.nowPage-1)*map.pageSize)+loop.index) }
						        </td>
						        <td>
						          <a href="../DataRoom/DataView?idx=${row.idx }&nowPage=${param.nowPage}">
						            ${row.title }
						          </a>
						        </td>
						        <td>${row.name }</td>
						        <td>${row.postdate }</td>
						        <td>${row.visitcount }</td>
						        <td align="center">
						          <c:if test="${not empty row.attachedfile }">
						            <a href="./Download?filename=${row.attachedfile }&idx=${row.idx}">
<!-- 						              <img src="../images/disk.png" width="20" alt="" /> -->
                          [D]
						            </a>
						          </c:if>
						        </td>
						      </tr>
						    </c:forEach>
						  </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col text-right">
						<!-- 각종 버튼 부분 -->
						<!--          <button type="button" class="btn">Basic</button> -->
						<button type="button" class="btn btn-primary">
							<a href="../DataRoom/DataWrite">글쓰기</a>
						</button>
						<!--          <button type="button" class="btn btn-secondary">수정하기</button> -->
						<!--          <button type="button" class="btn btn-success">삭제하기</button> -->
						<!--          <button type="button" class="btn btn-info">답글쓰기</button> -->
						<!--          <button type="button" class="btn btn-warning">리스트보기</button> -->
						<!--          <button type="button" class="btn btn-danger">전송하기</button> -->
						<!--          <button type="button" class="btn btn-dark">Reset</button> -->
						<!--          <button type="button" class="btn btn-light">Light</button> -->
						<!--          <button type="button" class="btn btn-link">Link</button> -->
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<!-- 페이지번호 부분 -->
						<div style="text-align:center; padding:0 0 10px 0;">
						  ${map.pagingImg }
						</div>
						
						<ul class="pagination justify-content-center">

							<!--            (게시물전체개수, 한페이지에 출력할 게시물, 한블록에 표시할 페이지, 현재페이지번호, 실행 파일명) -->
							<!--            <li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li> -->
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
				<div class="text-center"></div>
				<!-- 게시판 body 종료 -->
			</div>
		</div>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<jsp:include page="../common/BoardBottom.jsp"></jsp:include>

	</div>
</body>
</html>