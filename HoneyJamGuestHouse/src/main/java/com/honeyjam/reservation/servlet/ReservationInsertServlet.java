package com.honeyjam.reservation.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.room.service.RoomService;
import com.honeyjam.room.service.RoomServiceImpl;
import com.honeyjam.vo.Room;

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
		
		//요청파라미터 조회
		int roomId = Integer.parseInt(request.getParameter("roomId"));
		
		RoomService service = RoomServiceImpl.getInstance();
		
		Room room = service.findRoomByRoomId(roomId);
		session.setAttribute("room", room);
		request.getRequestDispatcher("/payment/payment01.jsp").forward(request, response);
		
	}

}
