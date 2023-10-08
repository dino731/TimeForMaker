package main.java.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.reservation.model.service.ReservationService;
import main.java.reservation.model.vo.Reservation;

/**
 * Servlet implementation class ReservationRegiser2
 */
@WebServlet("/RsRegister.rs")
public class ReservationRegiser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationRegiser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String productNo = request.getParameter("productNo");
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		String reservationDateStr = request.getParameter("reservationDate");
//		String reservationTime = request.getParameter("reservationTime");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date reservationDate = null;
		
		try {
			reservationDate = (Date) dateFormat.parse(reservationDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Reservation r= new Reservation();
		r.setProductNo(productNo);
		r.setUserNum(userNum);
		r.setReservationDate(reservationDate);
		r.setUserId(userId);
		
		int result = new ReservationService().insertReservation(r);

		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "예약 등록 성공");
			response.sendRedirect(request.getContextPath() + "/reserve.rs");
		} else {
			request.setAttribute("alertMsg", "응 안됐죠?ㅋㅋ");
			request.getRequestDispatcher("/views/reservation/reservation.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
