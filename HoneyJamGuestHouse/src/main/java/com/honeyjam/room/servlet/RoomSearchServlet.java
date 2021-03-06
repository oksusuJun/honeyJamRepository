package com.honeyjam.room.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;
import com.honeyjam.room.service.RoomService;
import com.honeyjam.room.service.RoomServiceImpl;
import com.honeyjam.vo.Room;

/**
 * Servlet implementation class RoomSearchServlet
 */
@WebServlet("/roomSearch")
public class RoomSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// String gender = "남성";
	// Integer numberOfGuest = 1;
	// Date checkIn = new Date(2017, 12, 19);
	// Date checkOut = new Date(2017, 12, 20);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Date checkIn = new Date();

		HttpSession session = request.getSession();
		String gender = request.getParameter("gender");
		int numberOfGuests = Integer.parseInt(request.getParameter("people"));
		String checkInForm = request.getParameter("checkin");
		String checkOutForm = request.getParameter("checkout");

		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
		String[] femaleRoom = new String[] {"202","402", "602", "802"};
		String[] maleRoom = new String[] {"201","401", "601", "801"};
		List<Room> availableRoomList = new ArrayList<>();
		
		session.setAttribute("gender", gender);
		session.setAttribute("people", numberOfGuests);
		session.setAttribute("checkIn", checkInForm);
		session.setAttribute("checkOut", checkOutForm);

		
		try {
			
			System.out.println(checkInForm);
			System.out.println(checkOutForm);

			// 로그인 여부 check
			if (session.getAttribute("loginMember") == null) { // 로그인 x 라면
				// session에 검색조건 parameter 저장
			

				RoomService service = RoomServiceImpl.getInstance();
				ReservationService resService = ReservationServiceImpl.getInstance();
				HashMap<String, Room> roomMap = new HashMap<String, Room>();
				List<String> roomList = new ArrayList<>();

				roomList = resService.emptyRoomsByDate(numberOfGuests, checkInForm, checkOutForm);
				int cnt = 0;

				if (roomList == null) {
					System.out.println("비어있는 방이 없습니다.");
					request.getRequestDispatcher("/main.jsp").forward(request, response);

				} else {
				
					// test
					if (roomList.isEmpty()) {
						System.out.println("아무것도 없다");
						request.getRequestDispatcher("/reservation/room_list_view.jsp").forward(request, response);
 
					} else {
						for (int i = 0; i<roomList.size(); i++) {
							String room = roomList.get(i);
							if (gender.contains("남성")) {
								for(String r : maleRoom) {
									if (r.equals(room)) {
										int roomNum = Integer.parseInt(room);
										System.out.println("들어가니?" + room + "들어감");
										Room selectRoom = service.findRoomByRoomId(roomNum);
										availableRoomList.add(selectRoom);
									} 	
								}
								System.out.println(availableRoomList);
							} else if(gender.contains("여성")) {
								for(String r : femaleRoom) {
									if (r.equals(room)) {
										int roomNum = Integer.parseInt(room);
										System.out.println("들어가니?" + room + "들어감");
										Room selectRoom = service.findRoomByRoomId(roomNum);
										availableRoomList.add(selectRoom);
										
									}
								}
							}
							System.out.println("2차for문 빠져나올때 " + availableRoomList);

							session.setAttribute("availableRoomList", availableRoomList);
							session.setAttribute("roomList", roomList);	
						}
						System.out.println("1차for문 빠져나올때 " + availableRoomList);

						request.getRequestDispatcher("/reservation/room_list_view.jsp").forward(request, response);

					}

				}

			} else { // 로그인 되어있다면
				int cnt = 0;
				RoomService service = RoomServiceImpl.getInstance();
				ReservationService resService = ReservationServiceImpl.getInstance();
				HashMap<String, Room> roomMap = new HashMap<String, Room>();

				List<String> roomList = resService.emptyRoomsByDate(numberOfGuests, checkInForm, checkOutForm);
				if (roomList.isEmpty()) {
					System.out.println("비어있는 방이 없습니다.");
					request.getRequestDispatcher("/main.jsp").forward(request, response);

				} else {
					
					// test
					if (roomList.isEmpty()) {
						System.out.println("아무것도 없다");
						request.getRequestDispatcher("/reservation/room_list_view.jsp").forward(request, response);

					} else {
						for (int i = 0; i<roomList.size(); i++) {
							String room = roomList.get(i);
							if (gender.contains("남성")) {
								for(String r : maleRoom) {
									if (r.equals(room)) {
										int roomNum = Integer.parseInt(room);
										System.out.println("들어가니?" + room + "들어감");
										Room selectRoom = service.findRoomByRoomId(roomNum);
										availableRoomList.add(selectRoom);
									} 
								}
								
								
							} else if(gender.contains("여성")) {
								for(String r : femaleRoom) {
									if (r.equals(room)) {
										int roomNum = Integer.parseInt(room);
										System.out.println("들어가니?" + room + "들어감");
										Room selectRoom = service.findRoomByRoomId(roomNum);
										availableRoomList.add(selectRoom);
									} 
								}
								
							}
						
						}
						session.setAttribute("availableRoomList", availableRoomList);
						session.setAttribute("roomList", roomList);	
						request.getRequestDispatcher("/reservation/room_list_view.jsp").forward(request, response);

					}
				}
			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
