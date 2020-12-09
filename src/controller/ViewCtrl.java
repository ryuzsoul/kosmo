package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewCtrl
 */
@WebServlet("/ViewCtrl")
public class ViewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	//service는 doGet doPost 를 동시에 처리 가능
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		DataroomDAO dao = new DataroomDAO();
		dao.updateVisitCount(idx);
		
		DataroomDTO dto = dao.selectView(idx);
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Study/DataRoom/DataView.jsp")
				.forward(req, resp);
		
	}

}
