package com.honeyjam.reservation.service;

import java.sql.Date;
import java.util.List;

import com.honeyjam.vo.Reservation;

public interface ReservationService {
	List<Reservation> selectReservationById(String email);
	
	int[] selectReservationByDate(Date date); 
}
