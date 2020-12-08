package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MyFileDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public MyFileDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("ConnectionURL"), id, pw);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int myfileInsert(MyfileDTO dto) {
		int affected = 0;
		try {
			String sql = 
					" INSERT INTO myfile(idx, name, title, inter, ofile, sfile) "
					+" VALUES(seq_bbs_num.NEXTVAL, ?, ?, ?, ?, ?) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<MyfileDTO> myfileList() {
		List<MyfileDTO> fileList = new Vector<MyfileDTO>();
		String sql = 
				" SELECT * FROM Myfile WHERE 1=1 ORDER BY idx DESC ";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setInter(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				fileList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileList;
	}
}
