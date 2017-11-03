package com.honeyjam.reservation.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.honeyjam.vo.Reservation;

public interface ReservationService {
	List<Reservation> selectReservationById(String email);
	
	Map<String,Integer> selectReservationByDate(java.sql.Date date); 
	
	void insertReservation(Reservation reservation) throws IOException;


	int dayBetween(String checkin, String checkout) throws ParseException;
	
	List<String> emptyRoomsByDate(int guests, String checkin, String checkout) throws IOException, ParseException;

	int addReservation(int reservationId, String email, String checkIn, 
								String checkOut, int numberOfGuests, int roomId, 
								String gender, int paymentStatus) throws IOException;
	
	int findReservationIdByEmail(String email);
	
	int deleteReservationById(int reservationId, String checkIn);
}


