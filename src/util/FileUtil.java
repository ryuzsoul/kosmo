package util;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {
	public static MultipartRequest upload(HttpServletRequest req, String saveDirectory) {
		MultipartRequest mr =null;
		try {
			
			mr = new MultipartRequest(
					req, saveDirectory, 1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mr;
	}
}
