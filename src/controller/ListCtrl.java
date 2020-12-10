package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PagingUtil;

public class ListCtrl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setAttribute("test", "매핑확인용");
//		req.getRequestDispatcher("/Study/DataRoom/DataList.jsp").forward(req, resp);
		
//		테스트실패
//		String subPath = req.getPathInfo();
//		System.out.println(subPath);
//		if (subPath.equals("/DataList")) {
//		} else {
//		}
		
		DataroomDAO dao = new DataroomDAO();
		Map param = new HashMap();
		String addQueryString = "";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if (searchColumn!=null) {
			addQueryString = 
					String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
			param.put("Coloumn", searchColumn);
			param.put("Word", searchWord);
		}
		int totalRecordCount = dao.getTotalRecordCount(param);
		param.put("totalCount", totalRecordCount);
		
		//페이지네이션 처리
		ServletContext application = this.getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
		int totalPage = (int)Math.ceil((double)totalRecordCount);
		System.out.println(totalRecordCount+" "+totalPage);
		
		int nowPage = (req.getParameter("nowPage")==null) || req.getParameter("nowPage").equals("") ?
				1 : Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1)*pageSize +1;
		int end = nowPage * pageSize;
		
		param.put("start", start);
		param.put("end", end);
		param.put("totalPage", totalPage);
		param.put("nowPage", nowPage);
		param.put("totalRecordCount", totalRecordCount);
		param.put("pageSize", pageSize);
		
		String pagingImg = PagingUtil.pagingBS4(
				totalRecordCount, pageSize, blockPage, nowPage, 
				"../Study/DataRoom/DataList?"+addQueryString);
		param.put("pagingImg", pagingImg);
		
		
		//페이지네이션 처리를 위한 메소드 변경
//		List<DataroomDTO> lists = dao.selectList(param);
		List<DataroomDTO> lists = dao.selectListPage(param);
		
		dao.close();
		
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
		req.getRequestDispatcher("/Study/DataRoom/DataList.jsp").forward(req, resp);
		System.out.println("if문진입");
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
