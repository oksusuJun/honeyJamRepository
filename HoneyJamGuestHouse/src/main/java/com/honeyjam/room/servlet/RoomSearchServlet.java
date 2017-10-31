package com.honeyjam.room.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
 * Servlet implementation class RoomSearchServlet
 */
@WebServlet("/roomSearch")
public class RoomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	String gender = "남성";
//	Integer numberOfGuest = 1;
//	Date checkIn = new Date(2017, 12, 19);
//	Date checkOut = new Date(2017, 12, 20);


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Date checkIn = new Date();
		
		HttpSession session = request.getSession();
		String gender = request.getParameter("gender");
		Integer numberOfGuests = Integer.parseInt(request.getParameter("people"));
		String checkInForm = request.getParameter("checkin");
		String checkOutForm = request.getParameter("checkout");
		
		SimpleDateFormat dateForm = new SimpleDateFormat("dd/MM/yyyy");
		
		
		try {
			Date checkIn = dateForm.parse(checkInForm);
			Date checkOut = dateForm.parse(checkOutForm);
			System.out.println(checkInForm);
			System.out.println(checkOutForm);
			System.out.println(checkIn);
			System.out.println(checkOut);
			
			RoomService service = RoomServiceImpl.getInstance();
			
			List<Room> list = service.searchRoomReservation(gender, numberOfGuests, checkIn, checkOut);
			
			if (list.isEmpty()) {
				// 예약 가능
				/*추후 예약 진행화면으로 변경해야함 */
				request.getRequestDispatcher("/test.jsp").forward(request, response);

//				response.sendRedirect("/HoneyJamGuestHouse/test.jsp");
			} else {
				request.getRequestDispatcher("/member/reservation_view.jsp").forward(request, response);
			}
			
//			request.getRequestDispatcher("/test.jsp").forward(request, response);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
//		int availableBed = (Integer)request.getAttribute("availableBed");
//		int numberOfBeds = (Integer)request.getAttribute("numberOfBeds");
//		int guestNum = (Integer)request.getAttribute("people");
		
		
	
		
		
		
//		} else {
//			if((availableBed-numberOfBeds) >= guestNum) { // 예약 가능
//				/*추후 예약 진행화면으로 변경해야함 */
//				response.sendRedirect("/HoneyJamGuestHouse/member/reservation_view.jsp");
//			}
			
//			request.getRequestDispatcher("/HoneyJamGuestHouse/main.jsp");
		
	}

}
