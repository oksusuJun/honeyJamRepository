package com.honeyjam.reservation.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;
import com.honeyjam.vo.Room;

/**
 * Servlet implementation class ReservationInsertServlet
 */
@WebServlet("/reservationInsert")
public class ReservationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int guests = Integer.parseInt(request.getParameter("people"));
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		
		ReservationService service = ReservationServiceImpl.getInstance();
		
		try {
			List<String> roomId = service.emptyRoomsByDate(checkin, checkout)yDate(guests, checkin, checkout);
			request.setAttribute("rooms", roomId);
			
			request.getRequestDispatcher("").forward(request, response);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
