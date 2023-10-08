package main.java.notice.model.dao;

import static main.java.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;


import main.java.common.model.vo.PageInfo;
import main.java.notice.model.vo.Notice;

public class NoticeDao {
	Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	public Member login(Connection conn) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String sql = prop.getProperty("login");
//		
//		Member m = null;
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				m=new Member(rset.getString("user_id"), rset.getString("manager_type"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return m;
//	}
	
	public ArrayList<Notice> selectAllUploadedNotice(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllUploadedNotice");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
									rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
									rset.getString("impt").charAt(0));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int countAllSavedNotice(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countAllSavedNotice");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Notice> selectImportantNotice(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImportantNotice");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
									rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
									rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rownum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> selectNormNoticeList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNormNoticeList");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
									rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
									rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> searchNoticeTitle(Connection conn, PageInfo pi, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchNoticeTitle");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
						rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
						rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> searchNoticeContent(Connection conn, PageInfo pi, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchNoticeContent");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
						rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
						rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> searchNotice(Connection conn, PageInfo pi, String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchNotice");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"),
						rset.getString("content"), rset.getDate("create_date"),rset.getString("save").charAt(0),
						rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Notice> selectSavedNoticeList(Connection conn, PageInfo pi){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSavedNoticeList");
		
		ArrayList<Notice> list = new ArrayList();
		
		try {
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"), rset.getString("title"), rset.getString("content"), 
							rset.getDate("create_date"), rset.getString("save").charAt(0), rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Notice selectUploadeNotice(Connection conn, int no, String impt) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUploadeNotice");
		Notice n = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, impt);
			pstmt.setString(2, no+"");
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				n=new Notice(rset.getString("notice_no"), rset.getString("title"), rset.getString("content"),
					rset.getDate("create_date"), rset.getString("save").charAt(0), rset.getString("impt").charAt(0));
				n.setRowNum(rset.getInt("rnum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	
	public Notice selectSavedNotice(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSavedNotice");
		Notice n = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				n=new Notice(rset.getString("notice_no"), rset.getString("title"), rset.getString("content"),
					rset.getDate("create_date"), rset.getString("save").charAt(0), rset.getString("impt").charAt(0));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	
	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getContent());
			pstmt.setString(3, n.getSave()+"");
			pstmt.setString(4, n.getImpt()+"");
			pstmt.setString(5, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getContent());
			pstmt.setString(3, n.getSave()+"");
			pstmt.setString(4, n.getImpt()+"");
			
			result = pstmt.executeUpdate();
			System.out.println("title : "+n.getTitle());
			System.out.println("result : "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection conn, String no) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
