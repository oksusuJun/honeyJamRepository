package com.honeyjam.vo;

import java.io.Serializable;
import java.util.Date;

public class ReservedRoom implements Serializable{

	private int roomId;
	private int numberOfBeds;
	private Date checkIn;
	private Date checkOut;
	private String reservationId;
	private String gender;
	
	private Reservation reservation;
	
	public ReservedRoom() {}
	
	public ReservedRoom(int roomId, int numberOfBeds, Date checkIn, Date checkOut, String reservedId, String gender) {
		this.roomId = roomId;
		this.numberOfBeds = numberOfBeds;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.reservationId = reservedId;
		this.gender = gender;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getNumberOfBeds() {
		return numberOfBeds;
	}

	public void setNumberOfBeds(int numberOfBeds) {
		this.numberOfBeds = numberOfBeds;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getReservationId() {
		return reservationId;
	}

	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "ReservedRoom [roomId=" + roomId + ", numberOfBeds=" + numberOfBeds + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", reservationId=" + reservationId + ", gender=" + gender + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkIn == null) ? 0 : checkIn.hashCode());
		result = prime * result + ((checkOut == null) ? 0 : checkOut.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + numberOfBeds;
		result = prime * result + ((reservationId == null) ? 0 : reservationId.hashCode());
		result = prime * result + roomId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReservedRoom other = (ReservedRoom) obj;
		if (checkIn == null) {
			if (other.checkIn != null)
				return false;
		} else if (!checkIn.equals(other.checkIn))
			return false;
		if (checkOut == null) {
			if (other.checkOut != null)
				return false;
		} else if (!checkOut.equals(other.checkOut))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (numberOfBeds != other.numberOfBeds)
			return false;
		if (reservationId == null) {
			if (other.reservationId != null)
				return false;
		} else if (!reservationId.equals(other.reservationId))
			return false;
		if (roomId != other.roomId)
			return false;
		return true;
	}

}

