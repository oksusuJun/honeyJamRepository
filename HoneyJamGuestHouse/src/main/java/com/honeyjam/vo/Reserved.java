package com.honeyjam.vo;

import java.io.Serializable;

public class Reserved implements Serializable{
	private int roomId;
	private int numberOfRooms;
	private String status;
	private int reservationId;
	
	private Reservation reservation;
	
	public Reserved() {}

	public Reserved(int roomId, int numberOfRooms, String status, int reservationId) {
		this.roomId = roomId;
		this.numberOfRooms = numberOfRooms;
		this.status = status;
		this.reservationId = reservationId;
	}

	public Reserved(int roomId, int numberOfRooms, String status, int reservationId, Reservation reservation) {
		this.roomId = roomId;
		this.numberOfRooms = numberOfRooms;
		this.status = status;
		this.reservationId = reservationId;
		this.reservation = reservation;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public int getNumberOfRooms() {
		return numberOfRooms;
	}

	public void setNumberOfRooms(int numberOfRooms) {
		this.numberOfRooms = numberOfRooms;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getReservationId() {
		return reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	@Override
	public String toString() {
		return "Reserved [roomId=" + roomId + ", numberOfRooms=" + numberOfRooms + ", status=" + status
				+ ", reservationId=" + reservationId + ", reservation=" + reservation + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + numberOfRooms;
		result = prime * result + ((reservation == null) ? 0 : reservation.hashCode());
		result = prime * result + reservationId;
		result = prime * result + roomId;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Reserved other = (Reserved) obj;
		if (numberOfRooms != other.numberOfRooms)
			return false;
		if (reservation == null) {
			if (other.reservation != null)
				return false;
		} else if (!reservation.equals(other.reservation))
			return false;
		if (reservationId != other.reservationId)
			return false;
		if (roomId != other.roomId)
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
}
