package com.honeyjam.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Reservation;

public interface ReservationDao {

	int insertReservation(SqlSession session, Reservation reservation);
	
	int updateReservationById(SqlSession session, Reservation reservation);
	
	int deleteReservationById(SqlSession session, String email);
	
	List<Reservation> selectReservationById(SqlSession session, String email);
}
