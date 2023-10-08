package main.java.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.java.notice.service.NoticeService;

/**
 * Servlet implementation class DeleteNoticeController
 * 
 * 공지폼에서 삭제 요청 처리
 * -새로운 글이면 리셋
 * -기존에 있던 글이면 삭제처리
 */
@WebServlet("/deleteNotice")
public class DeleteNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNoticeController() {
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
		String no = request.getParameter("notice-form-no").isEmpty()?null:request.getParameter("notice-form-no");
		
		HttpSession session = request.getSession();
		
		if(no!=null) {
			int result = new NoticeService().deleteNotice(no);
			
			if(result>0) {
				session.setAttribute("msg", "저장하신 공지를 삭제했습니다.");
			}else {
				session.setAttribute("msg", "삭제하는 데 실패했습니다.");
			}
			response.sendRedirect(request.getContextPath()+"/saveNoticeBoard");
			return;
		}else {
			session.setAttribute("msg", "작성 중인 공지를 삭제했습니다.");
		}
		
		response.sendRedirect(request.getContextPath()+"/saveNoticeBoard");
	}

}
