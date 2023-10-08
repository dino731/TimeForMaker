package main.java.reservation.model.dao;

import static main.java.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import main.java.common.model.vo.PageInfo;
import main.java.reservation.model.service.ReservationService;
import main.java.reservation.model.vo.Reservation;

public class ReservationDAO {

	private Properties prop = new Properties();

	public ReservationDAO() {
		try {
			prop.loadFromXML(new FileInputStream(
					ReservationDAO.class.getResource("/sql/reservation/reservation-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Reservation> search(Connection conn, String startDate, String endDate ,String searchReservationNo , String searchStatus) {

		ArrayList<Reservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("search");

		if(startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")) { 
			sql = sql.replace("%1", "RESERVATION_DATE BETWEEN TO_DATE('"+startDate+"', 'yy/MM/dd') AND TO_DATE('"+endDate+"', 'yy/MM/dd')");
		 }else {
			sql = sql.replace("%1", "1=1");
		 }		 

		 if(searchReservationNo != null && !searchReservationNo.equals("")) {
			sql = sql.replace("%2", "RESERVATION_No = '"+searchReservationNo+"'");
		 }else {
			sql = sql.replace("%2", "1=1");
		 }
		 if(searchStatus != null && !searchStatus.equals("")) {
			sql = sql.replace("%3", "RESERVATION_STATUS LIKE '%"+searchStatus+"%'");
		 }else {
			sql = sql.replace("%3", "1=1");
		 }

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Reservation r = new Reservation();
				r.setReservationNo(rset.getLong("RESERVATION_NO"));
				r.setUserId(rset.getString("USER_ID"));
				r.setPaymentStatus(rset.getString("PAYMENT_STATUS"));
				r.setReservationStatus(rset.getString("RESERVATION_STATUS"));

				list.add(r);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public Reservation reservationMore(Connection conn, Long reservationNo) {
		Reservation r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reservationMore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, reservationNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Reservation();
				r.setReservationNo(rset.getLong("RESERVATION_NO"));
				r.setUserName(rset.getString("USER_NAME"));
				r.setClassName(rset.getString("CLASS_NAME"));
				r.setUserNum(rset.getInt("USER_NUM"));
				r.setReservationDate(rset.getDate("RESERVATION_DATE"));
				r.setReservationTime(rset.getString("RESERVATION_TIME"));
				r.setUserPhone(rset.getString("USER_PHONE"));
				r.setUserId(rset.getString("USER_ID"));
				r.setReservationStatus(rset.getString("RESERVATION_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public int acceptReservation(Connection conn, Long reservationNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("acceptReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, reservationNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteReservation(Connection conn, Long reservationNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, reservationNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertReservation(Connection conn, Reservation r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getProductNo());
			pstmt.setInt(3, r.getUserNum());
			pstmt.setDate(4, r.getReservationDate());
//			pstmt.setString(5, reservationTime);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 페이징바 관련
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
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
	public ArrayList<Reservation> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Reservation> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reservation(
								rset.getLong("RESERVATION_NO"),
								rset.getDate("RESERVATION_DATE"),
								rset.getString("RESERVATION_STATUS"),
								rset.getString("RESERVATION_TIME"),
								rset.getString("PAYMENT_STATUS"),
								rset.getInt("USER_NUM"),
								rset.getString("USER_ID"),
								rset.getString("PRODUCT_NO")
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
	
	
	
	
	
	
	
	

}
