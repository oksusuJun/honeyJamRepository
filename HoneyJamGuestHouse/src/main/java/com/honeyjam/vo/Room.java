package com.honeyjam.vo;

import java.io.Serializable;

public class Room implements Serializable {

	private int roomId;
	private String roomName;
	private String gender;
	private String status;
	private int maxBed;
	private int availableBed;
	private int price;
	
	public Room() {}
	
	public Room(int roomId, String roomName, String gender, String status, int maxBed, int availableBed, int price) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.gender = gender;
		this.status = status;
		this.maxBed = maxBed;
		this.availableBed = availableBed;
		this.price = price;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMaxBed() {
		return maxBed;
	}

	public void setMaxBed(int maxBed) {
		this.maxBed = maxBed;
	}

	public int getAvailableBed() {
		return availableBed;
	}

	public void setAvailableBed(int availableBed) {
		this.availableBed = availableBed;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", gender=" + gender + ", status=" + status
				+ ", maxBed=" + maxBed + ", availableBed=" + availableBed + ", price=" + price + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + availableBed;
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + maxBed;
		result = prime * result + price;
		result = prime * result + roomId;
		result = prime * result + ((roomName == null) ? 0 : roomName.hashCode());
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
		Room other = (Room) obj;
		if (availableBed != other.availableBed)
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (maxBed != other.maxBed)
			return false;
		if (price != other.price)
			return false;
		if (roomId != other.roomId)
			return false;
		if (roomName == null) {
			if (other.roomName != null)
				return false;
		} else if (!roomName.equals(other.roomName))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	
	
}
