package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class BbsDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	/**
	 * Construct connection with DB
	 * @param driver
	 * @param url
	 */
	public BbsDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공(인자생성자)");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패(인자생성자)");
			e.printStackTrace();
		}
	}
	
	public BbsDAO(ServletContext ctx) {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("ConnectionURL"), id, pw);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/**
	 * 커넥션풀을 이용한 생성자
	 */
	public BbsDAO() {
		try {
			
			Context initctx = new InitialContext(); 
			Context ctx = (Context)initctx.lookup("java:comp/env"); 
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle"); 
			con = source.getConnection();
			System.out.println("DBCP연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Close connection from DB
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
	 * Get list count from Board
	 * @param map
	 * @return
	 */
	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = " SELECT COUNT(*) FROM Board ";
		if (map.get("Word")!=null) {
			query += " WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		System.out.println("query="+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	
	public int getTotalRecordCountSearch(Map<String, Object> map) {
		int totalCount = 0;
		String query = " SELECT COUNT(*) FROM Board  "
				+ " INNER JOIN Member M ON B.id = M.id";
		if (map.get("Word")!=null) {
			query += " WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		System.out.println("query="+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
		}
		return totalCount;
	}
	
	/**
	 * Get contents from Board when user search
	 * @param map
	 * @return
	 */
	public List<BbsDTO> selectList(Map<String, Object> map) {
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		String query = " SELECT * FROM Board ";
		if (map.get("Word")!=null) {
			query += " WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		query += " ORDER BY num DESC ";
		System.out.println("query="+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostDate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				bbs.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	/**
	 * Insert
	 * @param dto
	 * @return
	 */
	public int insertWrite(BbsDTO dto) {
		int affected = 0;
		try {
			String query = " INSERT INTO Board(num, title, content, id, visitcount) "
					+ " VALUES(seq_board_num.NEXTVAL, ?, ?, ?, 0) ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public BbsDTO selectView(String num) {
		BbsDTO dto = new BbsDTO();
		String sql = //" SELECT * FROM Board WHERE num=? ";
				" SELECT num, title, content, B.id, postdate, visitcount, name "
				+ " FROM member M INNER JOIN board B "
				+ " ON M.id=B.id WHERE num=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostDate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = " UPDATE Board SET visitcount=visitcount+1 WHERE num=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BbsDTO dto) {
		int affected = 0;
		try {
			String sql = " UPDATE Board SET title=?, content=? WHERE num=? ";
			System.out.println(dto.getTitle()+dto.getContent()+dto.getNum());
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public int delete(BbsDTO dto) {
		int affected = 0;
		try {
			String sql = " DELETE FROM Board WHERE num=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<BbsDTO> selectListPage(Map<String, Object> map) {
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		String sql = " SELECT * FROM( "
				+ "		SELECT Tb.*, ROWNUM rNum FROM( "
				+ "			SELECT * FROM Board ";
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		sql += " ORDER BY num DESC "
			+ "	) Tb "
			+ " ) "
			+ "WHERE rNum BETWEEN ? AND ? ";
		System.out.println("sql="+sql);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostDate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	/**
	 * 게시판 리스트 페이지 회원이름검색
	 * @param map
	 * @return
	 */
	public List<BbsDTO> selectListSearch(Map<String, Object> map) {
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		String sql = " SELECT * FROM( "
				+ "		SELECT Tb.*, ROWNUM rNum FROM( "
				+" SELECT * FROM Board B"
				+" INNER JOIN Member M ON B.id = M.id ";
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		sql +=
			  " ORDER BY num DESC "
		    + "	) Tb "
			+ " ) "
			+ "WHERE rNum BETWEEN ? AND ? ";
		System.out.println("sql="+sql);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostDate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
}
