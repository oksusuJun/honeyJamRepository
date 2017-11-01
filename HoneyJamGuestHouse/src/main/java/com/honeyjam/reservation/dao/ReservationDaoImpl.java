package com.honeyjam.reservation.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Reservation;

public class ReservationDaoImpl implements ReservationDao{

	private static ReservationDaoImpl instance;
	
	private ReservationDaoImpl() {}
	
	public static ReservationDaoImpl getInstance() {
		if(instance == null) {
			instance = new ReservationDaoImpl();
		}
		return instance;
	}
	
	private String makeSqlId(String id) {
		return "com.honeyjam.reservation.dao.mapper.reservationMapper."+id;
	}
	
	@Override
	public int insertReservation(SqlSession session, Reservation reservation) {
		return session.insert(makeSqlId("insertReservation"), reservation);
	}

	@Override
	public int updateReservationById(SqlSession session, Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservationById(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reservation> selectReservationById(SqlSession session, String email) {
		return session.selectList(makeSqlId("selectReservationById"), email);
	}

	@Override
	public List<Reservation> selectReservationByDate(SqlSession session, Date date) {
//		 java.util.Date utilDate = new java.util.Date();
//		 java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return session.selectList(makeSqlId("selectReservationByDate"),date);
	}

}
