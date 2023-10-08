package main.java.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.mainpage.model.service.MainService;
import main.java.member.model.service.MemberService;
import main.java.member.model.vo.Member;
import main.java.member.model.vo.UserKeyword;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println("controller userId : "+userId);
		System.out.println("controller userPwd : "+userPwd);
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		System.out.println("controller Member loginuser : "+loginUser);
		if(loginUser == null) {
			request.setAttribute("errorMsg","로그인에 실패했습니다");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);

		}else {
			HttpSession session = request.getSession();
			// 슬기추가
			ArrayList<UserKeyword> recomlist = new MainService().selectRecomList(userId);
			session.setAttribute("recomlist", recomlist);//리스트를 세션에 넘겨준것 이거 하려면 ajax가 제일 좋으나 어려워서 이렇게 바꿈
			
			session.setAttribute("loginUser", loginUser);
			//session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다."); // 확인용 나중에 지워도 됨.
			response.sendRedirect(request.getContextPath());
			//request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
		}
	
	
	
	
	}

}
