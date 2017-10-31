package com.honeyjam.room.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.Room;

public class RoomDaoImpl implements RoomDao{

	@Override
	public List<Room> selectAllRoom(SqlSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Room> selectRoomByPeople(SqlSession session, int numberOfBeds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Room> selectRoomByRoomName(SqlSession session, String roomName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Room selectRoomByRoomNum(SqlSession session, int roomNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Room> selectRoomBySearch(SqlSession session, String gender, int numberOfGuest, Date checkIn,
			Date checkOut) {
		// TODO Auto-generated method stub
		return null;
	}

}
