package main.java.common;

import java.sql.Statement;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		Properties prop = new Properties();
		Connection conn = null;
		try {
			String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
			prop.load(new FileInputStream(fileName));
			
			Class.forName(prop.getProperty("driver"));
			
			conn = DriverManager.getConnection(prop.getProperty("url"),
												prop.getProperty("username"),
												prop.getProperty("password"));
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//2. 전달받은 JDBC용 객체를 반납시켜주는 메소드 (객체별로)
	//2_1) Connection객체를 전달받아서 반납시켜주는 메소드
	public static void close(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//2_2 Statement 객체를 전달받아서 반납시켜주는 메소드(오버로딩적용)
	//    => 다형성으로 인해 PreparedStatement 객체 또한 매개변수로 전달이 가능함.(UpCasting)
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//2_3) ResultSet 객체를 전달받아서 반납시켜주는 메소드(오버로딩)
	public static void close(ResultSet rset) {
		
		try {
			if(rset != null && !rset.isClosed()) rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 3. 전달받은 Connection객체를 가지고 트랜잭션처리를 해주는 메소드
	// 3_1) commit메소드
	public static void commit(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//3_2 rollback
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed())
				conn.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	

}
