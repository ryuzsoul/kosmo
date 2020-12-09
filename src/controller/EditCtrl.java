package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class EditCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		ServletContext app = this.getServletContext();
		DataroomDAO dao = new DataroomDAO(app);
		DataroomDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Study/DataRoom/DataEdit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		int sucOrFail;
		if (mr!=null) {
			String idx = mr.getParameter("idx");
			String nowPage = mr.getParameter("nowPage");
			String originalfile = mr.getParameter("originalfile");
			
			req.setAttribute("idx", idx);
			req.setAttribute("nowPage", nowPage);
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String pass = mr.getParameter("pass");
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			if (attachedfile==null) {
				attachedfile = originalfile;
			}
			
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			dto.setIdx(idx);
			
			ServletContext app = this.getServletContext();
			DataroomDAO dao = new DataroomDAO(app);
			sucOrFail = dao.update(dto);
			
			if (sucOrFail==1 && mr.getFilesystemName("attachedfile")!=null) {
				FileUtil.deleteFile(req, "/Upload", originalfile);
			}
			dao.close();
		} else {
			sucOrFail = -1;
		}
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
		req.getRequestDispatcher("/Study/DataRoom/Message.jsp").forward(req, resp);
	}

}
