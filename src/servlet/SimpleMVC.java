package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class SimpleMVC extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String type = req.getParameter("type");
		Object resultObj = null;
		if (type==null) {
			resultObj = "파라미터 없음";
		} else if (type.equals("greeting")) {
			ServletContext application = this.getServletContext();
			String drv = application. getInitParameter("JDBCDriver");
			String url = application.getInitParameter("ConnectionURL");
			MemberDAO dao = new MemberDAO(drv, url);
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			boolean isMember = dao.isMember(id, pw);
			if (isMember==true) {
				resultObj = "회원님 방가";
			} else {
				resultObj = "넌 회원이 아니군";
			}
			
		} else if(type.equals("date")){
			resultObj = new java.util.Date();
		} else {
			resultObj = "마지막엘스";
		}
		req.setAttribute("result", resultObj);
		
		//뷰로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/Study/Servlet/SimpleMVC.jsp");
		dis.forward(req, resp);
	}
	
}
