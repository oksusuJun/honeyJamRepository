package com.honeyjam.reservation.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.reservation.dao.ReservationDao;
import com.honeyjam.reservation.dao.ReservationDaoImpl;
import com.honeyjam.util.SqlSessionFactoryManager;
import com.honeyjam.vo.Reservation;

public class ReservationServiceImpl implements ReservationService{

	private static ReservationServiceImpl instance;

	private SqlSessionFactory factory;
	private ReservationDao dao;
	
	private ReservationServiceImpl() throws IOException{
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = ReservationDaoImpl.getInstance();
	}

	public static ReservationServiceImpl getInstance() throws IOException {
		if (instance == null)
			instance = new ReservationServiceImpl();
		return instance;
	}
	
	@Override
	public Reservation selectReservationById(String email) {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			dao.selectReservationById(session, email);
			session.commit();
		}finally {
			session.close();
		}
		
		return null;
	}

}
