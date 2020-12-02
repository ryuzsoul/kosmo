package util;

public class PagingUtil {
	
	/**
	 * 부트스트랩을 활용한 페이지네이션 메소드
	 * @param totalRecordCount 게시물전체개수
	 * @param pageSize 한페이지에 출력할 게시물
	 * @param blockPage 한블록에 표시할 페이지
	 * @param nowPage 현재페이지번호
	 * @param pageName 실행 파일명
	 * @return
	 */
	public static String pagingBS4(int totalRecordCount, int pageSize,
			int blockPage, int nowPage, String pageName) {
		String pagingStr = "";
		int totalPage = (int)(Math.ceil((double)totalRecordCount/pageSize));
		int intTemp = (((nowPage-1)/blockPage)*blockPage)+1;
		
		// 이전블록이 존재하지 않으면 숨김
		if(intTemp!=1) {
			// 무조건 첫페이지로 페이지번호를 1로 설정
			pagingStr +=
					"<li class='page-item'><a href='"+pageName
					+"nowPage=1' class='page-link'><i class='fas fa-angle-double-left'></i></a></li>";
			// 이전블록으로
			pagingStr +=
					"<li class='page-item'><a href='"+pageName
					+"nowPage="+(intTemp-1)+"' class='page-link'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		int blockCount = 1;
		while (blockCount<=blockPage && intTemp<=totalPage) {
			// 페이지 바로가기 5개씩 출력하는 부분
			if(intTemp==nowPage) {
				pagingStr +=
					"<li class='page-item active'><a href='#' class='page-link'>"+intTemp+"</a></li>";
			} else {
				pagingStr +=
					"<li class='page-item'><a href='"+pageName
					+"nowPage="+intTemp+"' class='page-link'>"+intTemp+"</a></li>";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp<=totalPage) {
			pagingStr +=
				"<li class='page-item'><a href='"+pageName+"nowPage="
				+intTemp+"' class='page-link'><i class='fas fa-angle-right'></i></a></li>";
			// 마지막 페이지로 바로가기
			pagingStr +=
				"<li class='page-item'><a href='"+pageName+"nowPage="
				+totalPage+"' class='page-link'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		return pagingStr;
	}
	
	/**
	 * 	이미지를 사용한 페이지네이션(미사용)
	 * @param totalRecordCount
	 * @param pageSize
	 * @param blockPage
	 * @param nowPage
	 * @param pageName
	 * @return
	 */
	public static String pagingImg(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		String pagingStr = "";
		int totalPage =	(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		if(intTemp != 1) {
			pagingStr += "<a href='"+pageName+"nowPage=1'><img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+(intTemp-1)+"'><img src='../images/paging2.gif'></a>";
		}
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage)
		{
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;";
				pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>"+intTemp+"</a>";
				pagingStr += "&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'><img src='../images/paging3.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+totalPage+"'><img src='../images/paging4.gif'></a>";
		}
		return pagingStr;
	}
	
	/**
	 * 페이징을 텍스트 링크 사용
	 * @param totalRecordCount
	 * @param pageSize
	 * @param blockPage
	 * @param nowPage
	 * @param pageName
	 * @return
	 */
	public static String pagingTxt(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";

		int totalPage =	(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		
		if(intTemp != 1) {
			pagingStr += "<a href='"+pageName+"nowPage=1'>[첫페이지로]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+(intTemp-1)+"'>[이전블록으로]</a>";
		}

		//각 페이지 바로가기 숫자로 출력
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage)
		{
			//현재페이지의 경우 링크 제거
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;";
				pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>"+intTemp+"</a>";
				pagingStr += "&nbsp;";
			}
			intTemp++;
			blockCount++;
		}

		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>[다음블록으로]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+totalPage+"'>[끝페이지로]</a>";
		}

		return pagingStr;
	}

}
