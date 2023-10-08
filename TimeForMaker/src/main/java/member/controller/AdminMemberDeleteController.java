package  main.java.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import  main.java.member.model.service.AdminMemberService;
import  main.java.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberDeleteController
 */
@WebServlet("/memberDelete.ad")
public class AdminMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = request.getParameter("userId");
		System.out.println(userId);
		int result = new AdminMemberService().adminDeleteMember(userId);

		if (result > 0) {
		    request.getSession().setAttribute("alertMsg", "회원상태 탈퇴 성공");
		    response.sendRedirect(request.getContextPath() + "/list.me");
		    session.removeAttribute("loginUser");
		    return; // 리디렉션 후 메서드를 종료하므로 추가적인 처리가 필요 없음
		} else {
		    request.setAttribute("errorMsg", "회원상태 탈퇴 실패");
		    request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		    return; // 포워딩 후 메서드를 종료하므로 추가적인 처리가 필요 없음
		}

	}

}
