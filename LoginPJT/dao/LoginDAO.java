package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static db.JdbcUtil.*;
import vo.Member;

public class LoginDAO {

	private static LoginDAO loginDAO;
	private Connection con;
	
	private LoginDAO() {
		
	}

	public static LoginDAO getInstance() {
		if(loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}

	public void setConnection(Connection con) {
		this.con=con;
		
	}

	public Member selectLoginMember(String id, String passwd) {
		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where id = ? and passwd = ?";
		
		try {
			pstmt = con.prepareStatement(sql);		
			System.out.println("쿼리문 확인 : " +sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginMember = new Member();
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setAge(rs.getInt("age"));
				loginMember.setEmail(rs.getString("gender"));
				loginMember.setId(rs.getString("id"));
				loginMember.setName(rs.getString("name"));
				loginMember.setName(rs.getString("nation"));
				loginMember.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e) {
			System.out.println("LoginDAO 에러 : "+e);
			e.printStackTrace();
		}finally {
			try {
				close(rs);
				close(pstmt);
			}catch(Exception e) {
				System.out.println("LoginDAO finally 에러 : "+e);
				e.printStackTrace();
			}
		}
		
		return loginMember;
	}

}
