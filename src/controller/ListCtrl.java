package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListCtrl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setAttribute("test", "매핑확인용");
//		req.getRequestDispatcher("/Study/DataRoom/DataList.jsp").forward(req, resp);
		String subPath = req.getPathInfo();
		System.out.println(subPath);
		
		
		if (subPath.equals("/DataList")) {
			
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
			
			List<DataroomDTO> lists = dao.selectList(param);
			
			dao.close();
			
			req.setAttribute("lists", lists);
			req.setAttribute("map", param);
			req.getRequestDispatcher("/Study/DataRoom/DataList.jsp").forward(req, resp);
			System.out.println("if문진입");
			
		} else {

		}
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
