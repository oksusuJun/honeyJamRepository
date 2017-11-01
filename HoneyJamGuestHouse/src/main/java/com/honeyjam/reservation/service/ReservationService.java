package com.honeyjam.reservation.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.honeyjam.vo.Reservation;

public interface ReservationService {
	List<Reservation> selectReservationById(String email);
	
	Map<String,Integer> selectReservationByDate(java.sql.Date date); 
	
//	List<String> emptyRoomsByDate(String checkin, String checkout) throws IOException;
	
	int insertReservation(Reservation reservation) throws IOException;
}
