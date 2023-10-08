package main.java.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.reservation.model.service.ReservationService;
import main.java.reservation.model.vo.Reservation;

/**
 * Servlet implementation class searchPeriod
 */
@WebServlet("/searchResults.sc")
public class searchResults extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchResults() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String searchReservationNo = request.getParameter("searchReservationNo");
		String searchStatus = request.getParameter("searchStatus");

		ArrayList<Reservation> searchResults = null;
		searchResults = new ReservationService().search(startDate, endDate,searchReservationNo, searchStatus);		

		request.setAttribute("searchResults", searchResults);
		request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
