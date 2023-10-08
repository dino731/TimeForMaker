package  main.java.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import  main.java.member.model.service.MemberService;
import  main.java.member.model.vo.Member;

/**
 * Servlet implementation class SignUpKeywordController
 */
@WebServlet("/userKeyword.me")
public class SignUpKeywordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpKeywordController() {
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
		request.setCharacterEncoding("UTF-8");
		String[] classKeywordArr = request.getParameterValues("keyword");
		System.out.println("controller kwArr : "+classKeywordArr);
		
		String classKeyword = "";
		if(classKeywordArr != null) {
			classKeyword = String.join(", ", classKeywordArr);
		}
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		
//		System.out.println("controller userId : "+userId);
//		System.out.println("controller classKeyword : "+classKeyword);
		int result = new MemberService().insertClassKeyword(classKeyword, userId);
		
		if(result > 0) { // 성공
			request.getSession().setAttribute("alertMsg", "키워드가 저장되었습니다.");
			response.sendRedirect(request.getContextPath()+"/views/mypage/MyPageMain.jsp");
		}else { //에러페이지로 포워딩
			request.setAttribute("errorMsg","회원가입에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
	
	
	
	
	
	

}
