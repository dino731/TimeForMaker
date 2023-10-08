package  main.java.mainpage.model.dao;

import static  main.java.common.JDBCTemplate.close;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import static  main.java.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import  main.java.member.model.dao.MemberDao;
import  main.java.member.model.vo.UserKeyword;
import  main.java.product.model.vo.Product;

public class MainDao{
	
	private Properties prop = new Properties();
	
	public MainDao() {
		String fileName = MemberDao.class.getResource("/sql/main/main-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<UserKeyword> selectRecomList(Connection conn, String userId) {
		
		ArrayList<UserKeyword> recomlist = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRecomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			 pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			  
			while(rset.next()) {
				UserKeyword uk = new UserKeyword();
				uk.setProductNo(rset.getString("PRODUCT_NO"));
				uk.setClassName(rset.getString("CLASS_NAME"));
				uk.setPrice(rset.getInt("PRICE"));
				uk.setUserId(rset.getString("USER_ID"));
				uk.setClassKeyword(rset.getString("CLASS_KEYWORD"));
				uk.setFileSavePath(rset.getString("FILE_SAVE_PATH"));
				uk.setFileName(rset.getString("FILE_NAME"));
				uk.setFileLevel(rset.getInt("FILE_LEVEL"));
				uk.setClassCategory(rset.getString("CLASS_CATEGORY"));
				recomlist.add(uk);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return recomlist;
		
		
		
	}

	public ArrayList<Product> selectClassLoction(Connection conn, String clLoca) {
		ArrayList<Product> mplolist = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MainselectLocaList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			 pstmt.setString(1, '%' + clLoca + '%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getString("PRODUCT_NO"));
				p.setClassName(rset.getString("CLASS_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setLocation(rset.getString("LOCATION"));
				p.setClassCategory(rset.getString("CLASS_CATEGORY"));
				p.setClassKeyword(rset.getString("CLASS_KEYWORD"));
				p.setFileSavePath(rset.getString("FILE_SAVE_PATH"));
				p.setFileName(rset.getString("FILE_NAME"));
				p.setFileLevel(rset.getInt("FILE_LEVEL"));
				mplolist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(mplolist);
		return mplolist;
	}

	public ArrayList<Product> selectBanner(Connection conn, String banner) {
		ArrayList<Product> banlist = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBanner");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			 pstmt.setString(1, '%' + banner + '%');
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getString("PRODUCT_NO"));
				p.setClassName(rset.getString("CLASS_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setLocation(rset.getString("LOCATION"));
				p.setClassCategory(rset.getString("CLASS_CATEGORY"));
				p.setClassKeyword(rset.getString("CLASS_KEYWORD"));
				p.setFileSavePath(rset.getString("FILE_SAVE_PATH"));
				p.setFileName(rset.getString("FILE_NAME"));
				p.setFileLevel(rset.getInt("FILE_LEVEL"));
				banlist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(banlist);
		return banlist;
	}
	
	
	
	/*public ArrayList<Product> randomClassList(Connection conn){
		ArrayList<Product> randomlist = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("randomClassList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setProductNo(rset.getString("PRODUCT_NO"));
				p.setClassName(rset.getString("CLASS_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setClassCategory(rset.getString("CLASS_CATEGORY"));
				p.setClassKeyword(rset.getString("CLASS_KEYWORD"));
				
				randomlist.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return randomlist;
	}*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

	
	
