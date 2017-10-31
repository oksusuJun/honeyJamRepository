package com.honeyjam.room.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.honeyjam.vo.ReservedRoom;
import com.honeyjam.vo.Room;

public interface RoomDao {

	/**
	 * 방 전체 조회
	 * @param session
	 * @return
	 */
	List<Room> selectAllRoom(SqlSession session);
	
	/**
	 * 인원수로 방 조회
	 * @param session
	 * @param numberOfBeds
	 * @return
	 */
	List<Room> selectRoomByPeople(SqlSession session, int numberOfBeds);
	
	/**
	 * 방 이름으로 방 조회
	 * @param session
	 * @param roomName
	 * @return
	 */
	List<Room> selectRoomByRoomName(SqlSession session, String roomName);
	
	/**
	 * 방번호(PK) 로 방 조회
	 * @param session
	 * @param roomNum
	 * @return
	 */
	Room selectRoomByRoomNum(SqlSession session, int roomNum);
	
	/**
	 * 
	 * @param session
	 * @param gender
	 * @return
	 */
	List<Room> selectAvailableRoomByGender(SqlSession session, String gender);
	
	
	
	
	/**
	 * 전달받은 검색조건 으로 방 조회
	 * Service 에서 나머지 제약조건 추가
	 * @param session
	 * @param reservation
	 * @return
	 */
	List<Room> selectRoomBySearch(SqlSession session, String gender, Integer numberOfGuest, Date checkIn, Date checkOut);
	
	/*
	1. == null -> 해당조건으로 예약된 방 없음 => 예약가능
	2. != null -> 해당 조건으로 예약된 방 있음
		2-1. 예약된 방의 available_bed - 예약된 내용(인원)number_of_beds = a
				a >= numberOfGuest -> 예약가능
				a < numberOfGuest -> 예약불가
	*/
	
	
	List<ReservedRoom> selectReservedRoomId(SqlSession session, String gender, Date checkIn, Date checkOut);
	
	
	
}
