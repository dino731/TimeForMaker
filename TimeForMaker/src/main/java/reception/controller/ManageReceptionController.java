package main.java.reception.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.common.model.vo.PageInfo;
import main.java.reception.model.vo.Reception;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class ManageReceptionController
 * 
 * 관리자 페이지
 * -모든 회원 문의 목록 게시판
 */
@WebServlet("/manageReception")
public class ManageReceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageReceptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category")==null?"전체":request.getParameter("category");
		String status = request.getParameter("status")==null?"대기":request.getParameter("status");
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		
		
		int listCount=0;
		
		switch(category) {
		case "전체" : listCount = new ReceptionService().countAllMemberReceptionList(status); break;
		case "계정" : case "예약" : case "기타" : listCount = new ReceptionService().countMemberReceptionList(category, status); break;
		}
		
		int pageLimit = 5;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		int startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		int endPage = (startPage + pageLimit -1)>maxPage ? maxPage : (startPage + pageLimit -1);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Reception> list = null;
		
		switch(category) {
		case "전체" : list = new ReceptionService().selectAllMemberReceptionList(pi, status); break;
		case "계정" : case "예약" : case "기타" : list = new ReceptionService().selectMemberReceptionList(pi, category, status); break;
		}
		
		System.out.println("recept- 시작 : " + startPage + " 끝 : " + endPage + " 마지막 : " + maxPage);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
//		request.setAttribute("category", category);
//		request.setAttribute("status", status);
		
		request.getRequestDispatcher("views/manager/ManagerReceptionBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
