package com.honeyjam.room.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.honeyjam.room.service.RoomService;
import com.honeyjam.room.service.RoomServiceImpl;
import com.honeyjam.vo.Room;

/**
 * Servlet implementation class RoomSearchServlet
 */
@WebServlet("/roomSearch")
public class RoomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String gender = "남성";
	Integer numberOfGuest = 1;
	Date checkIn = new Date(2017, 12, 19);
	Date checkOut = new Date(2017, 12, 20);


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RoomService service = RoomServiceImpl.getInstance();
		int availableBed = (Integer)request.getAttribute("availableBed");
		int numberOfBeds = (Integer)request.getAttribute("numberOfBeds");
		int guestNum = (Integer)request.getAttribute("numberOfGuest");
		
		List<Room> list = service.searchRoomReservation(gender, numberOfGuest, checkIn, checkOut);
		
		if (list.isEmpty()) {
			// 예약 가능
			/*추후 예약 진행화면으로 변경해야함 */
			response.sendRedirect("/HoneyJamGuestHouse/member/reservation_view.jsp");
		} else {
			if((availableBed-numberOfBeds) >= guestNum) { // 예약 가능
				/*추후 예약 진행화면으로 변경해야함 */
				response.sendRedirect("/HoneyJamGuestHouse/member/reservation_view.jsp");
			}
			
			request.getRequestDispatcher("/HoneyJamGuestHouse/main.jsp");
		} 
	}

}
