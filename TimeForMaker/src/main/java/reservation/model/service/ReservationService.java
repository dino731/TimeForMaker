package main.java.reservation.model.service;
import static main.java.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import main.java.common.model.vo.PageInfo;
import main.java.reservation.model.dao.ReservationDAO;
import main.java.reservation.model.vo.Reservation;

public class ReservationService {
	
	public ArrayList<Reservation> search(String startDate, String endDate ,String searchReservationNo,String searchStatus) {
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new ReservationDAO().search(conn,startDate, endDate, searchReservationNo, searchStatus);
		
		close(conn);
		
		return list;
	}
	
	public Reservation reservationMore(Long reservationNo){
		
		Connection conn = getConnection();
		
		Reservation list = new ReservationDAO().reservationMore(conn, reservationNo);
		
		close(conn);
		
		return list;
	}
	
	
	public int acceptReservation(Long reservationNo) {
		
		Connection conn = getConnection();
		
		int result = new ReservationDAO().acceptReservation(conn, reservationNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public int deleteReservation(Long reservationNo) {
		
		Connection conn = getConnection();
		
		int result = new ReservationDAO().deleteReservation(conn, reservationNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int insertReservation(Reservation r) {
		
		Connection conn = getConnection();
		
		int result = new ReservationDAO().insertReservation(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	// 페이징바 관련
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReservationDAO().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	public ArrayList<Reservation> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new ReservationDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
