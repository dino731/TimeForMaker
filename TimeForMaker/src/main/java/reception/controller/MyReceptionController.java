package main.java.reception.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  main.java.common.model.vo.PageInfo;
import  main.java.member.model.vo.Member;
import main.java.reception.model.vo.Reception;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class MyReception
 * 
 * 사용자 측면 문의 서비스(문의게시판, 문의폼)
 * -get 방식 요청시 문의 게시판 원하는 페이지 이동
 */
@WebServlet("/myReception")
public class MyReceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReceptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문의 내역
		String category = request.getParameter("category")==null?"선택":request.getParameter("category");
		ArrayList<Reception> list = new ArrayList();
		Reception r = new Reception(((Member)request.getSession().getAttribute("loginUser")).getUserId(), category);
		// System.out.println(r.getUserId() + " " + category);
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int listCount=0;
		
		switch(category) {
		case "선택" : case "전체" : listCount = new ReceptionService().countAllReceptionList(r); break;
		case "계정" : listCount = new ReceptionService().countReceptionList(r); break;
		case "예약" : listCount = new ReceptionService().countReceptionList(r); break;
		case "기타" : listCount = new ReceptionService().countReceptionList(r); break;
		}
		
		int pageLimit = 5;
		int boardLimit = 5;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		int startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		int endPage = (startPage + pageLimit -1)>maxPage ? maxPage : (startPage + pageLimit -1);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		switch(category) {
		case "선택" : case "전체" : list = new ReceptionService().selectAllReceptionList(pi, r); break;
		case "계정" : list = new ReceptionService().selectReceptionList(pi, r); break;
		case "예약" : list = new ReceptionService().selectReceptionList(pi, r); break;
		case "기타" : list = new ReceptionService().selectReceptionList(pi, r); break;
		}
		
		System.out.println("recept- 시작 : " + startPage + " 끝 : " + endPage + " 마지막 : " + maxPage);
		//request.setAttribute("category", category);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("category", category);
		request.getRequestDispatcher("views/user/receptionBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
