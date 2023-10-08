package  main.java.member.model.dao;

import static  main.java.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import  main.java.common.model.vo.PageInfo;
import  main.java.member.model.vo.Member;

public class AdminMemberDao {
	
	private Properties prop = new Properties();
	
	public AdminMemberDao() {
		
			try {
				prop.loadFromXML(new FileInputStream(AdminMemberDao.class.getResource("/sql/member/adminmember-mapper.xml").getPath()));
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	
	
	public int selectListCount(Connection conn) {
		
		// SELECT문 => ResultSet객체 (한행)
		int listCount = 0;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectListCount");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Member> selectList(Connection conn, PageInfo pi){
			
			ArrayList<Member> list = new ArrayList();
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				/* 
				 * rownum의 시작값과 종료값 공식
				 * boardLimit이 10이라고 가정
				 * currentPage = 1 => 시작값 1, 종료값 10
				 * currentPage = 2 => 시작값 11, 종료값 20
				 * currentPage = 3 => 시작값 21, 종료값 30
				 * 
				 * 시작값 = (currentPage - 1) * boardLimit +1
				 * 종료값 = 시작값 + boardLimit -1
				 * */
				int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
				int endRow   = startRow + pi.getBoardLimit() - 1; 
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Member(
										rset.getInt("USER_NO"),
										rset.getString("USER_ID"),
										rset.getString("USER_NAME"),
										rset.getString("USER_NICK"), 
										rset.getString("USER_PHONE"),
										rset.getDate("USER_ENROLL"),
										rset.getDate("USER_MODIFY"),
										rset.getString("USER_TYPE"),
										rset.getString("MANAGER_TYPE")
							));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
	
	
		public int adminUpdateMember(Connection conn, Member m) {
			
			//UPDATE => 처리된 행의 갯수
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("adminUpdateMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, m.getUserName());
				pstmt.setString(2, m.getUserNick());
				pstmt.setString(3, m.getUserPhone());
				pstmt.setString(4, m.getManagerType());
				pstmt.setString(5, m.getUserId());
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}


		public Member selectUpdateMember(Connection conn, int userNo) {

			Member m = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectUpdateMember");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userNo);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					m = new Member(
							rset.getInt("USER_NO"),
							rset.getString("USER_ID"), 
							rset.getString("USER_NAME"), 
							rset.getString("USER_NICK"),
							rset.getString("USER_PHONE"),
							rset.getString("MANAGER_TYPE")
							);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return m;
		}
	
	
	

		public int adminDeleteMember(Connection conn, String userId) {
			
			int result = 0;
			PreparedStatement pstmt = null;			

			String sql = prop.getProperty("adminDeleteMember");

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userId );
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		
		public ArrayList<Member> searchMemberList(Connection conn, String inputMemberSeach, PageInfo pi) {
		    ArrayList<Member> list = new ArrayList();
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    String sql = prop.getProperty("searchMemberList");
		    
		    try {
		        
		        pstmt = conn.prepareStatement(sql);
		        int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
				int endRow   = startRow + pi.getBoardLimit() - 1; 
		        // SQL 쿼리에 필요한 값 설정
		        pstmt.setString(1, '%' + inputMemberSeach + '%');
		        pstmt.setString(2, '%' + inputMemberSeach + '%');
		        pstmt.setString(3, '%' + inputMemberSeach + '%');
		        pstmt.setString(4, '%' + inputMemberSeach + '%');
		        pstmt.setString(5, '%' + inputMemberSeach + '%');
		        pstmt.setString(6, '%' + inputMemberSeach + '%');
		        pstmt.setString(7, '%' + inputMemberSeach + '%');
		        pstmt.setString(8, '%' + inputMemberSeach + '%');
		        pstmt.setString(9, '%' + inputMemberSeach + '%');
		        pstmt.setInt(10, startRow);
				pstmt.setInt(11, endRow);
				
		        rset = pstmt.executeQuery();
		        
		        while (rset.next()) {
		            list.add(new Member(
		            		rset.getInt("USER_NO"),
							rset.getString("USER_ID"),
							rset.getString("USER_NAME"),
							rset.getString("USER_NICK"), 
							rset.getString("USER_PHONE"),
							rset.getDate("USER_ENROLL"),
							rset.getDate("USER_MODIFY"),
							rset.getString("USER_TYPE"),
							rset.getString("MANAGER_TYPE")
		            ));
		        }
		         
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(rset);
		        close(pstmt);
		    }
		    System.out.println(list);
		    return list;
		    
		}


	
	
	
	
	
	
	
	
	
	
	

}
