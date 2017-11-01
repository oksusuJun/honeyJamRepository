package com.honeyjam.room.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.honeyjam.room.dao.RoomDao;
import com.honeyjam.room.dao.RoomDaoImpl;
import com.honeyjam.util.SqlSessionFactoryManager;
import com.honeyjam.vo.ReservedRoom;
import com.honeyjam.vo.Room;

public class RoomServiceImpl implements RoomService{
	private SqlSessionFactory factory;
	private RoomDao dao;
	private SqlSession session;
	private List list;
	private int cnt;
	private Room room;
	private static RoomServiceImpl instance;
	
	private RoomServiceImpl() throws IOException {
		factory = SqlSessionFactoryManager.getInstance().getSqlSessionFactory();
		dao = RoomDaoImpl.getInstance();
	}
	
	public static RoomServiceImpl getInstance() throws IOException {
		if (instance == null) {
			instance = new RoomServiceImpl();
		}
		return instance;
	}

	@Override
	public void updateRoom(Room room) {
		// update 필요?
		
	}

	// 전체 방 조회
	@Override
	public List<Room> getRoomList() {
		try {
			session = factory.openSession();
			list = dao.selectAllRoom(session);
			session.commit();
			return list;
		} finally {
			session.close();
		}
	}

	// 방이름으로 방 조회
	@Override
	public List<Room> findRoomByRoomName(String roomName) {
		try {
			session = factory.openSession();
			list = dao.selectRoomByRoomName(session, roomName);
			return list;
		} finally {
			session.close();
		}
	}

	// 방ID(PK) 로 방 조회
	@Override
	public Room findRoomByRoomId(int roomId) {
		try {
			session = factory.openSession();
			room = dao.selectRoomByRoomNum(session, roomId);
			return room;
		} finally {
			session.close();
		}
	}

	// 검색조건 으로 방 조회
	@Override
	public List<Room> searchRoomReservation(String gender, Integer numberOfGuest, Date checkIn, Date checkOut) {
		try {
			session = factory.openSession();
			list = dao.selectRoomBySearch(session, gender, numberOfGuest, checkIn, checkOut);
			return list;
			
		} finally {
			session.close();
		}
	}

	@Override
	public List<Room> findAvailableRoomByGender(String gender) {
		try {
			session = factory.openSession();
			list = dao.selectAvailableRoomByGender(session, gender);
			return list;
			
		} finally {
			session.close();
		}
	}

	@Override
	public List<ReservedRoom> findReservedRoom(String gender, Date checkIn, Date checkOut) {
		try {
			session = factory.openSession();
			list = dao.selectReservedRoomId(session, gender, checkIn, checkOut);
			return list;
		} finally {
			session.close();
		}
	}

	
}
