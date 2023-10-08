package  main.java.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import  main.java.member.model.service.MemberService;
import  main.java.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
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
		
		// update문 이용 
		request.setCharacterEncoding("UTF-8");
		String userPwd = request.getParameter("userPwd");
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
		System.out.println("controller userPwd"+ userPwd);
		System.out.println("controller userId"+ userId);
		
		int result = new MemberService().deleteMember(userId, userPwd);
		System.out.println("controller result"+ result);
		if(result > 0) { // 탈퇴 성공시 로그아웃 처리
			session.setAttribute("alertMsg", "성공적으로 회원탈퇴 되었습니다");
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
		}else { //실패시 
			request.getRequestDispatcher("views/mypage/MyPageMain.jsp").forward(request, response);
		}
		
		
		
		
		
		
	}

}
