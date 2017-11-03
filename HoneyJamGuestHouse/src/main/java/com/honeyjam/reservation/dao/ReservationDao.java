package com.honeyjam.reservation.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Reservation;

public interface ReservationDao {

	int insertReservation(SqlSession session, Reservation reservation);
	
	int updateReservationById(SqlSession session, Reservation reservation);
	
	int deleteReservationById(SqlSession session, List<Object> list);
	
	List<Reservation> selectReservationById(SqlSession session, String email);
	
	List<Reservation> selectReservationByDate(SqlSession session, Date date);
	
	int selectReservationIdByEmail(SqlSession session, String email);
	
}
