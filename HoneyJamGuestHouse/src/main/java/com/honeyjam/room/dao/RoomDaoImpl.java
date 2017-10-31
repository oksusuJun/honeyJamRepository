package com.honeyjam.room.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Room;

public class RoomDaoImpl implements RoomDao{
	
	private static RoomDaoImpl instance;

	private RoomDaoImpl() {
	}

	public static RoomDaoImpl getInstance() {
		if (instance == null)
			instance = new RoomDaoImpl();
		return instance;
	}

	private String makeSqlId(String id){
		return "com.honeyjam.room.dao.mepper.RoomMapper."+id;
	}
	
	@Override
	public List<Room> selectAllRoom(SqlSession session) {
		return session.selectList(makeSqlId("selectAllRoom"));
	}

	@Override
	public List<Room> selectRoomByPeople(SqlSession session, int numberOfBeds) {
		return session.selectList(makeSqlId("selectRoomByPeople"), numberOfBeds);
	}

	@Override
	public List<Room> selectRoomByRoomName(SqlSession session, String roomName) {
		return session.selectList(makeSqlId("selectRoomByRoomName"), roomName);
	}

	@Override
	public Room selectRoomByRoomNum(SqlSession session, int roomNum) {
		return session.selectOne(makeSqlId("selectRoomByRoomNum"), roomNum);
	}

	@Override
	public List<Room> selectAvailableRoomByGender(SqlSession session, String gender) {
		return session.selectList(makeSqlId("selectAvailableRoomByGender"), gender);
	}
	
	@Override
	public List<Room> selectRoomBySearch(SqlSession session, String gender, Integer numberOfGuest, Date checkIn,
			Date checkOut) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("gender", gender);
		param.put("numberOfGuest", numberOfGuest);
		param.put("checkOut", checkOut);
		param.put("checkIn", checkIn);
		return session.selectList(makeSqlId("selectRoomBySearch"),param);
	}

	
}
