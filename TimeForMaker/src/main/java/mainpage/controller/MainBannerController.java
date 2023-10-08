package  main.java.mainpage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  main.java.mainpage.model.service.MainService;
import  main.java.product.model.vo.Product;

/**
 * Servlet implementation class MainLocaSearchController
 */
@WebServlet("/banner.ma")
public class MainBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainBannerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String banner = request.getParameter("ban");
		System.out.println(banner);
		ArrayList<Product> banlist = new MainService().selectBanner(banner);
		
		request.setAttribute("banlist", banlist);
		request.getRequestDispatcher("views/product/bannerlist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
