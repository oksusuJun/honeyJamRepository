package com.honeyjam.reservation.service;

import java.util.List;

import com.honeyjam.vo.Reservation;

public interface ReservationService {
	List<Reservation> selectReservationById(String email);
}
