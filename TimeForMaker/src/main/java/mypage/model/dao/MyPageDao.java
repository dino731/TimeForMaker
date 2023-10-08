package main.java.mypage.model.dao;

import static main.java.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Properties;

import main.java.member.model.vo.Member;
import main.java.mypage.model.vo.MyPage;


public class MyPageDao {

	private Properties prop = new Properties();
	public MyPageDao() {
		String fileName = MyPageDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int MyEditUpdate(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("MyEditUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserName());			
			pstmt.setString(2, m.getUserPwd());				
			pstmt.setString(3, m.getUserNick());			
			pstmt.setString(4, m.getUserPhone());			 
			pstmt.setString(5, m.getUserId());	

			
			System.out.println(pstmt);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("dao MyEditUpdate reault : "+ result);
		return result;
	}
	
	public Member selectMember(Connection conn, String userId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_NAME"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NICK"),
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
		System.out.println("dao selectMember m : "+ m);
		return m;
	}
	
	public ArrayList<MyPage> mymainreserv(Connection conn, String userId) {
		System.out.println("MyPageDAO userId : "+userId);
		ArrayList<MyPage> mmrlist = new ArrayList<MyPage>();
		LocalDate sysdate = LocalDate.now();
		String dateString = sysdate.toString();
		System.out.println("MyPageDAO dateString : "+dateString);
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mymainreserv");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, dateString);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyPage m = new MyPage(
						rset.getLong("RESERVATION_NO"),
						rset.getDate("RESERVATION_DATE"),
						rset.getString("RESERVATION_STATUS"),
						rset.getString("RESERVATION_TIME"),
						rset.getString("PAYMENT_STATUS"),
						rset.getInt("USER_NUM"),
						rset.getString("PRODUCT_NO"),
						rset.getString("CLASS_NAME"),
						rset.getInt("PRICE"),
						rset.getString("FILE_SAVE_PATH"),
						rset.getString("CLASS_KEYWORD"),
						rset.getString("USER_ID")
						);
				m.setFileName(rset.getString("FILE_NAME"));
				
				mmrlist.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("MyPageDAO mmrlist : "+mmrlist);
		return mmrlist;
	}
	
	public ArrayList<MyPage> myreserv(Connection conn, String userId){
		ArrayList<MyPage> mreserv  = new ArrayList<MyPage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("myreserv");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyPage m = new MyPage(
						rset.getLong("RESERVATION_NO"),
						rset.getDate("RESERVATION_DATE"),
						rset.getString("RESERVATION_STATUS"),
						rset.getString("RESERVATION_TIME"),
						rset.getString("PAYMENT_STATUS"),
						rset.getInt("USER_NUM"),
						rset.getString("PRODUCT_NO"),
						rset.getString("CLASS_NAME"),
						rset.getInt("PRICE"),
						rset.getString("FILE_SAVE_PATH"),
						rset.getString("CLASS_KEYWORD"),
						rset.getString("USER_ID")
						);
				m.setFileName(rset.getString("FILE_NAME"));
				
				mreserv.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("MyPageDAO mreserv : "+mreserv);
		return mreserv;
		
	}
	
	public ArrayList<MyPage> mymaindone(Connection conn,String userId){
		ArrayList<MyPage> mdonelist  = new ArrayList<MyPage>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mymaindone");
		LocalDate sysdate = LocalDate.now();
		String dateString = sysdate.toString();
		System.out.println("MyPageDAO dateString : "+dateString);
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, dateString);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MyPage m = new MyPage(
						rset.getLong("RESERVATION_NO"),
						rset.getDate("RESERVATION_DATE"),
						rset.getString("RESERVATION_STATUS"),
						rset.getString("RESERVATION_TIME"),
						rset.getString("PAYMENT_STATUS"),
						rset.getInt("USER_NUM"),
						rset.getString("PRODUCT_NO"),
						rset.getString("CLASS_NAME"),
						rset.getInt("PRICE"),
						rset.getString("FILE_SAVE_PATH"),
						rset.getString("CLASS_KEYWORD"),
						rset.getString("USER_ID")
						);
				m.setFileName(rset.getString("FILE_NAME"));
				
				mdonelist.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("MyPageDAO mdonelist : "+mdonelist);
		return mdonelist;
		
	}
	

}
