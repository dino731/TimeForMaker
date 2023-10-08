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
 * Servlet implementation class ReservationDelete
 */
@WebServlet("/delete.rs")
public class ReservationDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long reservationNo = Long.parseLong(request.getParameter("reservationNo"));
		
		int result = new ReservationService().deleteReservation(reservationNo);
		
		if(result > 0) {
			ArrayList<Reservation> searchResults = new ReservationService().search(null, null, null, null);
			request.setAttribute("searchResults", searchResults);
			
			request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
		} else {
			request.setAttribute("alertMsg", "응 안돼~");
			request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
