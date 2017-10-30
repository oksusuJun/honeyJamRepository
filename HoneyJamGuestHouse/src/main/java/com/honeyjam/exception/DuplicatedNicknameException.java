package com.honeyjam.exception;

public class DuplicatedNicknameException extends Exception {
	
	private String duplicatedNickname;
	public DuplicatedNicknameException() {}
	public DuplicatedNicknameException(String message){
		super(message);
	}
	public DuplicatedNicknameException(String message, String duplicatedNickname) {
		super(message);
		this.duplicatedNickname = duplicatedNickname;
	}
	public String getDuplicateNickname() {
		return duplicatedNickname;
	}
}
