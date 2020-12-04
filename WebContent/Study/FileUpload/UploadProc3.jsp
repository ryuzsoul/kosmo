<%@page import="model.MyFileDAO"%>
<%@page import="model.MyfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String saveDirectory = application.getRealPath("/Study/FileUpload");
int maxPostSize = 1024*5000;
String encoding = "UTF-8";
FileRenamePolicy policy = new DefaultFileRenamePolicy();

MultipartRequest mr = null;
String name = null;
String title = null;
StringBuffer inter = new StringBuffer();
File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	mr= new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	String fileName = mr.getFilesystemName("chumFile1");
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	int idx = -1;
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	oldFile = new File(saveDirectory+oldFile.separator+fileName);
	newFile = new File(saveDirectory+oldFile.separator+realFileName);
	oldFile.renameTo(newFile);

	
	
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	for(String s: interArr){
		inter.append(s+",&nbsp;");
	}
	
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setInter(inter.toString());
	dto.setOfile(mr.getOriginalFileName("chumFile1"));
	dto.setSfile(realFileName);
	
	MyFileDAO dao = new MyFileDAO(application);
	dao.myfileInsert(dto);
	response.sendRedirect("FileList.jsp");
	
} catch(Exception e){
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>