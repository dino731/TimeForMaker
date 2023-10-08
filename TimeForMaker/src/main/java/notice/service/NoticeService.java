package main.java.notice.service;

import static main.java.common.JDBCTemplate.close;
import static main.java.common.JDBCTemplate.commit;
import static main.java.common.JDBCTemplate.getConnection;
import static main.java.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import main.java.common.model.vo.PageInfo;
import main.java.notice.model.dao.NoticeDao;
import main.java.notice.model.vo.Notice;

public class NoticeService {
	
	public NoticeService(){
		
	}
	
	// 로그인 임의 생성
//	public Member login() {
//		Connection conn = getConnection();
//		
//		Member m = new NoticeDao().login(conn);
//		
//		close(conn);
//		
//		return m;
//	}
	
	public ArrayList<Notice> selectAllUploadedNotice(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectAllUploadedNotice(conn);
		
		close(conn);
		
		return list;
	}
	
	public int countAllSavedNotice(){
		Connection conn = getConnection();
		
		int result = new NoticeDao().countAllSavedNotice(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Notice> selectImportantNotice(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectImportantNotice(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> selectNormNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNormNoticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> searchNoticeTitle(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchNoticeTitle(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> searchNoticeContent(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchNoticeContent(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> searchNotice(PageInfo pi, String keyword){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().searchNotice(conn, pi, keyword);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Notice> selectSavedNoticeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectSavedNoticeList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Notice selectUploadeNotice(int no, String impt) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectUploadeNotice(conn, no, impt);
		
		close(conn);
		
		return n;
	}
	
	public Notice selectSavedNotice(String no) {
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectSavedNotice(conn, no);
		
		close(conn);
		
		return n;
	}
	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		System.out.println("service result : "+result);
		return result;
	}
	
	public int deleteNotice(String no) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, no);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
