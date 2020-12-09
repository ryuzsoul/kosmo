package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Study/DataRoom/DataPassword.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		DataroomDAO dao = new DataroomDAO();
		boolean isCorrect = dao.isCorrectPassword(pass, idx);
		dao.close();
		
		req.setAttribute("PASS_CORRECT", isCorrect);
		req.getRequestDispatcher("/Study/DataRoom/PassMessage.jsp").forward(req, resp);
	}

}
