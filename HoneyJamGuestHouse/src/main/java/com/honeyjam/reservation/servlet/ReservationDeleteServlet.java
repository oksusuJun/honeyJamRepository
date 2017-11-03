package com.honeyjam.reservation.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;

/**
 * Servlet implementation class ReservationDeleteServlet
 */
@WebServlet("/reservationDelete")
public class ReservationDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// 요청파라미터(reservationId) 조회
		int reservationId = Integer.parseInt(request.getParameter("reservationId"));
		System.out.println(reservationId);
		String checkInForm = request.getParameter("checkIn");
		System.out.println(checkInForm);

		ReservationService service = ReservationServiceImpl.getInstance();

		int result = service.deleteReservationById(reservationId, checkInForm);
		if (result == 0) {
			System.out.println("예약 취소 실패!!");
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else {
			System.out.println("예약 취소 성공!! : " + result);
			request.getRequestDispatcher("/member/reservationCancle.jsp").forward(request, response);
		}

	}

}
