package main.java.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.common.model.vo.PageInfo;
import main.java.reservation.model.vo.Reservation;
import main.java.reservation.model.service.ReservationService;

/**
 * Servlet implementation class ReservationListController
 */
@WebServlet("/list.bo")
public class ReservationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; // 현재 총 게시글 갯수(1000개)
		int currentPage; // 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(10개씩 할예정)
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수(10개씩 할예정)
	
		int maxPage; // 가장 마지막 페이지가 몇번째 페이지인지(총 페이지 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
	
		// * listCount : 총 게시글 갯수
		listCount = new ReservationService().selectListCount();
		
		// * currentPage : 현재페이지(즉 , 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")); 
	
		// * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대 갯수(페이지 목록들을 몇 개 단위로 출력할것인지)
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수(게시글 몇개 단위로 출력할것인지)
		boardLimit = 10;
		
		maxPage =  (int) Math.ceil((double)listCount / boardLimit); 
		
		startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		
		endPage = startPage + pageLimit -1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		request.setAttribute("pi", pi);
		
		// 2. 현재 사용자가 요청한 페이지(currentPage)에 맞는 게시글 리스트 가져오기
		ArrayList<Reservation> searchResults = new ReservationService().selectList(pi);
		
		request.setAttribute("searchResults", searchResults);
		
		request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
