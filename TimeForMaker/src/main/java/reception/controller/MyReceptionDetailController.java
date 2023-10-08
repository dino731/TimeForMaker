package main.java.reception.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import  main.java.common.model.vo.PageInfo;
import  main.java.member.model.vo.Member;
import main.java.reception.model.vo.Reception;
import main.java.reception.model.vo.ReceptionFile;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class CheckReception
 * 
 * 사용자가 문의 목록에서 특정 공지글 확인하고자 요청할 시 처리
 */
@WebServlet("/myReceptionDetail")
public class MyReceptionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReceptionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String category = request.getParameter("category");
		
		Reception r = new Reception(((Member)request.getSession().getAttribute("loginUser")).getUserId(), no); 
		// id, 조회된 결과의 번호
		Reception result = null;
		
		switch(category) {
		case "선택" : case "전체" : result = new ReceptionService().selectAllReception(r); break;
		case "계정" : case "예약" : case "기타" : result = new ReceptionService().selectReception(r, category); break;
		} 
		
		System.out.println(result.getReply());
		ReceptionFile rfile = new ReceptionService().selectMemberReceptionFile(result.getReceptionNo());
		
		request.setAttribute("r", result);
		request.setAttribute("rfile", rfile);
		request.getRequestDispatcher("views/user/userReception.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
