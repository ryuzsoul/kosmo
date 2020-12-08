package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "Hello Servlet Test");
//		req.setAttribute("HELLO", "hell초기화 파라미터");
		req.setAttribute("HELLO", this.getInitParameter("HELLO"));
		req.getRequestDispatcher("/Study/Servlet/HelloServlet.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//포스트로 요청되면 해당요청을 doget메소드로 전달
		//해당 서블릿은 ahems dycjddmf doget에서 처리
		doGet(req, resp);
	}

}
