package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class WriteCtrl extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		int sucOrFail;
		
		if (mr!=null) {
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			
			DataroomDAO dao = new DataroomDAO();
			//자료 100개 입력
//			sucOrFail = 1;
//			for (int i = 0; i < 100; i++) {
//				dto.setTitle("자료실"+i+"번 포스팅");
//				dao.insert(dto);
//			}
			sucOrFail = dao.insert(dto);
			
			
			dao.close();
		} else {
			sucOrFail = -1;
		}
		
		if (sucOrFail==1) {
			resp.sendRedirect("../DataRoom/DataList");
			
		} else {
			req.getRequestDispatcher("/Study/DataRoom/DataWrite.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
