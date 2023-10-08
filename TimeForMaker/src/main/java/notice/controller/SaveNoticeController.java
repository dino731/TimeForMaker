package main.java.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.common.model.vo.PageInfo;
import main.java.notice.model.vo.Notice;
import main.java.notice.service.NoticeService;

/**
 * Servlet implementation class SaveNoticeController
 * 
 * get 방식 요청시 임시저장글 목록 리턴
 * post 방식 요청시 작성중인 공지글 저장 -> 임시저장글 목록 리턴
 */
@WebServlet("/saveNoticeBoard")
public class SaveNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> list = null;
		
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int listCount = new NoticeService().countAllSavedNotice();
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		int startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		int endPage = (startPage + pageLimit -1)>maxPage ? maxPage : (startPage + pageLimit -1);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		list = new NoticeService().selectSavedNoticeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/manager/saveNoticeBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
