package com.honeyjam.vo;

import java.io.Serializable;
import java.util.Date;

public class Board implements Serializable{
	
	private int itemNum;
	private String content;
	private String title;
	private Date writeDate;
	private String email;
	
	private Member member;
	
	public Board() {}

	public Board(int itemNum, String content, String title, Date writeDate, String email) {
		this.itemNum = itemNum;
		this.content = content;
		this.title = title;
		this.writeDate = writeDate;
		this.email = email;
	}

	public Board(int itemNum, String content, String title, Date writeDate, String email, Member member) {
		this.itemNum = itemNum;
		this.content = content;
		this.title = title;
		this.writeDate = writeDate;
		this.email = email;
		this.member = member;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return String.format("Board [itemNum=%s, content=%s, title=%s, writeDate=%s, email=%s, member=%s]", itemNum,
				content, title, writeDate, email, member);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + itemNum;
		result = prime * result + ((member == null) ? 0 : member.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((writeDate == null) ? 0 : writeDate.hashCode());
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
		Board other = (Board) obj;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (itemNum != other.itemNum)
			return false;
		if (member == null) {
			if (other.member != null)
				return false;
		} else if (!member.equals(other.member))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (writeDate == null) {
			if (other.writeDate != null)
				return false;
		} else if (!writeDate.equals(other.writeDate))
			return false;
		return true;
	}
	
	

	
	
	
	

}
