package com.honeyjam.reservation.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;
import com.honeyjam.vo.Member;
import com.honeyjam.vo.Reservation;

/**
 * Servlet implementation class ReservationSelectServlet
 */
@WebServlet("/reservationSelect")
public class ReservationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member member = (Member)session.getAttribute("loginMember");
		String email = member.getEmail(); //현재 로그인한 email
		
		ReservationService service = ReservationServiceImpl.getInstance();
		
		List<Reservation> reservations = service.selectReservationById(email);
		request.setAttribute("reservation", reservations);
		
		request.getRequestDispatcher("/member/reservation_view.jsp").forward(request, response);
	}


}
