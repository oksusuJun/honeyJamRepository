package com.honeyjam.reservation.service;

import java.io.IOException;
import java.sql.Date;
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
	public List<Reservation> selectReservationById(String email) {
		SqlSession session = null;
		
		try {
			session = factory.openSession();
			List<Reservation> list = dao.selectReservationById(session, email);
			session.commit();
			return list;
		}finally {
			session.close();
		}
		
	}


	public List<Reservation> selectRbD(Date date){
		SqlSession session = null;
		try {
			session=factory.openSession();
			return dao.selectReservationByDate(session, date);
		}finally {
			session.close();
		}
	}
	
	@Override
	public int[] selectReservationByDate(Date date) {

		SqlSession session = null;
		try {
			session=factory.openSession();
			List<Reservation> list=dao.selectReservationByDate(session, date);
			int r_201=0; 
			int r_202=0;
			int r_401=0;
			int r_601=0;
			
			for(Reservation r: list) {
				if(r.getRoomId() == 201){
					r_201= r_201+r.getNumberOfGuests();
				}else if(r.getRoomId() == 202) {
					r_202 = r_202+r.getNumberOfGuests();
				}else if(r.getRoomId() == r_401) {
					r_401++;
				}else if(r.getRoomId()== r_601) {
					r_601++;
				}
			}
			
			int[] arr= {r_201,r_202,r_401,r_601};
			return arr;
		}finally {
			session.close();
		}
	}
	
	public static void main(String[] args) throws IOException {
		
		ReservationServiceImpl service = ReservationServiceImpl.getInstance();
		
		
		Date d = new Date(2017-1900, 10-1, 14);
		System.out.println(d);
//		System.out.println(d);
		System.out.println(service.selectRbD(d));
//		
	int[] arr =service.selectReservationByDate(d);
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);
		System.out.println(arr[3]);
		
	}
//	
//	

}
