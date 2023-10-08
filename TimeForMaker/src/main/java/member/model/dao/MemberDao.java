package  main.java.member.model.dao;

import static  main.java.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import  main.java.member.model.vo.ClassKeyword;
import  main.java.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("USER_NICK"),
						rset.getString("USER_PWD"),
						rset.getString("USER_PHONE"),
						rset.getDate("USER_ENROLL"),
						rset.getDate("USER_MODIFY"),
						rset.getString("USER_TYPE"),
						rset.getString("MANAGER_TYPE")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	

	public int insertMember(Connection conn, Member m) {
		// insert => 처리된 행의 개수를 반환
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getUserNick());
			pstmt.setString(5, m.getUserPhone());

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(count);
		return count;
	}	
	public int kIdCheck(Connection conn, String userId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(count);
		return count;
	}	
	
	public int insertClassKeyword(Connection conn, String classKeyword , String userId ) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertClassKeyword");
		String[] keyword = classKeyword.split(", ");
		System.out.println("DAO userId : "+userId);
		System.out.println("DAO Keyword.length : "+keyword.length);
		int result = 1; // 0실패
		try {
			pstmt = conn.prepareStatement(sql);
			
			for (String k : keyword) {
				pstmt.setString(1, k);
				pstmt.setString(2, userId);
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("DAO result : "+result);
		return result;
	}

	public int deleteMember(Connection conn, String userId, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("DAO result : "+ result);
		return result;
	}
	
	
	
	
	
	
	
	

}
