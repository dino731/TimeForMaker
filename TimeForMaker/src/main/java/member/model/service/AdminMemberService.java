package  main.java.member.model.service;

import static  main.java.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import  main.java.common.model.vo.PageInfo;
import  main.java.member.model.dao.AdminMemberDao;
import  main.java.member.model.vo.Member;

public class AdminMemberService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdminMemberDao().selectListCount(conn);
		
		close(conn);
		return listCount;
		
	}
	
public ArrayList<Member> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminMemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

public Member selectUpdateMember(int userNo) {
	Connection conn = getConnection();
	
	Member m = new AdminMemberDao().selectUpdateMember(conn, userNo);
	
	close(conn);
	
	return m;
}
public int adminUpdateMember(Member m) {
	
	Connection conn = getConnection();
	//1) 회원정보 변경요청 보내기(UPDATE)
	int result = new AdminMemberDao().adminUpdateMember(conn, m);
	
	
	//2) 트랜잭션 처리
	if(result > 0) {
		commit(conn);
		
	}else {
		rollback(conn);
	}
	
	//4) 자원반납
	close(conn);
	
	return result;
}

public int adminDeleteMember(String userId) {
	Connection conn = getConnection();
	//1) 회원정보 변경요청 보내기(UPDATE)
	int result = new AdminMemberDao().adminDeleteMember(conn, userId);
	
	
	//2) 트랜잭션 처리
	if(result > 0) {
		commit(conn);
		
	}else {
		rollback(conn);
	}
	
	//4) 자원반납
	close(conn);
	
	return result;
	
	
}
public ArrayList<Member> searchMemberList(String inputMemberSeach,PageInfo pi){
	
	Connection conn = getConnection();
	
	ArrayList<Member> list = new AdminMemberDao().searchMemberList(conn, inputMemberSeach, pi);
	
	close(conn);
	
	return list;
}




}
