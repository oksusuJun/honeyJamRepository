package com.honeyjam.vo;

import java.io.Serializable;
import java.util.List;

public class Member implements Serializable {

	private String email;
	private String password;
	private String nickname;
	private String phoneNum;
	private int admin;
	private List<Reservation> reservationList;
	
	public Member() {}

	public Member(String id, String password, String nickname, String phoneNum, int admin) {
		this.email = id;
		this.password = password;
		this.nickname = nickname;
		this.phoneNum = phoneNum;
		this.admin = admin;
	}
	
	

	public Member(String email, String password, String nickname, String phoneNum, int admin,
			List<Reservation> reservationList) {
		this.email = email;
		this.password = password;
		this.nickname = nickname;
		this.phoneNum = phoneNum;
		this.admin = admin;
		this.reservationList = reservationList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	

	public List<Reservation> getReservationList() {
		return reservationList;
	}

	public void setReservationList(List<Reservation> reservationList) {
		this.reservationList = reservationList;
	}

	@Override
	public String toString() {
		return String.format("Member [email=%s, password=%s, nickname=%s, phoneNum=%s, admin=%s, reservationList=%s]",
				email, password, nickname, phoneNum, admin, reservationList);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + admin;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((reservationList == null) ? 0 : reservationList.hashCode());
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
		Member other = (Member) obj;
		if (admin != other.admin)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (reservationList == null) {
			if (other.reservationList != null)
				return false;
		} else if (!reservationList.equals(other.reservationList))
			return false;
		return true;
	}

	
	
	
}
