package com.honeyjam.reservation.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.honeyjam.vo.Reservation;

public interface ReservationService {
	List<Reservation> selectReservationById(String email);
	
	Map<String,Integer> selectReservationByDate(java.sql.Date date); 
	
<<<<<<< HEAD
	void insertReservation(Reservation reservation) throws IOException;
=======
	
	int insertReservation(Reservation reservation) throws IOException;
>>>>>>> branch 'master' of https://github.com/oksusuJun/honeyJamRepository.git

	int dayBetween(String checkin, String checkout) throws ParseException;
	
	List<String> emptyRoomsByDate(int guests, String checkin, String checkout) throws IOException, ParseException;
}
