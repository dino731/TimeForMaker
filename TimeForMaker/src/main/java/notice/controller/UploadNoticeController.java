package main.java.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import main.java.notice.model.vo.Notice;
import main.java.notice.service.NoticeService;

/**
 * Servlet implementation class UploadNotice
 * 
 * get 방식 요청시 공지글 작성폼 로드
 * post 방식 요청시 작성중인 공지글 공지게시판으로 업로드 -> 공지게시판 리턴
 */
@WebServlet("/uploadNotice")
public class UploadNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no = request.getParameter("no");
			
		Notice n = null;
		
		if(no!=null) {
			n = new NoticeService().selectSavedNotice(no);
		}
		request.setAttribute("n", n);
		request.getRequestDispatcher("views/manager/noticeEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// String no = request.getParameter("no");
		String no = request.getParameter("notice-form-no").isEmpty()?null:request.getParameter("notice-form-no");
		char agree = request.getParameter("notice-form-agree-hdn").charAt(0);
		String title = request.getParameter("notice-form-title");
		String content = request.getParameter("notice-form-content").replaceAll("\r\n", "<br>");
		char save = request.getParameter("save").charAt(0);
		
		System.out.println("no : "+no+" agree : "+agree+" title : "+title+" content : "+content+" save : "+save);
		
		Notice n = new Notice(title, content, save, agree);
		int result;
		HttpSession session = request.getSession();
		
		if(agree=='Y' && new NoticeService().selectImportantNotice().size()>=4) { 
		// 중요공지라고 체크 + 기존 중요공지가 4개 미만일때 중요공지로 추가 가능
		// -> 중요공지가 꽉 찼으면 알림창 + 다시 폼 작성하게
			request.setAttribute("msg", "중요공지가 이미 4개 존재하여 추가로 등록 불가능합니다.");
			request.setAttribute("n", n);
			request.getRequestDispatcher("views/manager/noticeEnrollForm.jsp").forward(request, response);
			return;
		}else {
			if(no!=null) { // 기존에 있던 공지 로드 후 수정/공지 게시판으로 업로드
				n.setNoticeNo(no);
				result = new NoticeService().updateNotice(n);
				System.out.println("no==null? : "+no);
			}else { // 새로 작성하던 글 업로드 / 임시저장
				result = new NoticeService().insertNotice(n);
			}
		}
		System.out.println(result);
		if(result>0) { // 성공적으로 작업 수행한 경우
			if(save=='Y') { // 임시저장
				session.setAttribute("msg", "성공적으로 임시저장하였습니다.");
				response.sendRedirect(request.getContextPath()+"/saveNoticeBoard");
				return;
			}else { // 공지 업로드
				session.setAttribute("msg", "성공적으로 업로드하였습니다.");
				response.sendRedirect(request.getContextPath()+"/noticeBoard");
				return;
			}
		}else {
			if(save=='Y') {
				request.setAttribute("msg", "다시 저장해주세요.");
			}else {
				request.setAttribute("msg", "다시 등록해주세요.");
			}
			request.getRequestDispatcher("views/manager/noticeEnrollForm.jsp").forward(request, response);
//				response.sendRedirect("views/manager/saveNoticeBoard");
		}
	}

}
