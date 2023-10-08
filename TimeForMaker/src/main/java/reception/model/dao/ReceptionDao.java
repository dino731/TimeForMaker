package main.java.reception.model.dao;

import static main.java.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import main.java.common.model.vo.PageInfo;
import main.java.reception.model.vo.Reception;
import main.java.reception.model.vo.ReceptionFile;

public class ReceptionDao {
	Properties prop = new Properties();
	
	public ReceptionDao() {
		try {
			prop.loadFromXML(new FileInputStream(ReceptionDao.class.getResource("/sql/reception/reception-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int countAllReceptionList(Connection conn, Reception r) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countAllReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			
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
	
	public int countReceptionList(Connection conn, Reception r) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getCategory());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				result=rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @param conn
	 * @param pi
	 * @param r
	 * 
	 * db에서 rownum, title, create_date, status 가져와야 함
	 * -status : 답변 테이블과 조인해서 없으면 "대기중", 있으면 "완료"
	 * @return
	 */
	public ArrayList<Reception> selectAllReceptionList(Connection conn, PageInfo pi, Reception r){
		ArrayList<Reception> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, r.getUserId());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Reception re = new Reception(rset.getString("title"), rset.getDate("upload_date"),
											rset.getInt("r"), rset.getString("status"));
				list.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Reception> selectReceptionList(Connection conn, PageInfo pi, Reception r){
		ArrayList<Reception> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getCategory());
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Reception re = new Reception(rset.getString("title"), rset.getDate("upload_date"),
											rset.getInt("r"), rset.getString("status"));
				list.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Reception selectAllReception(Connection conn, Reception r) {
		Reception result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllReception");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getUserId());
			pstmt.setInt(2, r.getRowNum());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				result = new Reception(rset.getString("user_id"), rset.getString("title"), rset.getString("text"),
											rset.getDate("upload_date"), rset.getString("answer"));
				result.setReceptionNo(rset.getString("reception_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public Reception selectReception(Connection conn, Reception r, String category) {
		Reception result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReception");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, category);
			pstmt.setInt(3, r.getRowNum());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				result = new Reception(rset.getString("user_id"), rset.getString("title"), rset.getString("text"),
									rset.getDate("upload_date"), rset.getString("answer"));
				result.setReceptionNo(rset.getString("reception_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int submitReception(Connection conn, Reception r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("submitReception");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getCategory());
			pstmt.setString(2, r.getUserId());
			pstmt.setString(3, r.getTitle());
			pstmt.setString(4, r.getText());
			pstmt.setString(5, r.getCategory());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int submitReceptionFile(Connection conn, ReceptionFile rfile, Reception r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("submitReceptionFile");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getCategory());
			pstmt.setString(2, rfile.getOrgName());
			pstmt.setString(3, rfile.getChangeName());
			pstmt.setString(4, rfile.getPath());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int countAllMemberReceptionList(Connection conn, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countAllMemberReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, status);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int countMemberReceptionList(Connection conn, String category, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("countMemberReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setString(2, status);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Reception> selectAllMemberReceptionList(Connection conn, PageInfo pi, String status){
		ArrayList<Reception> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllMemberReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, status);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Reception re = new Reception(rset.getString("title"), rset.getDate("upload_date"),
											rset.getInt("r"), rset.getString("status"));
				re.setReceptionNo(rset.getString("reception_no"));
				list.add(re);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Reception> selectMemberReceptionList(Connection conn, PageInfo pi, String category, String status){
		ArrayList<Reception> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberReceptionList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, category);
			pstmt.setString(2, status);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Reception re = new Reception(rset.getString("title"), rset.getDate("upload_date"),
											rset.getInt("r"), rset.getString("status"));
				re.setReceptionNo(rset.getString("reception_no"));
				list.add(re);
				System.out.println("dao : "+re.getReceptionNo());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Reception selectMemberReception(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reception result = null;
		String sql = prop.getProperty("selectMemberReception");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				result = new Reception(rset.getString("user_id"), rset.getString("title"), rset.getString("text"),
										rset.getDate("upload_date"), rset.getString("answer"));
				result.setReceptionNo(rset.getString("reception_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public ReceptionFile selectMemberReceptionFile(Connection conn, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReceptionFile result = null;
		String sql = prop.getProperty("selectMemberReceptionFile");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				result = new ReceptionFile(rset.getString("orgin_name"), rset.getString("change_name"), rset.getString("file_path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int insertReceptionReply(Connection conn, Reception reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReceptionReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, reply.getReceptionNo());
			pstmt.setString(2, reply.getReply());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
