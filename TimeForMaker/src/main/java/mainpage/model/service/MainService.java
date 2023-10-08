package  main.java.mainpage.model.service;

import static  main.java.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import  main.java.mainpage.model.dao.MainDao;
import  main.java.member.model.vo.UserKeyword;
import  main.java.product.model.vo.Product;


public class MainService {
	
	public ArrayList<UserKeyword> selectRecomList(String userId){
		Connection conn = getConnection();
		ArrayList<UserKeyword> recomlist = new MainDao().selectRecomList(conn, userId);
		close(conn);
		
		return recomlist;
	}

	public ArrayList<Product> selectClassLoction(String clLoca) {
		Connection conn = getConnection();
		ArrayList<Product> mplolist = new MainDao().selectClassLoction(conn, clLoca);
		close(conn);
		
		return mplolist;
	}

	public ArrayList<Product> selectBanner(String banner) {
		Connection conn = getConnection();
		ArrayList<Product> banlist = new MainDao().selectBanner(conn, banner);
		close(conn);
		
		return banlist;
	}
	
	
	
}