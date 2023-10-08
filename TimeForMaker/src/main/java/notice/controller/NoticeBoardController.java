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
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class NoticeListController
 * 
 * get 방식 요청 -> 공지 게시판 리턴
 */
@WebServlet("/noticeBoard")
public class NoticeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category")==null? "전체" : request.getParameter("category");
		String keyword = request.getParameter("keyword");
		// 해당 경로로 처음 요청올 때는 null이나, 검색어 없이 폼 전송해도 null이 아님(len=0)
		
		ArrayList<Notice> imList = new NoticeService().selectImportantNotice();
		ArrayList<Notice> list = null;
		
		int currentPage = request.getParameter("page")==null?1:Integer.parseInt(request.getParameter("page"));
		int listCount = new NoticeService().selectAllUploadedNotice().size();
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		int startPage = (currentPage -1 ) / pageLimit * pageLimit +1;
		int endPage = (startPage + pageLimit -1)>maxPage ? maxPage : (startPage + pageLimit -1);
		
		/* 중요공지는 고정이므로 일반공지를 기준으로 페이징 */
		if(imList!=null) {
			listCount = listCount - imList.size();
			boardLimit = 10 - imList.size();
			maxPage = (int)Math.ceil((double)listCount/boardLimit);
			endPage = (startPage + pageLimit -1)>maxPage ? maxPage : (startPage + pageLimit -1);
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		/* 조회결과에서 시작~끝 범위에 해당하는 공지만 셀렉해옴 */
		if(category.equals("전체")|| (!category.equals("전체") && keyword.length()==0)) {
			System.out.println("키워드 null임");
			list = new NoticeService().selectNormNoticeList(pi);
		}else{
			switch(category) {
			case "제목": list = new NoticeService().searchNoticeTitle(pi, keyword); break;
			case "내용": list = new NoticeService().searchNoticeContent(pi, keyword); break;
			case "제목 및 내용": list = new NoticeService().searchNotice(pi, keyword); break;
			}
		}
		
		/* 임의로 로그인 멤버 지정 */
//		 Member m = new NoticeService().login();
//		 request.getSession().setAttribute("loginUser", m);
//		 System.out.println(m.getUserId()); System.out.println(m.getManagerType());
		/* --------------------- */
		
		System.out.println("notice- 시작 : " + startPage + " 끝 : " + endPage + " 마지막 : " + maxPage);
		
		request.setAttribute("pi", pi);
		request.setAttribute("imList", imList);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/common/noticeBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
