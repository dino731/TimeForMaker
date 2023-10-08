package main.java.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.member.model.vo.Member;
import main.java.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MyEditUpdate
 */
@WebServlet("/myedit.me")
public class MyEditUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyEditUpdateController() {
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
		String userNick = request.getParameter("userNick");
		String userPwd = request.getParameter("userPwd");
		String userPhone = request.getParameter("userPhone");
		String userName = request.getParameter("userName");
		
		System.out.println("controller userName : "+userName);
		System.out.println("controller userId : "+userId);
		System.out.println("controller userNick : "+userNick);
		System.out.println("controller userId : "+userPwd);
		System.out.println("controller userId : "+userPhone);
		
		Member m = new Member(userId, userName, userPwd, userNick, userPhone);
		Member updateMember = new MyPageService().MyEditUpdate(m);
		System.out.println("controller updateMember : "+updateMember);
		if(updateMember == null) {// 실 패
			
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else { // 성 공
			
			//session영역안에 업데이트된 사용자정보 담아주기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다."); // request로 하면 뭐가 됨 -새하님- ㄳㄳ
			session.setAttribute("loginUser", updateMember);// 같은 키값으로 존재할수 없음 => 즉 덮어쓰기 가능
			
			// 응답페이지 url 재요청
			response.sendRedirect(request.getContextPath());

		}

	}
	
	
	
}
