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
 * Servlet implementation class AdimMemberUpdateController
 */
@WebServlet("/adminmemupdate.me")
public class AdminMemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminMemberUpdateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 폼에서 쓸 애들 미리 선언
		int userNo = Integer.parseInt(request.getParameter("uno"));

		Member mem = new AdminMemberService().selectUpdateMember(userNo);
	    
		//request.setAttribute("userNo", userNo);
		request.setAttribute("mem", mem);
		System.out.println(mem);
		request.getRequestDispatcher("views/member/adminMemberUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원정보변경
		//int userNo = Integer.parseInt(request.getParameter("uno"));  
		
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		String userPhone = request.getParameter("userPhone");
		String userId = request.getParameter("userId");
		String managerType = request.getParameter("managerType");
		Member m = new Member();
		//m.setUserNo(userNo);
		m.setUserName(userName);
		m.setUserNick(userNick);
		m.setUserPhone(userPhone);
		m.setUserId(userId);
		m.setManagerType(managerType);
		System.out.println(m);//잘들어가나 확인중
		int result = new AdminMemberService().adminUpdateMember(m);

		  if(result > 0) {
		         request.getSession().setAttribute("alertMsg", "회원정보 수정 성공");
		         response.sendRedirect(request.getContextPath()+"/list.me");
		         request.setAttribute("mem", m);
		         System.out.println("mem");
		         
		      }else {
		         request.setAttribute("errorMsg", "회원정보 수정 실패");
		         request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		      }


	}
}
