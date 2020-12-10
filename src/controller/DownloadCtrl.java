package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FileUtil;

public class DownloadCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filename = req.getParameter("filename");
		String idx = req.getParameter("idx");
//		FileUtil.download(req, resp, "/Upload", filename);
		FileUtil.download2(req, resp, "/Upload", filename, "원본파일명.jpg");
		
		DataroomDAO dao = new DataroomDAO();
		dao.downCountPlus(idx);
		dao.close();
	}

}
