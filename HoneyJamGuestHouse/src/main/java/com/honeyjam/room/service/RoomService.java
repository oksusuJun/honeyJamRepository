package com.honeyjam.room.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.honeyjam.vo.Room;

public interface RoomService {
	
	/*
	 * 구현해야할 기능
	 *  1. 검색된 내용을 빼고 나머지 예약가능한 방 출력
	 *  2. 방 정보 수정
	 *  3. 저장된 모든 방 정보 알려주는 메소드
	 *  4. 저장된 방 중 방 이름으로 찾아주는 메소드
	 *  5. 방 번호(PK)로 찾아주는 메소드
	 */
	
	/** 2.
	 * 방 정보 수정
	 * (저장된 방만을 가지고 할 것이기 때문에 NotFoundException 등은 던지지 않음)
	 * @param room
	 */
	void updateRoom(Room room);
	
	/** 3.
	 * 저장된 모든 방의 정보를 알려주는 메소드
	 * @return
	 */
	List<Room> getRoomList();
	
	/**
	 * 4.
	 * 방 이름으로 찾아주는 메소드
	 * @param roomName
	 * @return
	 */
	List<Room> findRoomByRoomName(String roomName);
	
	/**
	 * 5.
	 * 방 ID(PK) 로 찾아주는 메소드
	 * @param roomId
	 * @return
	 */
	Room findRoomByRoomId(int roomId);
	
	List<Room> findAvailableRoomByGender(String gender);
	
	//검색된 내용을 빼고 나머지 예약가능한 방 출력
	List<Room> searchRoomReservation(String gender, Integer numberOfGuest, Date checkIn, Date checkOut);
	
	
	

}
