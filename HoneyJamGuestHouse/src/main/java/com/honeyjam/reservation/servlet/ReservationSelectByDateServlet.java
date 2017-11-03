package com.honeyjam.reservation.servlet;

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

import com.honeyjam.reservation.service.ReservationService;
import com.honeyjam.reservation.service.ReservationServiceImpl;
import com.honeyjam.vo.Reservation;

/**
 * Servlet implementation class ReservationSelectByDateServlet
 */
@WebServlet("/reservationSelectByDate")
public class ReservationSelectByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String date = request.getParameter("date");
		request.setAttribute("date", date);
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
		Date date1 = null;
		try {
			date1 = dateForm.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ReservationService service = ReservationServiceImpl.getInstance();
		List<Reservation> list = service.selectAllReservationByDate(date1);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/member/admin_view_reservation.jsp").forward(request,response);
	}

}
