package com.honeyjam.exception;

public class DuplicatedPhoneException extends Exception{

	private String duplicatedPhone;
	public DuplicatedPhoneException(){}
	public DuplicatedPhoneException(String message){
		super(message);
	}
	public DuplicatedPhoneException(String message, String duplicatedPhone) {
		super(message);
		this.duplicatedPhone = duplicatedPhone;
	}
	public String getDuplicatedPhone() {
		return duplicatedPhone;
	}
	
	
}
