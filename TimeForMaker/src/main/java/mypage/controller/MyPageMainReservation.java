package main.java.mypage.controller;
 
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.java.mypage.model.service.MyPageService;
import main.java.mypage.model.vo.MyPage;


/**
 * Servlet implementation class MyPageMainReservation
 */
@WebServlet("/mymainreserv.me")
public class MyPageMainReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainReservation() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<MyPage> mmrlist = new MyPageService().mymainreserv(userId);
		System.out.println("MyPageMainReservation userId : "+userId);
		System.out.println("MyPageMainReservation mmrlist : "+mmrlist);
		

		 HttpSession session = request.getSession();
		 session.setAttribute("mmrlist", mmrlist);
		new Gson().toJson(mmrlist,response.getWriter());
	}
	
	
	
}
