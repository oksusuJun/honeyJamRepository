package com.honeyjam.vo;

import java.io.Serializable;
import java.util.Date;

public class Reservation implements Serializable{
	
	private int reservationId;
	private String memberId;
	private Date checkIn, checkOut;
	private int numberOfGuest;
	private int roomNo;
	private String gender;
	private int paymentStatus;
	
	private Room room;
	
	public Room getRoom() {
		return room;
	}
	
	public void setRoom(Room room) {
		this.room = room;
	}
	
	public Reservation() {}
	
	public Reservation(int reservationId, String memberId, Date checkIn, Date checkOut, int numberOfGuest, int roomNo, String gender, int paymentStatue) {
		this.reservationId = reservationId;
		this.memberId = memberId;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.numberOfGuest = numberOfGuest;
		this.roomNo = roomNo;
		this.gender = gender;
		this.paymentStatus = paymentStatue;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getNumberOfGuest() {
		return numberOfGuest;
	}

	public void setNumberOfGuest(int numberOfGuest) {
		this.numberOfGuest = numberOfGuest;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", memberId=" + memberId + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", numberOfGuest=" + numberOfGuest + ", roomNo=" + roomNo + ", gender="
				+ gender + ", paymentStatus=" + paymentStatus + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkIn == null) ? 0 : checkIn.hashCode());
		result = prime * result + ((checkOut == null) ? 0 : checkOut.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + numberOfGuest;
		result = prime * result + paymentStatus;
		result = prime * result + reservationId;
		result = prime * result + roomNo;
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
		Reservation other = (Reservation) obj;
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
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (numberOfGuest != other.numberOfGuest)
			return false;
		if (paymentStatus != other.paymentStatus)
			return false;
		if (reservationId != other.reservationId)
			return false;
		if (roomNo != other.roomNo)
			return false;
		return true;
	}
	
}
