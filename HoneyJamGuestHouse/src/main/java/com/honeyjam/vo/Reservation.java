package com.honeyjam.vo;

import java.util.Date;

public class Reservation {
	private int reservationId;
	private String email;
	private Date checkIn;
	private Date checkOut;
	private int numberOfGuests;
	private int roomId;
	private String gender;
	
	private Member member;
	
	public Reservation() {}

	public Reservation(int reservationId, String email, Date checkIn, Date checkOut, int numberOfGuests, int roomId,
			String gender) {
		this.reservationId = reservationId;
		this.email = email;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.numberOfGuests = numberOfGuests;
		this.roomId = roomId;
		this.gender = gender;
	}

	public Reservation(int reservationId, String email, Date checkIn, Date checkOut, int numberOfGuests, int roomId,
			String gender, Member member) {
		this.reservationId = reservationId;
		this.email = email;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.numberOfGuests = numberOfGuests;
		this.roomId = roomId;
		this.gender = gender;
		this.member = member;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getNumberOfGuests() {
		return numberOfGuests;
	}

	public void setNumberOfGuests(int numberOfGuests) {
		this.numberOfGuests = numberOfGuests;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Reservation [reservationId=" + reservationId + ", email=" + email + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + ", numberOfGuests=" + numberOfGuests + ", roomId=" + roomId + ", gender="
				+ gender + ", member=" + member + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkIn == null) ? 0 : checkIn.hashCode());
		result = prime * result + ((checkOut == null) ? 0 : checkOut.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + numberOfGuests;
		result = prime * result + reservationId;
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
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (numberOfGuests != other.numberOfGuests)
			return false;
		if (reservationId != other.reservationId)
			return false;
		if (roomId != other.roomId)
			return false;
		return true;
	}

	

	
	
}
