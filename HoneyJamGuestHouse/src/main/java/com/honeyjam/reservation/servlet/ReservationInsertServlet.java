package com.honeyjam.reservation.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;
import com.honeyjam.vo.Reservation;

/**
 * Servlet implementation class ReservationInsertServlet
 */
/**
 * 최종예약정보 -> 결제완료로 넘어갈 때, Reservation 테이블에  insert하는 서블릿.
 * @author Administrator
 *
 */
@WebServlet("/reservationInsert")
public class ReservationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// 요청 파라미터 조회
		int reservationId = Integer.parseInt(request.getParameter("reservationId"));
		String email = request.getParameter("email");
		String checkIn = request.getParameter("checkin");
		String checkOut = request.getParameter("checkout");
		int numberOfGuests = Integer.parseInt(request.getParameter("people"));
		int roomId = Integer.parseInt(request.getParameter("roomId"));
		String gender = request.getParameter("gender");
		int paymentStatus = Integer.parseInt(request.getParameter("paymentStatus"));
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");

		
		
		
		
		// 예약완료 페이지로 넘길 값 session에 저장
		session.setAttribute("reservationId", reservationId);
		session.setAttribute("email", email);
		session.setAttribute("checkIn", checkIn);
		session.setAttribute("checkOut", checkOut);
		session.setAttribute("numberOfGuests", numberOfGuests);
		session.setAttribute("roomId", roomId);
		session.setAttribute("gender", gender);
		session.setAttribute("paymentStatus", paymentStatus);
		
		
		try {
			Date checkOutForm = dateForm.parse(checkOut);
			Date checkInForm = dateForm.parse(checkIn);
			
			
			Reservation reservation = new Reservation(reservationId, email, checkInForm, checkOutForm, numberOfGuests, roomId, gender, paymentStatus);
			session.setAttribute("reservation", reservation);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ReservationService service = ReservationServiceImpl.getInstance();
		
		if (session.getAttribute("loginMember") == null) {
			request.getRequestDispatcher("/member/login.jsp");
			
		} else {
			int result = service.addReservation(reservationId, email, checkIn, checkOut, numberOfGuests, roomId, gender, paymentStatus);
			if (result == 0) {
				System.out.println("INSERT 실패!");
				request.getRequestDispatcher("/main.jsp").forward(request, response);
			} else {
				System.out.println("INSERT 성공 : "+result+" 건");
				if (paymentStatus == 0) {	// 결제 완료
					request.getRequestDispatcher("/payment/payment3-2.jsp");
				} else { // 무통장입금
					request.getRequestDispatcher("/payment/payment2-2.jsp");
				}
			}
		}
		
		
	}

}
