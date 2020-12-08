package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DataroomDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public DataroomDAO() {
		// TODO Auto-generated constructor stub
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			con = source.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Return source to connection pool
	 */
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 전체 레코드 카운트
	 * @param map
	 * @return
	 */
	public int getTotalRecordCount(Map map) {
		int totalCount = 0;
		try {
			String sql =
					" SELECT COUNT(*) FROM Dataroom ";
			if (map.get("Word")!=null) {
				sql +=
					" WHERE "+map.get("Colomn")+" LIKE '%"+map.get("Word")+"%' ";
			}
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<DataroomDTO> selectList(Map map) {
		List<DataroomDTO> bbs = new Vector<DataroomDTO>();
		String sql = " SELECT * FROM Dataroom ";
		if (map.get("Word")!=null) {
			sql += " WHERE "+map.get("Coloumn")+" LIKE '%"+map.get("Word")+"%' ";
		}
		sql += " ORDER BY idx DESC ";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				DataroomDTO dto = new DataroomDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insert(DataroomDTO dto) {
		int affected = 0;
		try {
			String sql = 
					" INSERT INTO Dataroom(idx, title, name, content, attachedfile, pass, downcount) "
					+ " VALUES(seq_board_dataroom.NEXTVAL, ?, ?, ?, ?, ?, 0) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
}
