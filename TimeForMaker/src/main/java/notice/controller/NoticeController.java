package main.java.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.notice.model.vo.Notice;
import main.java.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeController
 * 
 * get 방식 요청시 해당 공지글 리턴
 * 
 */
@WebServlet("/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// int no = Integer.parseInt(request.getParameter("no").substring(1));
		
		int no =Integer.parseInt(request.getParameter("no"));
		String impt = request.getParameter("impt");
		// 이전글, 현재글, 다음글 순으로 리스트에 담기
		Notice[] list = new Notice[3];
		for(int i=0; i<3; i++) {
			int number=0;
			
			switch(i) {
			case 0 : number = no-1; break;
			case 1 : number = no; break;
			case 2 : number = no+1; break;
			}
			list[i] = new NoticeService().selectUploadeNotice(number, impt);
			if(list[i]!=null) {
			}
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/common/notice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
