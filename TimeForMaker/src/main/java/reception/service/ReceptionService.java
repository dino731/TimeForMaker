package main.java.reception.service;

import static main.java.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import main.java.common.model.vo.PageInfo;
import main.java.reception.model.dao.ReceptionDao;
import main.java.reception.model.vo.Reception;
import main.java.reception.model.vo.ReceptionFile;

public class ReceptionService {

	public ReceptionService() {
		
	}
	
	public int countAllReceptionList(Reception r) {
		Connection conn = getConnection();
		
		int result = new ReceptionDao().countAllReceptionList(conn, r);
		
		close(conn);
		
		return result;
	}
	
	public int countReceptionList(Reception r) {
		Connection conn = getConnection();
		
		int result = new ReceptionDao().countReceptionList(conn, r);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reception> selectAllReceptionList(PageInfo pi, Reception r){
		Connection conn = getConnection();
		
		ArrayList<Reception> list = new ReceptionDao().selectAllReceptionList(conn, pi, r);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reception> selectReceptionList(PageInfo pi, Reception r){
		Connection conn = getConnection();
		
		ArrayList<Reception> list = new ReceptionDao().selectReceptionList(conn, pi, r);
		
		close(conn);
		
		return list;
	}
	
	public Reception selectAllReception(Reception r) {
		Connection conn = getConnection();
		
		Reception result = new ReceptionDao().selectAllReception(conn, r);
		
		close(conn);
		
		return result;
	}
	
	public Reception selectReception(Reception r, String category) {
		Connection conn = getConnection();
		
		Reception result = new ReceptionDao().selectReception(conn, r, category);
		
		close(conn);
		
		return result;
	}
	
	public int submitReception(Reception r, ReceptionFile rfile) {
		Connection conn = getConnection();
		
		// 문의 내용
		int result1 = new ReceptionDao().submitReception(conn, r);
		// 첨부파일
		int result2 = 1;
		if(rfile!=null) {
			result2 = new ReceptionDao().submitReceptionFile(conn, rfile, r);
		}
		
		if(result1*result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1*result2;
	}
	
	public int countAllMemberReceptionList(String status) {
		Connection conn = getConnection();
		
		int result = new ReceptionDao().countAllMemberReceptionList(conn, status);
		
		close(conn);
		
		return result;
	}
	
	public int countMemberReceptionList(String category, String status) {
		Connection conn = getConnection();

		int result = new ReceptionDao().countMemberReceptionList(conn, category, status);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Reception> selectAllMemberReceptionList(PageInfo pi, String status){
		Connection conn = getConnection();

		ArrayList<Reception> list = new ReceptionDao().selectAllMemberReceptionList(conn, pi, status);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Reception> selectMemberReceptionList(PageInfo pi, String category, String status){
		Connection conn = getConnection();

		ArrayList<Reception> list = new ReceptionDao().selectMemberReceptionList(conn, pi, category, status);
		
		close(conn);
		
		return list;
	}
	
	public Reception selectMemberReception(String no) {
		Connection conn = getConnection();

		Reception result = new ReceptionDao().selectMemberReception(conn, no);
		
		close(conn);
		
		return result;
	}
	
	public ReceptionFile selectMemberReceptionFile(String no) {
		Connection conn = getConnection();

		ReceptionFile result = new ReceptionDao().selectMemberReceptionFile(conn, no);
		
		close(conn);
		
		return result;
	}
	
	public int insertReceptionReply(Reception reply) {
		Connection conn = getConnection();

		int result = new ReceptionDao().insertReceptionReply(conn, reply);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
