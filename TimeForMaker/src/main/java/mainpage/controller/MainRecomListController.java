package  main.java.mainpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  main.java.mainpage.model.service.MainService;
import  main.java.member.model.vo.UserKeyword;
import  main.java.product.model.vo.Product;

/**
 * Servlet implementation class MainRecomListController
 */
@WebServlet("/recomlist.ma")
public class MainRecomListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainRecomListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println("userid2222:?? " + userId);
		ArrayList<UserKeyword> recomlist = new MainService().selectRecomList(userId);
		
		request.setAttribute("recomlist", recomlist);
		
		request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
