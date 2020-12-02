package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/*
DAO DataAccessObject
	데이터베이스의 DAta에 접근하기 위한객체 DB접근을 위한 로직으로 구성
 */
public class MemberDAO {
	
	Connection con;	//커넥션 객체를 멤버변수로 설정하여 공유
	PreparedStatement psmt;
	ResultSet rs;

	//기본생성자를 통항 DB연결
	public MemberDAO() {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			
			//DB에 저장될 정보를 커넥션 객체에 저장
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
	}
	
	public MemberDAO(String driver, String url) {
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
	
	//회원의 존재유무만 판단
	public boolean isMember(String id, String pass) {
		String sql = " SELECT COUNT(*) FROM Member "
				+" WHERE id=? AND pass=? ";
		int isMember = 0;
		boolean isFlag = false;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			
			isMember = rs.getInt(1);
			System.out.println("affected"+ isMember);
			if (isMember==0) {
				isFlag = false;
			} else {
				isFlag = true;
			}
		} catch (Exception e) {
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String sql = " SELECT id, pass, name FROM Member "
				+" WHERE id=? AND pass=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
			} else {
				System.out.println("결과셋이 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public Map<String, String> getMemberMap(String id, String pwd) {
		Map<String, String> maps = new HashMap<String, String>();
		String sql = " SELECT id, pass, name FROM Member "
				+" WHERE id=? AND pass=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			if (rs.next()) {
				maps.put("id", rs.getString("id"));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString(3));
			} else {
				System.out.println("결과셋이 없습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maps;
	}
	
	public static void main(String[] args) {
		new MemberDAO();

	}

}
