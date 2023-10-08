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
 * Servlet implementation class ReservationMore
 */
@WebServlet("/MoreInfo.rs")
public class ReservationMore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationMore() {
        super();
        // TODO Auto-generated constructor stub
    }
// 그냥 켰따 키는 용도임
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Long reservationNo = Long.parseLong(request.getParameter("reservationNo"));
		
		Reservation r = new ReservationService().reservationMore(reservationNo);
		
		request.setAttribute("r", r);
		
		request.getRequestDispatcher("/views/reservation/reservationMore.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
	
	}

}
