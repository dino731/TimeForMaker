package main.java.reception.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.reception.model.vo.Reception;
import main.java.reception.model.vo.ReceptionFile;
import main.java.reception.service.ReceptionService;

/**
 * Servlet implementation class ReceptionController
 * 
 * 관리자 페이지
 * -회원 문의글 상세보기
 */
@WebServlet("/reception")
public class ReceptionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		
		Reception r = new ReceptionService().selectMemberReception(no);
		ReceptionFile rfile = new ReceptionService().selectMemberReceptionFile(no);
		
		request.setAttribute("r", r);
		request.setAttribute("rfile", rfile);
		request.getRequestDispatcher("views/manager/ManagerReceptionDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
