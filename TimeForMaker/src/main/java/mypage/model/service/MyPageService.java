package main.java.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static main.java.common.JDBCTemplate.*;

import main.java.member.model.vo.Member;
import main.java.mypage.model.dao.MyPageDao;
import main.java.mypage.model.vo.MyPage;

public class MyPageService {
	
	public Member MyEditUpdate(Member m) {
		Connection conn = getConnection();
		
		//1) 회원정보 변경요청 보내기(UPDATE)
		System.out.println(m);
		int result = new MyPageDao().MyEditUpdate(conn, m);
		Member updateMember = null;
		
		//2) 트랜잭션 처리
		if(result > 0) {
			commit(conn);
			// 3) 갱신된 회원정보 다시 조회해오기
			updateMember = new MyPageDao().selectMember(conn, m.getUserId());
		}else {
			rollback(conn);
		}
		//4) 자원반납
		close(conn);
		System.out.println("service updateMember : "+updateMember);
		return updateMember;
	}
	
	
	public ArrayList<MyPage> mymainreserv(String userId) {
		System.out.println("MyPageService mmrlist userId : "+userId);
		Connection conn = getConnection();

		ArrayList<MyPage> mmrlist = new MyPageDao().mymainreserv(conn, userId);

		close(conn);
		System.out.println("MyPageDAO mmrlist : "+mmrlist);
		return mmrlist;
		
	}
	public ArrayList<MyPage> myreserv(String userId){
		System.out.println("MyPageService mreserv userId : "+userId);
		Connection conn = getConnection();
		ArrayList<MyPage> mreserv = new MyPageDao().myreserv(conn, userId);
		close(conn);
		System.out.println("MyPageDAO mmrlist : "+mreserv);
		return mreserv;
	}
	
	public ArrayList<MyPage> mymaindone(String userId){
		Connection conn = getConnection();
		System.out.println("MyPageService  mdonelist userId : "+userId);
		ArrayList<MyPage> mdonelist = new MyPageDao().mymaindone(conn, userId);
		close(conn);
		System.out.println("MyPageDAO mdonelist : "+mdonelist);
		return mdonelist;
	}
	

}
